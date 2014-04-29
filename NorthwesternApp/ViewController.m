//
//  ViewController.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/21/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "ViewController.h"
#import "MasterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"login"]) {
        
        [self.user setUserID:self.idInput.text];
        MasterViewController *menuView = [[MasterViewController alloc]init];
        menuView = segue.destinationViewController;
       
    }
}

-(void)setUser:(User *)user {
    _user = user;
}

@end
