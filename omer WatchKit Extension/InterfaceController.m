//
//  InterfaceController.m
//  omer WatchKit Extension
//
//  Created by Yaakov Gamliel on 4/23/15.
//  Copyright (c) 2015 Yaakov Gamliel. All rights reserved.
//

#import "InterfaceController.h"
#import <KosherCocoaKit/KCSefiratHaomerCalculator.h>

@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



