//
//  WildCardViewController.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/26/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface WildCardViewController : UIViewController

@property (strong, nonatomic) User *user;

-(void)setUser:(User *)user;


@end
