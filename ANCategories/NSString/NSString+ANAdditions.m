//
//  NSString+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 2/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "NSString+ANAdditions.h"

@implementation NSString (Additions)

- (BOOL)an_isEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (NSString*)an_stripAllNonNumericCharacters
{
    return [self stringByReplacingOccurrencesOfString:@"[^0-9]"
                                             withString:@""
                                                options:NSRegularExpressionSearch
                                                  range:NSMakeRange(0, [self length])];
}

- (NSString*)an_stripSpecialCharacters
{
    NSMutableCharacterSet *charset = [NSMutableCharacterSet alphanumericCharacterSet];
    [charset addCharactersInString:@" "];
    return [[self componentsSeparatedByCharactersInSet:[charset invertedSet]] componentsJoinedByString:@""];
}

@end
