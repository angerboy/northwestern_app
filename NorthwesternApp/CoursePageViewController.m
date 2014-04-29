//
//  CoursePageViewController.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/26/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "CoursePageViewController.h"
#import "SearchClassesViewController.h"
#import "AcademicsViewController.h"

@interface CoursePageViewController ()
@property (strong, nonatomic) IBOutlet UILabel *header;
@property (strong, nonatomic) IBOutlet UILabel *roomLabel;
@property (strong, nonatomic) IBOutlet UILabel *meetsLabel;
@property (strong, nonatomic) IBOutlet UILabel *requirementsLabel;

@end

@implementation CoursePageViewController

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
    
    NSMutableArray *shoppingCart = [self.user getShoppingCart];
    if([shoppingCart containsObject:self.courseToShow]) {
        self.shoppingCartButton.hidden = YES;
        self.checkButton.hidden = NO;
    } else {
        self.shoppingCartButton.hidden = NO;
        self.checkButton.hidden = YES;
    }
    self.header.adjustsFontSizeToFitWidth = YES;
    self.header.text = [[self.courseToShow objectForKey:@"term"] stringByAppendingString:@" Course"];
    
    if(!([self.courseToShow objectForKey:@"meeting_days"] == [NSNull null])) {
        self.meetsLabel.text = [self.courseToShow objectForKey:@"meeting_days"];
    } else {
       self.meetsLabel.text = @"Not available";
    }
    self.meetsLabel.adjustsFontSizeToFitWidth = YES;
    
    
    if(!([self.courseToShow objectForKey:@"requirements"] == [NSNull null])) {
        self.requirementsLabel.text = [self.courseToShow objectForKey:@"requirements"];
    } else {
        self.requirementsLabel.text = @"None";
    }
    
    self.roomLabel.text = [self.courseToShow objectForKey:@"room"];
    self.roomLabel.adjustsFontSizeToFitWidth = YES;
    
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.instructorLabel.adjustsFontSizeToFitWidth = YES;
    
    self.titleLabel.text = [_courseToShow objectForKey:@"title"];
    self.instructorLabel.text = [[_courseToShow objectForKey:@"instructor"] objectForKey:@"name"];
    
    UIFont *fontReg = [UIFont fontWithName:@"FuturaLT.ttf" size:25.0f];
    //[self.titleLabel setFont:fontReg];
    
    UIFont *fontLight = [UIFont fontWithName:@"Futura-Light.ttf" size:18.0f];
    //[self.instructorLabel setFont:[UIFont fontWithName:@"Futura-Light.ttf" size:18.0f]];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeRight)];
    [self.view addGestureRecognizer:swipeRight];

}

-(void)handleSwipeRight {
    [self performSegueWithIdentifier:@"backToSearch" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setStoredSearch:(NSArray *)storedSearch {
    _storedSearch = storedSearch;
}

- (IBAction)popUpMenu:(id)sender {
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"backToSearch"]) {
        SearchClassesViewController *searchClasses = [[SearchClassesViewController alloc]init];
        searchClasses = segue.destinationViewController;
        [searchClasses setTotalSearchArray:self.storedSearch];
        [searchClasses setUser:self.user];
    }
}

-(void)setUser:(User *)user {
    _user = user;
}

- (IBAction)removeClass:(id)sender {
    self.checkButton.hidden = YES;
    self.shoppingCartButton.hidden = NO;
    [self.user removeItemFromShoppingCart:self.courseToShow];
}

- (IBAction)addToShoppingCart:(id)sender {
    self.shoppingCartButton.hidden = YES;
    self.checkButton.hidden = NO;
    NSMutableArray *sc = [self.user getShoppingCart];
    if(sc == nil)
        sc = [[NSMutableArray alloc] init];
    [sc addObject:self.courseToShow];
    [self.user setShoppingCart:sc];
}
@end
