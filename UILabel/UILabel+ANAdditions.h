//
//  UILabel+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 7/9/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

@interface UILabel (ANAdditions)

- (CGSize)an_textContentSize;
- (CGSize)an_textContentSizeConstrainedToWidth:(CGFloat)width;
- (CGSize)an_textContentSizeConstrainedToWidth:(CGFloat)width edgeInsets:(UIEdgeInsets)insets;

@end
