//
//  ShoppingCartViewController.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/26/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ShoppingCartViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *shoppingCartTable;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) NSDictionary *courseToShow;

-(void)setCourseToShow:(NSDictionary *)courseToShow;
-(void)setUser:(User *)user;

@end
