//
//  UIBarButtonItem+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 13/7/14.
//  Copyright (c) 2014 ANODA. All rights reserved.
//

#import "UIBarButtonItem+ANAdditions.h"
#import "UIButton+RACCommandSupport.h"
#import "ANHelperFunctions.h"

static NSMutableDictionary* kImageNames;

@implementation UIBarButtonItem (ANAdditions)

+ (void)an_addImage:(UIImage*)image forType:(ANBarButtonType)type
{
    if (!ANIsEmpty(image))
    {
        [self _imageNames][@(type)] = image;
    }
}

+ (UIBarButtonItem *)an_itemWithType:(ANBarButtonType)type command:(RACCommand *)command
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor redColor];
//    button.contentMode = UIViewContentModeScaleAspectFit;
    button.exclusiveTouch = YES;
    UIImage* image = [self _imageNames][@(type)];
    
    CGRect frame = button.frame;
    frame.size.height = image.size.height;
    frame.size.width = MAX(20, frame.size.width);
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
