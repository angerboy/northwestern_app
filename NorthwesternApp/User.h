//
//  User.h
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/26/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) NSMutableArray *shoppingCart;
@property (strong, nonatomic) NSMutableArray *enrolledClasses;

-(void)addToShoppingCart:(NSDictionary *)newClass;
-(NSMutableArray *)getShoppingCart;
-(void)removeItemFromShoppingCart: (NSDictionary *)input;
-(void)setUserID:(NSString *)userID;
-(void)setShoppingCart:(NSMutableArray *)shoppingCart;
-(BOOL)isCourseInCart: (NSDictionary *)inputCourse;

@end
