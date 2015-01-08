//
//  UIImage+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "UIImage+ANAdditions.h"

@implementation UIImage (ANAdditions)

+ (UIImage *)an_resizableImageWithName:(NSString *)imageName
{
    UIImage* image = [UIImage imageNamed:imageName];
    return [self an_resizableImageFromImage:image];
}

+ (UIImage *)an_resizableImageFromImage:(UIImage*)image
{
    int vertical = (image.size.height - 1) / 2;
    int horizontal = (image.size.width - 1) / 2;
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(vertical, horizontal, vertical, horizontal)];
    return image;
}

+ (UIImage*)an_imageWithColor:(UIColor *)color withSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage*)an_imageWithColor:(UIColor *)color
{
    return [self an_imageWithColor:color withSize:CGSizeMake(1.0f, 1.0f)];
}

- (UIImage*)an_drawImage:(UIImage *)inputImage inRect:(CGRect)frame
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    [self drawInRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height)];
    [inputImage drawInRect:frame];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)an_overlapWithBlack
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    CGRect rect = CGRectMake(0.0, 0.0, self.size.width, self.size.height);
    [self drawInRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorRef color = [[UIColor blackColor] colorWithAlphaComponent:0.4f].CGColor;
    CGContextSetFillColorWithColor(context, color);
    CGContextFillRect(context, rect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)an_correctScaleImage
{
    CGFloat scale = [UIScreen mainScreen].scale;
    if (self.scale != scale)
    {
        return [UIImage imageWithCGImage:[self CGImage] scale:scale orientation:UIImageOrientationUp];
    }
    return self;
    
}

@end
