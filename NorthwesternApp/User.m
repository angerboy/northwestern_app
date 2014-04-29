//
//  User.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/26/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "User.h"

@implementation User


-(void)addToShoppingCart:(NSDictionary *)newClass {
    NSLog(@"is this called?");
    if(_shoppingCart == nil) {
        _shoppingCart = [[NSMutableArray alloc]init];
    }
    
    [_shoppingCart addObject:newClass];
}

-(NSMutableArray *)getShoppingCart {
    return _shoppingCart;
}

-(void)removeItemFromShoppingCart:(NSDictionary *)input {
    [_shoppingCart removeObject: input];
}

-(void)setUserID:(NSString *)userID {
    _userID = userID;
}

-(BOOL)isCourseInCart: (NSDictionary *)inputCourse {
    NSLog(@"check");
    return [_shoppingCart containsObject:inputCourse];
}

-(void)setShoppingCart:(NSMutableArray *)shoppingCart {
    _shoppingCart = shoppingCart;
}

@end
