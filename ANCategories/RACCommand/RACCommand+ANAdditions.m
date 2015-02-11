//
//  RACCommand+ANAdditions.m
//  ShipMate
//
//  Created by Oksana Kovalchuk on 6/7/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "RACCommand+ANAdditions.h"
#import "RACSignal.h"

@implementation RACCommand (ANAdditions)

+ (RACCommand*)commandWithBlock:(ANCodeBlock)block
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
       
        if (block) block();
        return [RACSignal empty];
    }];
}

+ (RACCommand*)commandWithSignal:(RACSignal*)signal
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return signal;
    }];
}

@end
