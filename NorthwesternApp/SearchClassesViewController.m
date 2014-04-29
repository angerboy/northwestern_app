//
//  SearchClassesViewController.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/25/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "SearchClassesViewController.h"
#import "AcademicsViewController.h"


@implementation SearchClassesViewController 


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.termTextField.delegate = self;
    self.searchTableView.delegate = self;
    self.subjectTextField.delegate = self;
    self.searchTableView.dataSource = self;
    self.searchBar.delegate = self;
    self.termTextField.inputView = self.termPickerView;
    self.subjectTextField.inputView = self.subjectPickerView;
    self.searchTableView.hidden = YES;
    self.menuController = [[MenuViewController alloc] init];
    
   
    
    if(_totalSearchArray != nil) {
        self.termTextField.text = [_totalSearchArray objectAtIndex:0];
        self.subjectTextField.text = [_totalSearchArray objectAtIndex:1];
        self.searchResultsArray = [_totalSearchArray objectAtIndex:2];
        self.searchTableView.hidden = NO;
        [self.searchTableView reloadData];
    }
    
    self.termPickerView.hidden = YES;
    self.subjectPickerView.hidden = YES;
    self.termChoices = [[NSArray alloc] initWithObjects:@"Summer 2014", @"Spring 2014", @"Fall 2014", nil];
    self.termCodes = [[NSArray alloc] initWithObjects:@"4550", @"4540", @"4530", nil];
    self.symbolArray = [[NSMutableArray alloc] init];
    self.currentSubject = [[NSString alloc]init];
    self.currentTerm = [[NSString alloc]init];
    self.currentSubjectSymbol = [[NSString alloc]init];
    self.currentTermCode = [[NSString alloc]init];
    [self sendRequest: @"http://vazzak2.ci.northwestern.edu/subjects" type:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if([pickerView isEqual:self.termPickerView]) {
        return [self.termChoices count];
    } else {
        return [self.pickerViewArray count];
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if([pickerView isEqual:self.termPickerView]) {
        return [self.termChoices objectAtIndex:row];
    } else {
        return [self.pickerViewArray objectAtIndex:row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if([pickerView isEqual:self.termPickerView]) {
        self.termTextField.text = [self.termChoices objectAtIndex:row];
        self.currentTerm = [self.termChoices objectAtIndex:row];
        self.currentTermCode = [self.termCodes objectAtIndex:row];
        self.termPickerView.hidden = YES;
        [self.termTextField endEditing:YES];
        if(!([self.subjectTextField.text isEqualToString:@""])) {
            [self searchForSubject];
        }
    } else {
        self.subjectTextField.text = [self.pickerViewArray objectAtIndex:row];
        self.currentSubject = [self.pickerViewArray objectAtIndex:row];
        self.currentSubjectSymbol = [self.symbolArray objectAtIndex:row];
        self.subjectPickerView.hidden = YES;
        [self.subjectTextField endEditing:YES];
        if(!([self.termTextField.text isEqualToString:@""]))
            [self searchForSubject];
    }
}

-(void)searchForSubject {
    NSString *urlString = [[[@"http://vazzak2.ci.northwestern.edu/courses/?term=" stringByAppendingString:self.currentTermCode] stringByAppendingString:@"&subject="] stringByAppendingString:self.currentSubjectSymbol];
    [self sendRequest:urlString type:1];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* tView = (UILabel*)view;
    if (!tView){
        tView = [[UILabel alloc] init];
        // Setup label properties - frame, font, colors etc
        tView.adjustsFontSizeToFitWidth = YES;
    }
    // Fill the label text here
    if([pickerView isEqual:self.termPickerView]) {
        tView.text = [self.termChoices objectAtIndex:row];
        tView.textColor = [UIColor whiteColor];
    } else {
        tView.text = [self.pickerViewArray objectAtIndex:row];
        tView.textColor = [UIColor whiteColor];
        NSLog(@"subject text");
    }
    return tView;
}

-(void)sendRequest: (NSString *) urlInput type: (NSInteger *) type {
    NSLog(@"send request");
    NSURL *url = [NSURL URLWithString:urlInput];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval: 10.0]; // Will timeout after 10 seconds
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               if (data != nil && error == nil)
                               {
                                   NSLog(@"success");
                                   // It worked, your source HTML is in sourceHTML
                                   if(type == 0) {
                                       [self handleData:data];
                                   }
                                   else if(type ==1) {
                                       [self buildSearchResults: data];
                                       NSLog(@"build search results");
                                   }
                               }
                               else
                               {
                                   NSLog(@"error here");
                                   // There was an error, alert the user
                                  
                               }
                               
                           }];

}

