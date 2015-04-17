//
//  ViewController.m
//  omer
//
//  Created by yaakov gamliel on 4/6/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "G2OMainViewController.h"
#import "Calendar.h"
#import "KCSefiratHaomerCalculator.h"
#import <AVFoundation/AVFoundation.h>

@interface G2OMainViewController ()

@property (strong, nonatomic) IBOutlet UILabel *testlabel;
@property (strong, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayWeekCountLabel;
@property (nonatomic,assign) NSInteger currentCount;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@end

@implementation G2OMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self updateLabels];
    
    [self setupDayWeekLabel];
    
    // find movie file
//    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"corn" ofType:@"mov"];
//    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
//    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:[[AVPlayer alloc]initWithURL:movieURL]];
////    self.playerLayer.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height);
//    self.playerLayer.frame = CGRectMake(0,0,400, 1024);
//    self.playerLayer.backgroundColor = (__bridge CGColorRef)([UIColor redColor]);
    
    

    
//    [[NSTimer scheduledTimerWithTimeInterval:0.5
//                                     target:self
//                                   selector:@selector(updateLabels)
//                                   userInfo:nil
//                                    repeats:YES] fire];
//    [self.view.layer addSublayer:self.playerLayer];
//    
//    // loop movie
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(replayMovie:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.playerLayer) {
        [self.playerLayer.player play];
    }
}
//-(AVPlayerLayer*)playerLayer{
//    if(!_playerLayer){
//        
//        // find movie file
//        NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"corn" ofType:@"mov"];
//        NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
//        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:[[AVPlayer alloc]initWithURL:movieURL]];
//        _playerLayer.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
//        [_playerLayer.player play];
//        
//        return _playerLayer;
//    }
//    
//    return _playerLayer;
//}

//-(void)replayMovie:(NSNotification *)notification
//{
//    [self.playerLayer.player play];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//}

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