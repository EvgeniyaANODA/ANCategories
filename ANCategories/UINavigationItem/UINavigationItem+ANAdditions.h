//
//  UINavigationItem+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 22.03.14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

@interface UINavigationItem (ANAdditions)

- (void)an_addLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem;
- (void)an_addRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem;

//predefined items
- (void)an_addCloseButtonItemWithModalVC:(UIViewController*)vc;

@end

