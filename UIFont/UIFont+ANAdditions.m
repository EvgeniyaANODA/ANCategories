//
//  UIFont+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "UIFont+ANAdditions.h"

@implementation UIFont (ANAdditions)

//[[UIFont familyNames] enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
//    
//    NSLog (@"%@: %@", obj, [UIFont fontNamesForFamilyName:obj]);
//}];

+ (UIFont *)an_lightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

+ (UIFont *)an_ultraLightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:size];
}

+ (UIFont *)an_mediumFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

+ (UIFont *)an_normalFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

@end
