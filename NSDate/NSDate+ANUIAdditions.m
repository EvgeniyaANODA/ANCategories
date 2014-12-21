//
//  NSDate+ANUIAdditions.m
//
//  Created by Oksana Kovalchuk on 26/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "NSDate+ANUIAdditions.h"

static NSDateFormatter* localDateFormatter;

@implementation NSDate (ANUIAdditions)

#pragma mark - Local Formatter

+ (NSDateFormatter*)localDateFormatter
{
    if (!localDateFormatter)
    {
        localDateFormatter = [NSDateFormatter new];
        localDateFormatter.timeZone = [NSTimeZone localTimeZone];
    }
    
    return localDateFormatter;
}

#pragma mark - Public

- (NSString *)an_numberFormatWithDelimeter:(NSString *)delimeter
{
    NSParameterAssert(delimeter);
    NSString* dateFormat = [NSString stringWithFormat:@"d%@MMMM%@YYYY", delimeter, delimeter];
    [NSDate localDateFormatter].dateFormat = dateFormat;
    return [[NSDate localDateFormatter] stringFromDate:self];
}

#pragma mark - Weekday

- (NSString*)an_weekDayName
{
    [NSDate localDateFormatter].dateFormat = @"cccc";
    return [[NSDate localDateFormatter] stringFromDate:self];
}

- (NSString*)an_shortWeekDayName
{
    [NSDate localDateFormatter].dateFormat = @"ccc";
    return [[NSDate localDateFormatter] stringFromDate:self];
}

- (NSInteger)an_indexOfWeekDay
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; // Sunday == 1, Saturday == 7
    NSUInteger adjustedWeekdayOrdinal = [gregorian ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
    
    return adjustedWeekdayOrdinal - 1;// for count from 0
}

#pragma mark - Day

- (NSString*)an_dayNumber
{
    [NSDate localDateFormatter].dateFormat = @"d";
    return [[NSDate localDateFormatter] stringFromDate:self];
}

#pragma mark - Month

- (NSString*)an_monthName
{
    [NSDate localDateFormatter].dateFormat = @"MMMM";
    return [[NSDate localDateFormatter] stringFromDate:self];
}

- (NSString*)an_shortMonthName
{
    [NSDate localDateFormatter].dateFormat = @"MMM";
    return [[NSDate localDateFormatter] stringFromDate:self];
}

- (NSInteger)an_indexOfMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar ordinalityOfUnit:NSMonthCalendarUnit inUnit:NSYearCalendarUnit forDate:self];
}

#pragma mark - Time

- (NSString*)an_timeString
{
    [NSDate localDateFormatter].dateFormat = @"HH:mm"; //TODO: handle 12h format
    return [[NSDate localDateFormatter] stringFromDate:self];
}

#pragma mark - Comparsion

- (BOOL)an_isTomorrow
{
    NSDate *tomorrow = [self dateByAddingTimeInterval:-60*60*24];
    return [tomorrow an_isToday];
}

- (BOOL)an_isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate new];
    NSCalendarUnit unit = NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *nowComponents = [calendar components:unit fromDate:now];
    NSDateComponents *dateComponents = [calendar components:unit fromDate:self];
    
    BOOL isEqual = (nowComponents.era == dateComponents.era &&
                    nowComponents.year == dateComponents.year &&
                    nowComponents.month == dateComponents.month &&
                    nowComponents.day == dateComponents.day);
    
    return isEqual;
}

- (BOOL)an_isDayWeekend
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange weekdayRange = [calendar maximumRangeOfUnit:NSWeekdayCalendarUnit];
    NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSUInteger weekdayOfDate = [components weekday];
    
    BOOL result = (weekdayOfDate == weekdayRange.location || weekdayOfDate == weekdayRange.length);
    return result;
}

- (BOOL)an_isEqualsToDateIgnoringTime:(NSDate *)secondValue
{
    if (!secondValue | !self)
    {
        return NO;
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *firstValueComponents = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth | kCFCalendarUnitDay
                                                         fromDate:self];
    NSDateComponents *secondValueComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | kCFCalendarUnitDay
                                                          fromDate:secondValue];
    
    BOOL result = (firstValueComponents.year == secondValueComponents.year &&
                   firstValueComponents.month == secondValueComponents.month &&
                   firstValueComponents.day == secondValueComponents.day);
    return result;
}

- (BOOL)an_isDateInCurrentYear
{
    NSDate *now = [NSDate new];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *nowComponents = [calendar components:NSYearCalendarUnit fromDate:now];
    NSDateComponents *dateComponents = [calendar components:NSYearCalendarUnit fromDate:self];
    
    return nowComponents.year == dateComponents.year;
}

- (NSInteger)an_daysBetweenDate:(NSDate*)fromDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:self];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:fromDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

#pragma mark - Creating new objects

- (NSDate *)an_dateByAddingDaysWithDST:(NSInteger)daysToAdd
{
    NSDateComponents *dayComponent = [NSDateComponents new];
    dayComponent.day = daysToAdd;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *result = [calendar dateByAddingComponents:dayComponent toDate:self options:0];
    
    return result;
}

- (NSDate *)an_dateByAddingDaysWithoutDST:(NSInteger)dDays
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + kDayInSeconds * dDays;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)an_dateWithoutTime
{
    NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit |
                               NSMonthCalendarUnit |
                               NSDayCalendarUnit
                                                              fromDate:self];
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

+ (NSDate*)an_currentDateWithTimeRoundedToIntervalInMinutes:(float)intervalInMinutes
{
    NSDateComponents *time = [[NSCalendar currentCalendar]
                              components:NSHourCalendarUnit | NSMinuteCalendarUnit
                              fromDate:[NSDate date]];
    NSInteger minutes = [time minute];
    float minuteUnit = ceilf((float) minutes / intervalInMinutes);
    minutes = minuteUnit * intervalInMinutes;
    [time setMinute: minutes];
    NSDate* rounded = [[NSCalendar currentCalendar] dateFromComponents:time];
    return rounded;
}


#pragma mark - Common Tools

+ (NSDate*)an_dateFromString:(NSString*)dateString format:(NSString*)dateFormat
{
    [NSDate localDateFormatter].dateFormat = dateFormat;
    return [[NSDate localDateFormatter] dateFromString:dateString];
}

- (NSString*)an_stringFromDateWithFormat:(NSString*)dateFormat
{
    NSParameterAssert(dateFormat);
    [NSDate localDateFormatter].dateFormat = dateFormat;
    return [[NSDate localDateFormatter] stringFromDate:self];
}


#pragma mark - UI Formats

- (NSString*)an_listDateStringWithIgnoringCurrentYear
{
    if ([self an_isDateInCurrentYear])
    {
        return [self an_stringFromDateWithFormat:@"d MMMM"];
    }
    else
    {
        return [self an_stringFromDateWithFormat:@"d MMMM YYYY"];
    }
}

@end