-(void)buildSearchResults: (NSData *) data {
    NSError *error = nil;
    id object =  [NSJSONSerialization
                  JSONObjectWithData:data
                  options:0
                  error:&error];
    if([object isKindOfClass:[NSArray class]]) {
        self.receivedData = object;
        [self createSearchResultsArray];
    }
}

-(void)createSearchResultsArray {
    NSLog(@"create search array");
    
    self.searchResultsArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [self.receivedData count]; i++) {
        [self.searchResultsArray addObject:[self.receivedData objectAtIndex:i]];
    }
    
    if([self.searchResultsArray count] == 0) {
        [self.searchResultsArray addObject:@"No Classes Found"];
    }
    
    self.searchTableView.hidden = YES;
    [self.searchTableView reloadData];
    self.searchTableView.hidden = NO;
}

-(void)handleData:(NSData *)data {
    if(data == nil) {
        NSLog(@"error");
        return;
    }
    else {
        NSError *error = nil;
        id object =  [NSJSONSerialization
                      JSONObjectWithData:data
                      options:0
                      error:&error];
        if(error) {
            NSLog(@"JSON error");
        }
        if([object isKindOfClass:[NSArray class]]) {
            self.receivedData = object;
            [self createNewArray];
        }
        else {
            NSLog(@"object is not array");
        }
    }
}

-(void)createNewArray {
    NSMutableArray *newArray = [[NSMutableArray alloc]init];
    for(int i = 0; i < [self.receivedData count]; i ++) {
        NSDictionary *arr = [self.receivedData objectAtIndex:i];
        NSString *str = [arr objectForKey:@"name"];
        NSString *symbol = [arr objectForKey:@"symbol"];
        [self.symbolArray addObject:symbol];
        [newArray addObject:str];
    }
    self.pickerViewArray = newArray;
    [self.subjectPickerView reloadAllComponents];
    NSLog(@"new array");
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([textField isEqual:self.termTextField]) {
        self.termPickerView.hidden = NO;
    }
    else {
        self.subjectPickerView.hidden = NO;
    }
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.searchResultsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if([[self.searchResultsArray objectAtIndex:indexPath.row] isKindOfClass:[NSDictionary class]]) {
        cell.textLabel.text = [[self.searchResultsArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    } else {
        cell.textLabel.text = [self.searchResultsArray objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    return cell;
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"finished editing");
    if(searchBar.text != nil && !([searchBar.text isEqualToString: @""]))
        [self refineSearch:searchBar.text];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if(![searchBar isFirstResponder]) {
        self.searchResultsArray = self.oldSearchArray;
        [self.searchTableView reloadData];
    }
}

-(void)refineSearch: (NSString *) input {
    NSLog(@"refine search");
    BestFitSearcher *searcher = [[BestFitSearcher alloc] init];
    self.oldSearchArray = self.searchResultsArray;
    self.searchResultsArray = [searcher returnBestFitSearchArray:self.searchResultsArray input:input];
    self.searchTableView.hidden = NO;
    [self.view addSubview:self.searchTableView];
    if([self.searchResultsArray count] == 0) {
        [self.searchResultsArray addObject:@"No Results"];
    }
    [self.searchTableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(!([self.pickerViewArray count] == 1 && ([[self.pickerViewArray objectAtIndex:0] isEqualToString:@"No Classes Found"] || [[self.pickerViewArray objectAtIndex:0] isEqualToString:@"No Results"]))) {
    self.courseToShow = [self.searchResultsArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"toCourse" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"toCourse"]) {
        self.totalSearchArray = [[NSArray alloc] initWithObjects:self.currentTerm, self.currentSubject, self.searchResultsArray, nil];
    
        CoursePageViewController  *coursePage = [[CoursePageViewController alloc] init];
        coursePage = segue.destinationViewController;
        [coursePage setStoredSearch:self.totalSearchArray];
        [coursePage setCourseToShow:self.courseToShow];
        [coursePage setUser:self.user];
    }
    
    else if([segue.identifier isEqualToString:@"toAcademics"]) {
        AcademicsViewController *academics = [[AcademicsViewController alloc]init];
        academics = segue.destinationViewController;
        [academics setUser:self.user];
    }
}

-(void)setTotalSearchArray:(NSArray *)totalSearchArray {
    _totalSearchArray = totalSearchArray;
}

-(void)setUser:(User *)user {
    _user = user;
}


@end
