//
//  ShoppingCartViewController.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/26/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "CoursePageViewController.h"
#import "AcademicsViewController.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController

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
    
    self.shoppingCartTable.delegate = self;
    self.shoppingCartTable.dataSource = self;
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeRight)];
    [self.view addGestureRecognizer:swipeRight];
}

-(void)handleSwipeRight {
    UIViewController *presentingVC = self.presentingViewController;
    if([presentingVC isKindOfClass:[AcademicsViewController class]]) {
        [self performSegueWithIdentifier:@"backToAcademics" sender:self];
    }
    else {
        [self performSegueWithIdentifier:@"toCoursePage" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUser:(User *)user {
    _user = user;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toCoursePage"]) {
        CoursePageViewController *coursePage = [[CoursePageViewController alloc] init];
        coursePage = segue.destinationViewController;
        [coursePage setUser:self.user];
        [coursePage setCourseToShow:self.courseToShow];
    }
    else if([segue.identifier isEqualToString:@"backToAcademics"]) {
        AcademicsViewController *academicsView = [[AcademicsViewController alloc] init];
        academicsView = segue.destinationViewController;
        [academicsView setUser:self.user];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.user getShoppingCart] count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [[[self.user getShoppingCart] objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.backgroundColor = [UIColor colorWithRed:43.0f/255.0f green:33.0f/255.0f blue:35.0f/255.0f alpha:100.0f];
    cell.textLabel.textColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:100.0f];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    self.courseToShow = [[self.user getShoppingCart] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"toCoursePage" sender:self];
}

-(void)setCourseToShow:(NSDictionary *)courseToShow {
    self.courseToShow = courseToShow;
}



@end
