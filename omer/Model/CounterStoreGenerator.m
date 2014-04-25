//
//  CounterStoreGenerator.m
//  omer
//
//  Created by yaakov gamliel on 4/25/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "CounterStoreGenerator.h"
#import "Sfirat.h"
#import "CounterModel.h"

@implementation CounterStoreGenerator

- (void)initializeConterKeys {
    
    if (![[NSUserDefaults standardUserDefaults]integerForKey:@"currentCount"]) {
        Sfirat *sfirat = [Sfirat new];
        NSInteger currentDayCount = (NSInteger)[sfirat sfiraTime];
        [[NSUserDefaults standardUserDefaults]setInteger:currentDayCount forKey:@"currentCount"];
    }
    
    if (![[NSUserDefaults standardUserDefaults]integerForKey:@"userCounted"]) {
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"userCounted"];
    }
    
}

//- (NSDictionary *)loadCounterValues {
//    
//    NSInteger count = [[NSUserDefaults standardUserDefaults]integerForKey:@"currentCount"];
//    
//    NSNumber *counter = [NSNumber numberWithLong:count];
//    
//    BOOL action = [[NSUserDefaults standardUserDefaults]integerForKey:@"userCounted"];
//    
//    NSDictionary *values = @{@"count":counter, @"userAction":action};
//}

@end
