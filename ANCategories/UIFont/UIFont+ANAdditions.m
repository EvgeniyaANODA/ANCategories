//
//  UIFont+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "UIFont+ANAdditions.h"

@implementation UIFont (ANAdditions)

+ (UIFont *)an_ultraLightFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANUltraLightFontName size:size];
}

+ (UIFont *)an_lightFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANLightFontName size:size];
}

+ (UIFont *)an_regularFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANRegularFontName size:size];
}

+ (UIFont *)an_meduimFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANMediumFontName size:size];
}

+ (UIFont *)an_semiboldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANSemiboldFontName size:size];
}

+ (UIFont *)an_boldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANBoldFontName size:size];
}

+ (UIFont *)an_condensedBlackFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANCondensedBlackFontName size:size];
}

+ (UIFont *)an_condensedBoldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANCondensedBoldFontName size:size];
}

#pragma mark - Italic

+ (UIFont *)an_italicUltraLightFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANItalicUltraLightFontName size:size];
}

+ (UIFont *)an_italicLightFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANItalicLightFontName size:size];
}

+ (UIFont *)an_italicRegularFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANItalicRegularFontName size:size];
}

+ (UIFont *)an_italicMeduimFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANItalicMediumFontName size:size];
}

+ (UIFont *)an_italicSemiboldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANItalicSemiboldFontName size:size];
}

+ (UIFont *)an_italicBoldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithName:kANItalicBoldFontName size:size];
}

+ (UIFont*)_fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
    UIFont* font = [UIFont fontWithName:fontName size:fontSize];
    if (!font)
    {
        NSLog(@"Font with name: %@, not found!", fontName);
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

@end
