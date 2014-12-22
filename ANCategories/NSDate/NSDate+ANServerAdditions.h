//
//  NSDate+ANServerAdditions.h
//
//  Created by Oksana Kovalchuk on 26/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

@interface NSDate (SMServerAdditions)

+ (NSDate*)an_dateFromServerString:(NSString*)dateString;
+ (NSString*)an_stringFromServerDate:(NSDate*)date;

- (NSDate*)an_serverDateFromLocalDate;

@end
