//
//  Sfarat.m
//  omer
//
//  Created by yaakov gamliel on 4/10/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "Sfirat.h"
#import "KKDateFormatter.h"

@implementation Sfirat

- (NSInteger)sfiraTime {
    
    NSDate *today = [NSDate date];
    
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [calendar components:NSDayCalendarUnit
                                               fromDate:[self sfiratStartDate]
                                                 toDate:today
                                                         options:0];
    
    NSLog(@"hoour %d",components.hour);
    
    return components.day;

}
#pragma mark -helper methods

- (NSDate *)sfiratStartDate {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:15];
    [comps setMonth:4];
    [comps setYear:2014];
    
    NSCalendar *hebrewCalendar = [[NSCalendar alloc]
                                  initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate *date = [hebrewCalendar dateFromComponents:comps];
    
    return date;
}

@end
