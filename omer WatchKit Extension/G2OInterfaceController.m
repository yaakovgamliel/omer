//
//  InterfaceController.m
//  omer WatchKit Extension
//
//  Created by Yaakov Gamliel on 4/23/15.
//  Copyright (c) 2015 Yaakov Gamliel. All rights reserved.
//

#import "G2OInterfaceController.h"
#import <KosherCocoaKit/KCSefiratHaomerCalculator.h>

@interface G2OInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *dayCountLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *countNusachLabel;

@end


@implementation G2OInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSString *countString = [NSString stringWithFormat:@"%ld",(long)[self sfiraCount]];
    
    UIFont *fontStuff = [UIFont fontWithName:@"Avenir" size:80.f];
    
    NSAttributedString *myAttributedString = [[NSAttributedString alloc]initWithString:countString attributes:@{NSFontAttributeName : fontStuff, NSForegroundColorAttributeName : [UIColor blueColor]}];
    
    [self.dayCountLabel setAttributedText:myAttributedString];
    
    [self.countNusachLabel setText:[KCSefiratHaomerCalculator countLabelProviderForCount:[self sfiraCount]]];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (NSInteger)sfiraCount {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH";
    
    NSDate *currentTime = [NSDate date];
    NSString *currentHour =  [dateFormatter stringFromDate:currentTime];
    
    NSDate *nowDate = [NSDate date];
    
    NSInteger dayOfSefira = [KCSefiratHaomerCalculator dayOfSefiraForDate:nowDate];
    
    if ([currentHour integerValue] >= 20) {
        
        return dayOfSefira + 1;
    }
    
    return dayOfSefira;
}

@end



