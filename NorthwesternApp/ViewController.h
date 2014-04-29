//
//  ViewController.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/21/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *idInput;
@property (strong, nonatomic) IBOutlet UITextField *passwordInput;
@property (strong, nonatomic) User *user;

-(void)setUser:(User *)user;

@end
