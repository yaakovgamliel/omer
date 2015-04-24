//
//  NotificationController.m
//  omer WatchKit Extension
//
//  Created by Yaakov Gamliel on 4/23/15.
//  Copyright (c) 2015 Yaakov Gamliel. All rights reserved.
//

#import "G2ONotificationController.h"
#import <KosherCocoaKit/KCSefiratHaomerCalculator.h>


@interface G2ONotificationController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *countNotificationLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *countNusachNotificationLabel;

@end


@implementation G2ONotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    
    [self.countNotificationLabel setText:@"Remember to count the omer!"];
    
    [self.countNusachNotificationLabel setText:[KCSefiratHaomerCalculator countLabelProviderForCount:[self sfiraCount]]];
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a remote notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    
    [self.countNotificationLabel setText:@"Remember to count the omer!"];
    
    [self.countNusachNotificationLabel setText:[KCSefiratHaomerCalculator countLabelProviderForCount:[self sfiraCount]]];


    completionHandler(WKUserNotificationInterfaceTypeCustom);
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



