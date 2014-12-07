//
//  UIFont+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

static NSString* kANUltraLightFontName;
static NSString* kANThinFontName;
static NSString* kANLightFontName;
static NSString* kANRegularFontName;
static NSString* kANMediumFontName;
static NSString* kANSemiboldFontName;
static NSString* kANBoldFontName;
static NSString* kANCondensedBlackFontName;
static NSString* kANCondensedBoldFontName;
static NSString* kANItalicUltraLightFontName;
static NSString* kANItalicThinFontName;
static NSString* kANItalicLightFontName;
static NSString* kANItalicRegularFontName;
static NSString* kANItalicMediumFontName;
static NSString* kANItalicSemiboldFontName;
static NSString* kANItalicBoldFontName;

@interface UIFont (ANAdditions)

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
