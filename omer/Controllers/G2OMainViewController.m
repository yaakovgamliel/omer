//
//  ViewController.m
//  omer
//
//  Created by yaakov gamliel on 4/6/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "G2OMainViewController.h"
//#import "Calendar.h"
#import <KosherCocoaKit/KCSefiratHaomerCalculator.h>

@interface G2OMainViewController ()

@property (strong, nonatomic) IBOutlet UILabel *testlabel;
@property (strong, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayWeekCountLabel;
@property (nonatomic,assign) NSInteger currentCount;

@end

@implementation G2OMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self updateLabels];
    
    [self setupDayWeekLabel];
}

#pragma mark - Helper methods

- (void)setupDayWeekLabel {
    
    NSInteger dayOfSefira = [self sfiraCount];

    NSInteger countDay = dayOfSefira;
    NSInteger weekDay = countDay / 7;
    NSInteger weekDayCount = countDay % 7;
    
    NSString *weekDayString = [NSString stringWithFormat:@"%ld %@ %ld %@",(long)weekDay, NSLocalizedString(@"w", nil),(long)weekDayCount,NSLocalizedString(@"d", nil)];
    
    self.dayWeekCountLabel.text  = weekDayString;
    
}
- (BOOL)shouldUpdate {
    return YES;
}

- (void)updateLabels {
    
    NSInteger dayOfSefira = [self sfiraCount];
    
    NSLog(@"%ld",dayOfSefira);
    self.counterLabel.text = [NSString stringWithFormat:@"%ld",(long)dayOfSefira];

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