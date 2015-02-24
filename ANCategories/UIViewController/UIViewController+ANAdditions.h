//
//  UIViewController+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 6/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "ANHelperFunctions.h"

@interface UIViewController (ANAdditions)

- (void)an_showAsModalInNavigationController;
- (void)an_showAsModal;
- (void)an_dismissAsModal;
- (void)an_dismissAsModalWithCompletion:(ANCodeBlock)completion;

- (BOOL)an_isModal;

@end
