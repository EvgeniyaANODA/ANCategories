//
//  UIBarButtonItem+CDIcons.h
//  CtrlDo
//
//  Created by Oksana Kovalchuk on 13/7/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "ANBarButtonIconTypeHelper.h"

@class RACCommand;

NSString* imageNameByType(ANBarButtonType);

@interface UIBarButtonItem (ANAdditions)

+ (UIBarButtonItem*)an_itemWithType:(ANBarButtonType)type command:(RACCommand*)command;

@end
