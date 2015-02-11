//
//  UIApplication+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 7/8/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "UIApplication+ANAdditions.h"

@implementation UIApplication (ANAdditions)

- (void)an_openVKPageForID:(NSString *)userID
{
    NSURL* scheme = [NSURL URLWithString:[NSString stringWithFormat:@"vk://vk.com/id%@", userID]];
    NSURL* safariURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://vk.com/id%@", userID]];
    [self an_openURL:scheme orAlternativeURL:safariURL];
}

- (void)an_openFbPageForID:(NSString*)userID
{
    NSURL* schemeURL = [NSURL URLWithString:[NSString stringWithFormat:@"fb://profile/%@",userID]];
    NSString *safariString = [NSString stringWithFormat:@"https://www.facebook.com/profile.php?id=%@", userID];
    NSURL* safariURL = [NSURL URLWithString:safariString];
    
    [self an_openURL:schemeURL orAlternativeURL:safariURL];
}

- (void)an_openLinkedinPageForID:(NSString*)userID
{
    NSString* urlString = [NSString stringWithFormat:@"http://www.linkedin.com/profile/view?id=%@", userID];
    NSURL* url = [NSURL URLWithString:urlString];
    [self an_openURL:url orAlternativeURL:nil];
}

- (void)an_openGooglePlusPageForID:(NSString *)userID
{
    NSString* schemeURLString = [NSString stringWithFormat:@"gplus://plus.google.com/%@",userID];
    NSURL* schemeURL = [NSURL URLWithString:schemeURLString];
    
    NSString* safariString = [NSString stringWithFormat:@"https://plus.google.com/%@",userID];
    NSURL* safariURL = [NSURL URLWithString:safariString];
    [self an_openURL:schemeURL orAlternativeURL:safariURL];
}

- (void)an_openURL:(NSURL*)url orAlternativeURL:(NSURL*)alternativeURL
{
    if (![[UIApplication sharedApplication] canOpenURL:url])
    {
        url = alternativeURL;
    }
    [[UIApplication sharedApplication] openURL:url];
}

- (void)an_openURLString:(NSString*)urlString
{
    NSURL* url;
    if (urlString)
    {
        url = [NSURL URLWithString:urlString];
    }
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - Phone

- (void)an_callToUser:(NSString*)number
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] )
    {
        NSString *stringToCall = [[number componentsSeparatedByCharactersInSet:
                                   [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                                  componentsJoinedByString:@""];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://+%@", stringToCall]]];
    }
    else
    {
//        [ handleInternalError:[CDError errorWithKey:kErrorAppCantCall]]; //TODO:
    }
}

@end
