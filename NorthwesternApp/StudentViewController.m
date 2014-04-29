//
//  StudentViewController.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/25/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "StudentViewController.h"
#import "WildCardViewController.h"

@interface StudentViewController ()

@property (strong, nonatomic) UIColor *deepPurple;
@property (strong, nonatomic) UIColor *darkGray;
@property (strong, nonatomic) UIColor *whiteColor;

@end

@implementation StudentViewController

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
    self.user = [[User alloc]init];
    self.menuTable.delegate = self;
    self.menuTable.dataSource = self;
    self.deepPurple = [UIColor colorWithRed:43.0f/255.0f green:37.0f/255.0f blue:47.0f/255.0f alpha:100.0f];
    self.darkGray = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:35.0f/255.0f alpha:100.0f];
    self.whiteColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:100.0f];

    self.menuOptions = [[NSArray alloc] initWithObjects:@"My Academics", @"WildCard", @"Dining", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.menuOptions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //cell.textLabel.textColor = self.whiteColor;
    cell.textLabel.text = [self.menuOptions objectAtIndex:indexPath.row];
    cell.textLabel.textColor = self.whiteColor;
    cell.backgroundColor = self.deepPurple;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch(indexPath.row) {
        case 0: {
            [self performSegueWithIdentifier:@"toAcademics" sender:self];
        }
        case 1: {
            [self performSegueWithIdentifier:@"toWildCard" sender:self];
        }
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toAcademics"]) {
        
        AcademicsViewController *academicsView = [[AcademicsViewController alloc] init];
        academicsView = segue.destinationViewController;
        [academicsView setUser:self.user];
    }
    else if([segue.identifier isEqualToString:@"toWildCard"]) {
        WildCardViewController  *wildCardView = [[WildCardViewController alloc]init];
        wildCardView = segue.destinationViewController;
    }
}

-(void)setUser:(User *)user {
    _user = user;
}


@end
