//
//  TodayViewController.m
//  omer extension
//
//  Created by Yaakov Gamliel on 4/21/15.
//  Copyright (c) 2015 Yaakov Gamliel. All rights reserved.
//

#import "G2OTodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <KosherCocoaKit/KCSefiratHaomerCalculator.h>

@interface G2OTodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *omerCountLabel;

@end

@implementation G2OTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    _omerCountLabel.text = @"היום שלושה עשר יום, שהם שבוע אחד ושישה ימים בעומר";
    
    NSInteger dayOfSefira = [self sfiraCount];
    
    self.omerCountLabel.text  = [KCSefiratHaomerCalculator countLabelProviderForCount:dayOfSefira];
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    
    return UIEdgeInsetsZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    NSInteger dayOfSefira = [self sfiraCount];
    
    self.omerCountLabel.text  = [KCSefiratHaomerCalculator countLabelProviderForCount:dayOfSefira];
    
    
    completionHandler(NCUpdateResultNewData);
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
