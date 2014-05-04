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
@property (strong, nonatomic) IBOutlet UILabel *dayWeekCountLabel;
@property (nonatomic,assign) NSInteger currentCount;
@property (strong, nonatomic) Sfirat *sfira;

@end

@implementation ViewController

-(void)dealloc {
    self.sfira = nil;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.sfira = [Sfirat new];
    
    [self updateLabels];
    
    [self setupDayWeekLabel];
    
    [[NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(updateLabels)
                                   userInfo:nil
                                    repeats:YES] fire];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.sfira = nil;
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
    
    NSString *weekDayString = [NSString stringWithFormat:@"%ld %@ %ld %@",(long)weekDay, NSLocalizedString(@"w", nil),(long)weekDayCount,NSLocalizedString(@"d", nil)];
    
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
        } else if (minute > 19) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
    
}

- (void)updateLabels {
    
    NSInteger sfiraTime = [self.sfira sfiraTime];
    
    if ([self shouldUpdate]) {
        
        
        if ([self.sfira sfiraTime] < 50) {
            NSInteger todayCount = sfiraTime + 1;
            self.counterLabel.text = [NSString stringWithFormat:@"%ld",(long)todayCount];
            
            [self setupDateLabelWithDate:[NSDate dateWithTimeIntervalSinceNow:(60*60*5)]];
            
            self.currentCount = todayCount;
            
            [self setupDayWeekLabel];
            
        }
        
    } else if ([self.sfira sfiraTime] < 50){
        self.counterLabel.text = [NSString stringWithFormat:@"%ld",(long)sfiraTime];
        [self setupDateLabelWithDate:[NSDate date]];
        
        self.currentCount = sfiraTime;
        
        [self setupDayWeekLabel];

        
        
    } else {
        self.counterLabel.text = @"";
        self.dayWeekCountLabel.text  = @"";
        [self setupDateLabelWithDate:[NSDate date]];
        self.currentCount = 0;
    }
  
}
@end