//
//  RACCommand+ANAdditions.h
//  ShipMate
//
//  Created by Oksana Kovalchuk on 6/7/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "RACCommand.h"
#import "ANHelperFunctions.h"

@interface RACCommand (ANAdditions)

/**
 *  Creates RACComand* with empty signal, just for block execution
 *
 *  @param block ANCodeBlock for execution on command execution
 *
 *  @return RACCommand* instance
 */
+ (RACCommand*)commandWithBlock:(ANCodeBlock)block;

/**
 *  Creates RACCommand with specified signal
 *
 *  @param signal RACSignal to fire on command execution
 *
 *  @return RACCommand* instance with predefined signal
 */
+ (RACCommand*)commandWithSignal:(RACSignal*)signal;

@end
