//
//  UIAlertView+ANAdditions.h
//  ShipMate
//
//  Created by Oksana Kovalchuk on 5/7/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "ANHelperFunctions.h"

@class RACSignal;
@class RACCommand;

@interface UIAlertView (ANAdditions)

/**
 *  Creates instance of UIAlertView class with ok and cancel buttons. Already localized.
 *
 *  @param title    NSString*  Localization key from localized.strings for title
 *  @param message  NSString*  Localization key from localized.strings for message
 *
 *  @return UIAlertView* instanse for presentation
 */
+ (UIAlertView *)an_localizedAlertWithTitle:(NSString*)title message:(NSString*)message;


/**
 *  Shows alert with ok and cancel buttons. If okay button did press, execute okSignal
 *
 *  @param title    NSString*  Localization key from localized.strings for title
 *  @param message  NSString*  Localization key from localized.strings for message
 *  @param okSignal RACSignal for execution in case of ok button pressed
 *
 *  @return UIAlertView* that already presented
 */
+ (UIAlertView*)an_localizedAlertWithTitle:(NSString *)title
                                message:(NSString *)message
                               okSignal:(RACSignal*)okSignal;


/**
 *  Shows alert with ok and cancel buttons. If okay button did press, execute okBlock
 *
 *  @param title   NSString*  Localization key from localized.strings for title
 *  @param message NSString*  Localization key from localized.strings for message
 *  @param okBlock ANCodeBlock for execution in case of ok button pressed
 *
 *  @return UIAlertView* that already presented
 */
+ (UIAlertView*)an_localizedAlertWithTitle:(NSString *)title
                                message:(NSString *)message
                                okBlock:(ANCodeBlock)okBlock;



/**
 *  Shows alert with ok and cancel buttons. If okay button did press, execute okBlock
 *
 *  @param title    NSString*  Localization key from localized.strings for title
 *  @param message  NSString*  Localization key from localized.strings for message
 *  @param okSignal RACSignal for execution in case of ok button pressed
 *
 *  @return RACCommand* for showing UIAlertView with predefines values
 */
+ (RACCommand*)an_localizedCommandAlertWithTitle:(NSString *)title
                                      message:(NSString*)message
                                     okSignal:(RACSignal*)okSignal;


+ (RACCommand*)an_localizedCommandAlertWithTitle:(NSString*)title
                                      message:(NSString *)message
                                      okBlock:(ANCodeBlock)okBlock;

@end
