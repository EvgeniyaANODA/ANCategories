//
//  UIBarButtonItem+CDIcons.m
//  CtrlDo
//
//  Created by Oksana Kovalchuk on 13/7/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "UIBarButtonItem+ANAdditions.h"
#import "UIButton+RACCommandSupport.h"

@implementation UIBarButtonItem (CDIcons)

+ (UIBarButtonItem *)an_itemWithType:(ANBarButtonType)type command:(RACCommand *)command
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* image = [UIImage imageNamed:imageNameByType(type)];
    CGRect frame = button.frame;
    frame.size = image.size;
    button.frame = frame;
    [button setImage:image forState:UIControlStateNormal];
    button.rac_command = command;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
