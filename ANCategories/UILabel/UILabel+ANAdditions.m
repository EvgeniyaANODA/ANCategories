//
//  UILabel+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 7/9/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "UILabel+ANAdditions.h"

@implementation UILabel (ANAdditions)

- (CGSize)an_textContentSize
{
    return [self an_textContentSizeConstrainedToWidth:FLT_MAX];
}

- (CGSize)an_textContentSizeConstrainedToWidth:(CGFloat)width
{
    NSDictionary *attributes = @{NSFontAttributeName: self.font};
    CGRect textRect = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil];
    return textRect.size;
}

- (CGSize)an_textContentSizeConstrainedToWidth:(CGFloat)width edgeInsets:(UIEdgeInsets)insets
{
    CGSize labelSize = [self an_textContentSizeConstrainedToWidth:width];
    return CGSizeMake(labelSize.width + insets.left + insets.right,
                      labelSize.height + insets.top + insets.bottom);
}

@end
