//
//  UIFont+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "UIFont+ANAdditions.h"

#ifndef kANUltraLightFontName 
#define kANUltraLightFontName @""
#endif

#ifndef kANThinFontName
#define kANThinFontName @""
#endif

#ifndef kANLightFontName
#define kANLightFontName @""
#endif

#ifndef kANRegularFontName
#define kANRegularFontName @""
#endif

#ifndef kANMediumFontName
#define kANMediumFontName @""
#endif

#ifndef kANSemiboldFontName
#define kANSemiboldFontName @""
#endif

#ifndef kANBoldFontName
#define kANBoldFontName @""
#endif

#ifndef kANCondensedBlackFontName
#define kANCondensedBlackFontName @""
#endif

#ifndef kANCondensedBoldFontName
#define kANCondensedBoldFontName @""
#endif

#ifndef kANItalicUltraLightFontName
#define kANItalicUltraLightFontName @""
#endif

#ifndef kANItalicThinFontName
#define kANItalicThinFontName @""
#endif

#ifndef kANItalicLightFontName
#define kANItalicLightFontName @""
#endif

#ifndef kANItalicRegularFontName
#define kANItalicRegularFontName @""
#endif

#ifndef kANItalicMediumFontName
#define kANItalicMediumFontName @""
#endif

#ifndef kANItalicSemiboldFontName
#define kANItalicSemiboldFontName @""
#endif

#ifndef kANItalicBoldFontName
#define kANItalicBoldFontName @""
#endif

@implementation UIFont (ANAdditions)

+ (UIFont *)an_ultraLightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANUltraLightFontName size:size];
}

+ (UIFont *)an_lightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANLightFontName size:size];
}

+ (UIFont *)an_regularFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANRegularFontName size:size];
}

+ (UIFont *)an_meduimFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANMediumFontName size:size];
}

+ (UIFont *)an_semiboldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANSemiboldFontName size:size];
}

+ (UIFont *)an_boldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANBoldFontName size:size];
}

+ (UIFont *)an_condensedBlackFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANCondensedBlackFontName size:size];
}

+ (UIFont *)an_condensedBoldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANCondensedBoldFontName size:size];
}

#pragma mark - Italic

+ (UIFont *)an_italicUltraLightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANItalicUltraLightFontName size:size];
}

+ (UIFont *)an_italicLightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANItalicLightFontName size:size];
}

+ (UIFont *)an_italicRegularFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANItalicRegularFontName size:size];
}

+ (UIFont *)an_italicMeduimFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANItalicMediumFontName size:size];
}

+ (UIFont *)an_italicSemiboldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANItalicSemiboldFontName size:size];
}

+ (UIFont *)an_italicBoldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:kANItalicBoldFontName size:size];
}

@end
