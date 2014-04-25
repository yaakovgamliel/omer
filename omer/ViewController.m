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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    //
    NSDate *today = [NSDate date];
    KKDateFormatter *forma = [[KKDateFormatter alloc]init];
    [forma setDateStyle:KKDateFormatterFullHebrewStyle];
    [forma stringFromDate:today];
    NSLog(@"%@",[forma stringFromDate:today]);
    
    self.testlabel.text = [forma stringFromDate:today];
    
    
    Sfirat *pepe = [Sfirat new];
    [pepe sfiraTime];
    
    NSLog(@"today is %d",[pepe sfiraTime]);
    
    self.counterLabel.text = [NSString stringWithFormat:@"%d",[pepe sfiraTime]];
    
}

@end