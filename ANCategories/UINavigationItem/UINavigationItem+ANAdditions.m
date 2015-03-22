//
//  UINavigationItem+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 22.03.14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "UINavigationItem+ANAdditions.h"
#import "RACCommand+ANAdditions.h"
#import "UIViewController+ANAdditions.h"
#import "UIBarButtonItem+ANAdditions.h"

static CGFloat const kNegativeSpacer = -11;

@implementation UINavigationItem (ANAdditions)

- (void)an_addCloseButtonItemWithModalVC:(UIViewController*)vc
{
    RACCommand *closeVC = [RACCommand commandWithBlock:^{
        [vc an_dismissAsModal];
    }];
    UIBarButtonItem* close = [UIBarButtonItem an_itemWithType:ANBarButtonTypeClose command:closeVC];
    [vc.navigationItem an_addLeftBarButtonItem:close];
}

- (void)an_addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = kNegativeSpacer;
    [self setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, leftBarButtonItem, nil]];
}

- (void)an_addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = kNegativeSpacer;
    [self setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, rightBarButtonItem, nil]];
}

@end
