//
//  NSString+Validation.h
//  ShipMate
//
//  Created by Oksana Kovalchuk on 2/6/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

@interface NSString (ANAdditions)

- (BOOL)an_isEmail;
- (NSString*)an_stripAllNonNumericCharacters;
- (NSString*)an_stripSpecialCharacters;

@end
