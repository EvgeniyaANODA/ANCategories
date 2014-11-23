//
//  NSDate+ANServerAdditions.m
//
//  Created by Oksana Kovalchuk on 26/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "NSDate+ANServerAdditions.h"
#import "NSDate+ANUIAdditions.h"

static NSDateFormatter* serverDateFormatter;

static NSString* const kServerDateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
static NSString* const kServerTimeZoneString = @"UTC";

@implementation NSDate (SMServerAdditions)

#pragma mark - Server Formatter

+ (NSDateFormatter*)serverDateFormatter
{
    if (!serverDateFormatter)
    {
        serverDateFormatter = [NSDateFormatter new];
        serverDateFormatter.dateFormat =  kServerDateFormat;
        serverDateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:kServerTimeZoneString];
        serverDateFormatter.locale = [NSLocale currentLocale];
    }
    
    return serverDateFormatter;
}

#pragma mark - Public

+ (NSDate*)an_dateFromServerString:(NSString*)dateString
{
    return [[self serverDateFormatter] dateFromString:dateString];
}

+ (NSString*)an_stringFromServerDate:(NSDate*)date
{
    return [[self serverDateFormatter] stringFromDate:date];
}

- (NSDate*)an_serverDateFromLocalDate
{
    NSString* localDate = [self an_stringFromDateWithFormat:kServerDateFormat];
    return [[NSDate serverDateFormatter] dateFromString:localDate];
}

@end
