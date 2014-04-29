//
//  CoursePageViewController.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/26/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface CoursePageViewController : UIViewController

@property (strong, nonatomic) NSDictionary *courseToShow;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *instructorLabel;
@property (strong, nonatomic) NSArray *storedSearch;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) IBOutlet UIButton *shoppingCartButton;
@property (strong, nonatomic) IBOutlet UIButton *checkButton;


- (IBAction)addToShoppingCart:(id)sender;
-(void)setCourseToShow:(NSDictionary *)courseToShow;
-(void)setStoredSearch:(NSArray *)storedSearch;
- (IBAction)popUpMenu:(id)sender;
-(void)setUser:(User *)user;
- (IBAction)removeClass:(id)sender;



@end
