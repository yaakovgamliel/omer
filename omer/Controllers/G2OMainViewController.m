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

@property (strong, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayWeekCountLabel;
@property (weak, nonatomic) IBOutlet UIView *brachaViewContainer;
@property (nonatomic,assign) NSInteger currentCount;

@end

@implementation G2OMainViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)animateBracheView {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self animateDesignedViewsLayer:nil];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self animateDesignedViewsLayer:nil];
    });
}
- (void)animateDesignedViewsLayer:(CALayer *)viewLayer {
    
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D forward = CATransform3DMakeScale(1.2, 1.2, 1);
    CATransform3D  back = CATransform3DMakeScale(0.8, 0.8, 1);
    CATransform3D forwardAgain = CATransform3DMakeScale(1.1, 1.1, 1);
    CATransform3D backAgain = CATransform3DMakeScale(0.9, 0.9, 1);
    
    [bounce setValues:[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DIdentity],[NSValue valueWithCATransform3D:forward],[NSValue valueWithCATransform3D:back],[NSValue valueWithCATransform3D:forwardAgain],[NSValue valueWithCATransform3D:backAgain], nil]];
    bounce.duration = 0.35;
    
    [self.brachaViewContainer.layer addAnimation:bounce forKey:@"tranform"];
    [self.brachaViewContainer.layer addAnimation:bounce forKey:@"transform"];
    
    [self.dayWeekCountLabel.layer addAnimation:bounce forKey:@"tranform"];
    [self.dayWeekCountLabel.layer addAnimation:bounce forKey:@"transform"];
    
//    [viewLayer addAnimation:bounce forKey:@"tranform"];
//    [viewLayer addAnimation:bounce forKey:@"transform"];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self updateLabels];
    
    [self setupDayWeekLabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(animateDesignedViewsLayer:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [self animateDesignedViewsLayer];
}
#pragma mark - Helper methods

- (void)setupDayWeekLabel {
    
    NSInteger dayOfSefira = [self sfiraCount];
    
    self.dayWeekCountLabel.text  = [KCSefiratHaomerCalculator countLabelProviderForCount:dayOfSefira];
}

- (BOOL)shouldUpdate {
    return YES;
}

- (void)updateLabels {
    
    NSInteger dayOfSefira = [self sfiraCount];
    
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