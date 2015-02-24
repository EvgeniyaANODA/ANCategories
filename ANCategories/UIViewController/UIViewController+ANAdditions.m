//
//  UIViewController+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 6/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "UIViewController+ANAdditions.h"

@implementation UIViewController (ANAdditions)

#pragma mark - Private

- (void)an_showAsModalInNavigationController
{
    UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:self];
    [nc an_showAsModal];
}

- (void)an_showAsModal
{
//    The main window is best found using UIWindow * mainWindow = [UIApplication sharedApplication].windows.firstObject;
//    Using keyWindow can return a keyboard or UIAlertView window, which lie above your application window.
    UIWindow* topWindow = [[UIApplication sharedApplication].windows firstObject];
    UIViewController *topController = topWindow.rootViewController;
    
    //TODO: this while is dangerous.
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    ANDispatchBlockToMainQueue(^{
       [topController presentViewController:self animated:YES completion:nil];
    });
}

- (void)an_dismissAsModal
{
    [self an_dismissAsModalWithCompletion:nil];
}

- (void)an_dismissAsModalWithCompletion:(ANCodeBlock)completion
{
    ANDispatchBlockToMainQueue(^{
       [self dismissViewControllerAnimated:YES completion:completion];
    });
}

- (BOOL)an_isModal
{
    if([self presentingViewController])
        return YES;
    if([[self presentingViewController] presentedViewController] == self)
        return YES;
    if([[[self navigationController] presentingViewController] presentedViewController] == [self navigationController])
        return YES;
    if([[[self tabBarController] presentingViewController] isKindOfClass:[UITabBarController class]])
        return YES;
    
    return NO;
}

@end
