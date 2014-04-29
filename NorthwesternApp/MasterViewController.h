//
//  MasterViewController.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/25/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "ViewPagerController.h"
#import "User.h"

@interface MasterViewController : ViewPagerController

@property (strong, nonatomic) User *user;

-(void)setUser:(User *)user;

@end
