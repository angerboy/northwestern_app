//
//  MasterViewController.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/25/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "MasterViewController.h"
#import "StudentViewController.h"

@interface MasterViewController ()

@property (strong, nonatomic) NSArray *tabNames;
@property (strong, nonatomic) NSMutableArray *viewControllers;
@property (strong, nonatomic) UIColor *deepPurple;
@property (strong, nonatomic) UIColor *darkGray;
@property (strong, nonatomic) UIColor *whiteColor;
@property (strong, nonatomic) UIStoryboard *storyBoard;

@end

@implementation MasterViewController

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
    
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tabNames = [[NSArray alloc] initWithObjects:@"Maps", @"News", @"Events", @"Athletics", @"Students", @"Shuttles", @"Saferide", nil];
    self.viewControllers = [[NSMutableArray alloc]init];
    [self loadViewControllers];
    
    self.deepPurple = [UIColor colorWithRed:43.0f/255.0f green:37.0f/255.0f blue:47.0f/255.0f alpha:100.0f];
    self.darkGray = [UIColor colorWithRed:36.0f/255.0f green:35.0f/255.0f blue:35.0f/255.0f alpha:100.0f];
    self.whiteColor = [UIColor colorWithRed:246.0f/255.0f green:246.0f/255.0f blue:246.0f/255.0f alpha:100.0f];
    
    self.dataSource = self;
    self.delegate = self;
}

-(void)loadViewControllers {
    StudentViewController *studentView = [self.storyBoard instantiateViewControllerWithIdentifier:@"studentPage"];
    [studentView setUser:self.user];
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for(int i = 0; i < 4; i++) {
        UIViewController *placeHolder = [[UIViewController alloc]init];
        [tempArray addObject:placeHolder];
    }
    
    NSMutableArray *tempArray2 = [[NSMutableArray alloc] init];
    for(int i = 0; i < 2; i++) {
        UIViewController *placeHolder = [[UIViewController alloc]init];
        [tempArray2 addObject:placeHolder];
    }
    
    [self.viewControllers addObjectsFromArray:tempArray];
    [self.viewControllers addObject: studentView];
    [self.viewControllers addObjectsFromArray:tempArray2];
}

#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return 7;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    NSString *tabName = [self.tabNames objectAtIndex:index];
    label.text = tabName;
    [label sizeToFit];
    label.textColor = self.whiteColor;
    
    return label;
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    return [self.viewControllers objectAtIndex:index];
}

#pragma mark - ViewPagerDelegate
- (UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color {

    switch (component) {
        case ViewPagerTabsView:
            return self.deepPurple;
        case ViewPagerContent:
            return self.darkGray;
        default:
            return self.deepPurple;
    }
}

- (CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionCenterCurrentTab:
            return 1.0;

        default:
            return value;
    }
}

-(void)setUser: (User *) user {
    self.user = user;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
