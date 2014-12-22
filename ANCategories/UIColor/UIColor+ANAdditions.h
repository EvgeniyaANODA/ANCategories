//
//  UIColor+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 09.03.13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//
@interface UIColor (ANAdditions)

+ (UIColor*)an_colorWithHexString:(NSString *)stringToConvert;
+ (UIColor*)an_randomColor;

- (NSString*)an_hexString;

@end
