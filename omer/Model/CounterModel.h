//
//  CounterModel.h
//  omer
//
//  Created by yaakov gamliel on 4/25/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CounterModel : NSObject

@property (nonatomic, assign) NSInteger currentCount;
@property (nonatomic, assign, getter = didUserCounte) BOOL userCounted;

- (instancetype)initWithParameters:(NSDictionary*)params;
@end
