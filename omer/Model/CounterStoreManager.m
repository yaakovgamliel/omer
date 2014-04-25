//
//  CounterStoreManager.m
//  omer
//
//  Created by yaakov gamliel on 4/29/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "CounterStoreManager.h"
#import "Sfirat.h"

@interface CounterStoreManager ()
@property (nonatomic, assign, readwrite) NSInteger dayCount;
@end

@implementation CounterStoreManager

+ (instancetype)sharedManager {
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (void)setDayCount:(NSInteger)dayCount {
    if (dayCount >= 49) {
        _dayCount = 49;
    } else {
        _dayCount = dayCount;
    }
}
- (void)updateCount {
    
    Sfirat *sfirat = [Sfirat new];
    
    if ([self shouldUpdate]) {
        NSInteger count = [sfirat sfiraTime] + 1;
        [self setDayCount:count];
    } else {
        NSInteger count = [sfirat sfiraTime];
        [self setDayCount:count];
    }
    
}

#pragma mark - Helper methods

- (BOOL)shouldUpdate {
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components =
    [gregorian components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:today];
    
    NSInteger hour = 0;
    if ([components hour] == 0) {
        hour = 24;
    } else {
        hour = [components hour];
    }
    
    NSInteger minute = [components minute];
    
    if (hour >= 19 && hour < 24 ) {
        if (hour > 19) {
            return YES;
        } else if (minute > 20) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
    
}

@end
