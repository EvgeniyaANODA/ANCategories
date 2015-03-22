//
//  UIFont+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "UIFont+ANAdditions.h"

static NSMutableDictionary* kANFontNames;

@implementation UIFont (ANAdditions)

+ (void)an_addFontName:(NSString *)fontName forType:(ANFontType)type
{
    if (!kANFontNames)
    {
        kANFontNames = [NSMutableDictionary dictionary];
    }
    if (fontName)
    {
        [kANFontNames setObject:fontName forKey:@(type)];
    }
}

+ (UIFont*)an_ultraLightFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeUltraLight size:size];
}

+ (UIFont*)an_lightFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeLight size:size];
}

+ (UIFont*)an_regularFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeRegular size:size];
}

+ (UIFont*)an_meduimFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeMedium size:size];
}

+ (UIFont*)an_semiboldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeSemibold size:size];
}

+ (UIFont*)an_boldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeBold size:size];
}

+ (UIFont*)an_condensedBlackFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeCondensedBlack size:size];
}

+ (UIFont*)an_condensedBoldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeCondensedBold size:size];
}

#pragma mark - Italic

+ (UIFont*)an_italicUltraLightFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeUltraLightItalic size:size];
}

+ (UIFont*)an_italicLightFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeLightItalic size:size];
}

+ (UIFont*)an_italicRegularFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeRegularItalic size:size];
}

+ (UIFont*)an_italicMeduimFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeMediumItalic size:size];
}

+ (UIFont*)an_italicSemiboldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeSemiboldItalic size:size];
}

+ (UIFont*)an_italicBoldFontWithSize:(CGFloat)size
{
    return [UIFont _fontWithType:ANFontTypeBoldItalic size:size];
}

+ (UIFont*)_fontWithType:(ANFontType)type size:(CGFloat)fontSize
{
    NSString* fontName = kANFontNames[@(type)];
    UIFont* font = [UIFont fontWithName:fontName size:fontSize];
    if (!font)
    {
        NSLog(@"Font with name: %@, not found!", fontName);
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

@end
