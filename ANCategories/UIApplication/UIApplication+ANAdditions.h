//
//  UIApplication+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 7/8/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

@interface UIApplication (ANAdditions)

- (void)an_openURL:(NSURL*)url orAlternativeURL:(NSURL*)alternativeURL;
- (void)an_openURLString:(NSString*)urlString;

#pragma mark - Socials

- (void)an_openVKPageForID:(NSString *)userID;
- (void)an_openFbPageForID:(NSString*)userID;
- (void)an_openLinkedinPageForID:(NSString*)userID;
- (void)an_openGooglePlusPageForID:(NSString *)userID;

#pragma mark - Phone

- (void)an_callToUser:(NSString*)number;

@end
