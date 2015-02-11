//
//  UIAlertView+ANAdditions.m
//  ShipMate
//
//  Created by Oksana Kovalchuk on 5/7/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "UIAlertView+ANAdditions.h"
#import "ReactiveCocoa.h"

@implementation UIAlertView (ANAdditions)

#pragma mark - Localized Alerts

+ (UIAlertView *)an_localizedAlertWithTitle:(NSString*)title message:(NSString*)message
{
    return [[UIAlertView alloc] initWithTitle:NSLocalizedString(title, nil)
                                      message:NSLocalizedString(message, nil)
                                     delegate:nil
                            cancelButtonTitle:NSLocalizedString(@"cancel", nil)
                            otherButtonTitles:NSLocalizedString(@"ok", nil), nil];
}

+ (UIAlertView*)an_localizedAlertWithTitle:(NSString *)title message:(NSString *)message okBlock:(ANCodeBlock)okBlock
{
    UIAlertView* alert = [UIAlertView an_localizedAlertWithTitle:title message:message];
    [alert show];
    
    @weakify(alert);
    
    [alert.rac_buttonClickedSignal subscribeNext:^(NSNumber* value) {
        
        @strongify(alert);
        if (value.integerValue != alert.cancelButtonIndex)
        {
            if (okBlock) okBlock();
        }
    }];

    return alert;
}

+ (UIAlertView*)an_localizedAlertWithTitle:(NSString *)title message:(NSString *)message okSignal:(RACSignal*)okSignal
{
    UIAlertView* alert = [UIAlertView an_localizedAlertWithTitle:title message:message];
    [alert show];
    
    @weakify(alert);
    
    [alert.rac_buttonClickedSignal flattenMap:^RACStream *(NSNumber* value) {
        @strongify(alert);
        if (value.integerValue != alert.cancelButtonIndex)
        {
            return okSignal;
        }
        return [RACSignal empty];
    }];
    
    return alert;
}

+ (RACCommand*)an_localizedCommandAlertWithTitle:(NSString *)title
                                      message:(NSString *)message
                                     okSignal:(RACSignal*)okSignal
{
   return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
       
       UIAlertView* alert = [UIAlertView an_localizedAlertWithTitle:title message:message];
       [alert show];
       
       @weakify(alert);
       
      return [alert.rac_buttonClickedSignal flattenMap:^RACStream *(NSNumber* value) {
           @strongify(alert);
           if (value.integerValue != alert.cancelButtonIndex)
           {
               return okSignal;
           }
           return [RACSignal empty];
       }];
    }];
}

+ (RACCommand*)an_localizedCommandAlertWithTitle:(NSString *)title
                                      message:(NSString *)message
                                      okBlock:(ANCodeBlock)okBlock
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        UIAlertView* alert = [UIAlertView an_localizedAlertWithTitle:title message:message];
        [alert show];
        
        @weakify(alert);
        
        return [alert.rac_buttonClickedSignal flattenMap:^RACStream *(NSNumber* value) {
            @strongify(alert);
            if (value.integerValue != alert.cancelButtonIndex)
            {
                if (okBlock) okBlock();
            }
            return [RACSignal empty];
        }];
    }];
}

@end
