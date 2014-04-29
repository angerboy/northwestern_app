//
//  StudentViewController.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/25/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "ViewPagerController.h"
#import "AcademicsViewController.h"
#import "User.h"

@interface StudentViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *studentID;
@property (strong, nonatomic) NSString *netID;
@property (strong, nonatomic) NSArray *menuOptions;
@property (strong, nonatomic) NSMutableArray *menuTitles;
@property (strong, nonatomic) IBOutlet UITableView *menuTable;
@property (strong, nonatomic) User *user;

-(void)setUser:(User *)user;


@end
