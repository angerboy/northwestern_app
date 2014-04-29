//
//  AcademicsViewController.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/25/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "SearchClassesViewController.h"
#import "ShoppingCartViewController.h"
#import "User.h"

@interface AcademicsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *academicsTableView;
@property (strong, nonatomic) NSArray *academicOptions;
@property (strong, nonatomic) User *user;

-(void)setUser:(User *)user;

@end
