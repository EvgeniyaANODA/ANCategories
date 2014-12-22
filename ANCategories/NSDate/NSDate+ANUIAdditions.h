//
//  NSDate+ANUIAdditions.h
//
//  Created by Oksana Kovalchuk on 26/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

static const double kDayInSeconds = 86400;

@interface NSDate (ANUIAdditions)

/**
 *  Returns formatted string like - 12<delimeter>09<delimeter>2008
 *
 *  @param delimeter NSString delimeter inserted between values
 *
 *  @return NSString* formatted string date
 */
- (NSString*)an_numberFormatWithDelimeter:(NSString*)delimeter;

#pragma mark - Weekday

/**
 *  Returns weekday name from date - ex. saturday, moday, wednesday
 *
 *  @return NSString* weekday name in format "ccc"
 */
- (NSString*)an_weekDayName;


/**
 *  Returns short (3 symbols) weekday name - ex. sat, thu, wed
 *
 *  @return NSString* weekday name in format "ccc"
 */
- (NSString*)an_shortWeekDayName;


/**
 *  Returns index of day in week - ATTENTION! 0 - is monday!
 *
 *  @return NSInteger index
 */
- (NSInteger)an_indexOfWeekDay;


#pragma mark - Day

/**
 *  Returns index of day in month WITHOUT leading zero - ex. 1, 28, 31
 *
 *  @return NSString index
 */
- (NSString*)an_dayNumber;


#pragma mark - Month

/**
 *  Returns full month name - ex. january, february, june
 *
 *  @return NSString* month name in format "MMM"
 */
- (NSString*)an_monthName;


/**
 *  Returns short (3 symbols) month name - ex. jan, feb, jun
 *
 *  @return NSString* month name in format "MMM"
 */
- (NSString*)an_shortMonthName;


/**
 *  Returns index of month in year - ex. 1, 3, 12
 *
 *  @return NSInteger index
 */
- (NSInteger)an_indexOfMonth;


#pragma mark - Time

/**
 *  Returns 24h time formatted string from date - ex. 13:45, 23:58
 *
 *  @return NSString* with format "HH:mm"
 */
- (NSString*)an_timeString;

#pragma mark - Comparsion

- (BOOL)an_isToday;
- (BOOL)an_isTomorrow;
- (BOOL)an_isDayWeekend;
- (BOOL)an_isEqualsToDateIgnoringTime:(NSDate *)secondValue;
- (NSInteger)an_daysBetweenDate:(NSDate*)fromDateTime;


#pragma mark - Creating new objects

- (NSDate *)an_dateByAddingDaysWithDST:(NSInteger)daysToAdd;
- (NSDate *)an_dateByAddingDaysWithoutDST:(NSInteger)dDays;
- (NSDate *)an_dateWithoutTime;

+ (NSDate*)an_currentDateWithTimeRoundedToIntervalInMinutes:(float)intervalInMinutes;

#pragma mark - Common Tools

+ (NSDate*)an_dateFromString:(NSString*)dateString format:(NSString*)dateFormat;
- (NSString*)an_stringFromDateWithFormat:(NSString*)dateFormat;

#pragma mark - UI formats

- (NSString*)an_listDateStringWithIgnoringCurrentYear;

@end
