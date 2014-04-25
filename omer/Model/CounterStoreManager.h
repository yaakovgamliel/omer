//
//  CounterStoreManager.h
//  omer
//
//  Created by yaakov gamliel on 4/29/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CounterStoreManager : NSObject

@property (nonatomic, assign, readonly) NSInteger dayCount;

+ (instancetype)sharedManager;
- (void)updateCount;

@end
