//
//  ViewController.m
//  omer
//
//  Created by yaakov gamliel on 4/6/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "ViewController.h"
#import "Calendar.h"
#import "KCSefiratHaomerCalculator.h"


@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *testlabel;
@property (strong, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayWeekCountLabel;
@property (nonatomic,assign) NSInteger currentCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self updateLabels];
    
    [self setupDayWeekLabel];
    
//    [[NSTimer scheduledTimerWithTimeInterval:0.5
//                                     target:self
//                                   selector:@selector(updateLabels)
//                                   userInfo:nil
//                                    repeats:YES] fire];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - Helper methods

- (void)setupDateLabelWithDate:(NSDate*)date {
    
//    NSDate *today = date;
//    
//    KKDateFormatter *forma = [[KKDateFormatter alloc]init];
//    [forma setDateStyle:KKDateFormatterFullHebrewStyle];
//    [forma stringFromDate:today];
    
//    self.testlabel.text = [forma stringFromDate:today];
    
}

- (void)setupDayWeekLabel {

    NSDate *nowDate = [NSDate date];
    
    NSInteger dayOfSefira = [KCSefiratHaomerCalculator dayOfSefiraForDate:nowDate];

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
    
    NSDate *nowDate = [NSDate date];
    
    NSInteger dayOfSefira = [KCSefiratHaomerCalculator dayOfSefiraForDate:nowDate];
    
    NSLog(@"%ld",dayOfSefira);
    self.counterLabel.text = [NSString stringWithFormat:@"%ld",(long)dayOfSefira];

}
@end