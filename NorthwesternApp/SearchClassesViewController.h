//
//  SearchClassesViewController.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/25/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoursePageViewController.h"
#import "BestFitSearcher.h"
#include "REFrostedContainerViewController.h"
#import "MenuViewController.h"
#import "User.h"

@interface SearchClassesViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITableViewDataSource, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) NSArray *termChoices;
@property (strong, nonatomic) NSArray *termCodes;
@property (strong, nonatomic) NSArray *subjects;
@property (strong, nonatomic) NSArray *pickerViewArray;
@property (strong, nonatomic) NSString *currentTermCode;
@property (strong, nonatomic) NSString *currentSubjectSymbol;
@property (strong, nonatomic) NSString *currentTerm;
@property (strong, nonatomic) NSString *currentSubject;
@property (strong, nonatomic) IBOutlet UIPickerView *termPickerView;
@property (strong, nonatomic) NSMutableArray *symbolArray;
@property (strong, nonatomic) NSArray *receivedData;
@property (strong, nonatomic) IBOutlet UITextField *subjectTextField;
@property (strong, nonatomic) IBOutlet UITextField *termTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *subjectPickerView;
@property (strong, nonatomic) IBOutlet UITableView *searchTableView;
@property (strong, nonatomic) NSMutableArray *searchResultsArray;
@property (strong, nonatomic) NSMutableArray *oldSearchArray;
@property (strong, nonatomic) NSArray *totalSearchArray;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) UITableView *menuController;
@property (strong, nonatomic) NSDictionary *courseToShow;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) REFrostedViewController *frostedMenu;
@property (strong, nonatomic) MenuViewController *menuView;

-(void)setUser:(User *)user;
-(void)setTotalSearchArray:(NSArray *)totalSearchArray;
- (IBAction)popUpMenu:(id)sender;

@end
