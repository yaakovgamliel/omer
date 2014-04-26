//
//  ViewController.m
//  omer
//
//  Created by yaakov gamliel on 4/6/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "ViewController.h"
#import "KKDateFormatter.h"
#import "KKHebrewCalendar.h"
#import "Sfirat.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *testlabel;
@property (strong, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) Sfirat *sfira;
@property (strong, nonatomic) IBOutlet UILabel *dayWeekCountLabel;
@property (nonatomic,assign) NSInteger currentCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.sfira = [Sfirat new];
}


- (void)viewWillAppear:(BOOL)animated {
    NSInteger sfiraTime = [self.sfira sfiraTime];

    if ([self shouldUpdate]) {
        
        
        if ([self.sfira sfiraTime] < 50) {
            NSInteger todayCount = sfiraTime + 1;
            self.counterLabel.text = [NSString stringWithFormat:@"%ld",(long)todayCount];
            
            [self setupDateLabelWithDate:[NSDate dateWithTimeIntervalSinceNow:(60*60*5)]];
            
            self.currentCount = todayCount;
            
        }
        
    } else if ([self.sfira sfiraTime] < 50){
        self.counterLabel.text = [NSString stringWithFormat:@"%ld",(long)sfiraTime];
        [self setupDateLabelWithDate:[NSDate date]];

        self.currentCount = sfiraTime;

        
    } else {
        self.counterLabel.text = @"";
        [self setupDateLabelWithDate:[NSDate date]];        
        [self setupDateLabelWithDate:[NSDate date]];
        self.currentCount = 0;
    }
    
    [self setupDayWeekLabel];
}

#pragma mark - Helper methods

- (void)setupDateLabelWithDate:(NSDate*)date {
    
    NSDate *today = date;
    
    KKDateFormatter *forma = [[KKDateFormatter alloc]init];
    [forma setDateStyle:KKDateFormatterFullHebrewStyle];
    [forma stringFromDate:today];
    
    self.testlabel.text = [forma stringFromDate:today];
    
}

- (void)setupDayWeekLabel {
    if (self.currentCount == 0) {
        return;
    }
    
    NSInteger countDay = self.currentCount;
    NSInteger weekDay = countDay / 7;
    NSInteger weekDayCount = countDay % 7;
    
    NSString *weekDayString = [NSString stringWithFormat:@"%d %@ %d %@",weekDay, NSLocalizedString(@"w", nil),weekDayCount,NSLocalizedString(@"d", nil)];
    
    self.dayWeekCountLabel.text  = weekDayString;
    
}
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