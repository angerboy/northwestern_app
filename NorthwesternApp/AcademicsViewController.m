//
//  AcademicsViewController.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/25/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "AcademicsViewController.h"

@interface AcademicsViewController ()

@end

@implementation AcademicsViewController

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
    
    self.academicsTableView.delegate = self;
    self.academicsTableView.dataSource = self;
    self.academicOptions = [[NSArray alloc] initWithObjects:@"Class Search", @"Shopping Cart", @"Transcript", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.academicOptions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [self.academicOptions objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:43.0f/255.0f green:33.0f/255.0f blue:35.0f/255.0f alpha:100.0f];
    cell.textLabel.textColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:100.0f];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    switch (indexPath.row) {
        case 0: {
            [self performSegueWithIdentifier:@"toClassSearch" sender:self];
        }
        case 1: {
            [self performSegueWithIdentifier:@"toShoppingCart" sender:self];
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toClassSearch"]) {
        SearchClassesViewController *searchClasses = [[SearchClassesViewController alloc]init];
        searchClasses = segue.destinationViewController;
        [searchClasses setUser:self.user];
    }
    else if([segue.identifier isEqualToString:@"toShoppingCart"]) {
        ShoppingCartViewController *shoppingCart = [[ShoppingCartViewController alloc]init];
        shoppingCart = segue.destinationViewController;
        [shoppingCart setUser:self.user];
    }
}

-(void)setUser:(User *)user {
    _user = user;
}

@end
