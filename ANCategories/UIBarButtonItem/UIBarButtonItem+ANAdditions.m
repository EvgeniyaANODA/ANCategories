//
//  UIBarButtonItem+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 13/7/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "UIBarButtonItem+ANAdditions.h"
#import "UIButton+RACCommandSupport.h"
//#import "UIImage+PDF.h"
#import "ANHelperFunctions.h"

static NSMutableDictionary* kImageNames;

@implementation UIBarButtonItem (ANAdditions)

+ (void)an_addImageName:(NSString*)imageName forType:(ANBarButtonType)type
{
    if (!ANIsEmpty(imageName))
    {
        [self _imageNames][@(type)] = imageName;
    }
}

+ (UIBarButtonItem *)an_itemWithType:(ANBarButtonType)type command:(RACCommand *)command
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
//    UIImage* image = [UIImage imageNamed:imageNameByType(type)];
    UIImage* image = [self _imageNames][@(type)];
    CGRect frame = button.frame;
    frame.size = CGSizeMake(40, 40);
    button.frame = frame;
    [button setImage:image forState:UIControlStateNormal];
    button.rac_command = command;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


#pragma mark - Private

+ (NSMutableDictionary*)_imageNames
{
    if (!kImageNames)
    {
        kImageNames = [NSMutableDictionary dictionary];
    }
    return kImageNames;
}

@end
