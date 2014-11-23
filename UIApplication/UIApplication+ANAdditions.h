//
//  UIApplication+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 7/8/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

@interface UIApplication (ANAdditions)

- (void)openURL:(NSURL*)url orAlternativeURL:(NSURL*)alternativeURL;

#pragma mark - Socials

- (void)openVKPageForID:(NSString *)userID;
- (void)openFbPageForID:(NSString*)userID;
- (void)openLinkedinPageForID:(NSString*)userID;
- (void)openGooglePlusPageForID:(NSString *)userID;

#pragma mark - Phone

- (void)callToUser:(NSString*)number;

@end
