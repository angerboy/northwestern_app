//
//  BestFitSearcher.m
//  NorthwesternApp
//
//  Created by Matthew Ehinger on 4/26/14.
//  Copyright (c) 2014 Matthew Ehinger. All rights reserved.
//

#import "BestFitSearcher.h"

@implementation BestFitSearcher

-(NSMutableArray *)returnBestFitSearchArray:(NSMutableArray *)set input:(NSString *)keyword {
    
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [set count]; i++) {
        NSString *checkTitle = [[set objectAtIndex:i] objectForKey:@"title"];
        NSString *checkAuthor = [[[set objectAtIndex:i] objectForKey:@"instructor"] objectForKey:@"name"];
        if (!([checkTitle rangeOfString:keyword options:NSCaseInsensitiveSearch].location == NSNotFound) || !([checkAuthor rangeOfString:keyword options:NSCaseInsensitiveSearch].location == NSNotFound)) {
            [newArray addObject:[set objectAtIndex:i]];
        }
    }
    
    return newArray;
}

@end
