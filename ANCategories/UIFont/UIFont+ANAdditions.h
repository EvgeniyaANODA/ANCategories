//
//  UIFont+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

typedef NS_ENUM (NSInteger, ANFontType)
{
    ANFontTypeUltraLight,
    ANFontTypeLight,
    ANFontTypeRegular,
    ANFontTypeMedium,
    ANFontTypeSemibold,
    ANFontTypeBold,
    ANFontTypeCondensedBlack,
    ANFontTypeCondensedBold,
    //italic
    ANFontTypeUltraLightItalic,
    ANFontTypeLightItalic,
    ANFontTypeRegularItalic,
    ANFontTypeMediumItalic,
    ANFontTypeSemiboldItalic,
    ANFontTypeBoldItalic
};

@interface UIFont (ANAdditions)

#pragma mark - Configuring

+ (void)an_addFontName:(NSString*)fontName forType:(ANFontType)type;

#pragma mark - Normal

+ (UIFont *)an_ultraLightFontWithSize:(CGFloat)size;
+ (UIFont *)an_lightFontWithSize:(CGFloat)size;
+ (UIFont *)an_regularFontWithSize:(CGFloat)size;
+ (UIFont *)an_meduimFontWithSize:(CGFloat)size;
+ (UIFont *)an_semiboldFontWithSize:(CGFloat)size;
+ (UIFont *)an_boldFontWithSize:(CGFloat)size;
+ (UIFont *)an_condensedBlackFontWithSize:(CGFloat)size;
+ (UIFont *)an_condensedBoldFontWithSize:(CGFloat)size;

#pragma mark - Italic

+ (UIFont *)an_italicUltraLightFontWithSize:(CGFloat)size;
+ (UIFont *)an_italicLightFontWithSize:(CGFloat)size;
+ (UIFont *)an_italicRegularFontWithSize:(CGFloat)size;
+ (UIFont *)an_italicMeduimFontWithSize:(CGFloat)size;
+ (UIFont *)an_italicSemiboldFontWithSize:(CGFloat)size;
+ (UIFont *)an_italicBoldFontWithSize:(CGFloat)size;

@end
