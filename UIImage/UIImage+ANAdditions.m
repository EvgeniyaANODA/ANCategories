//
//  UIImage+ANAdditions.m
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

#import "UIImage+ANAdditions.h"
#import "CDImageCache.h"
#import <CoreText/CTLine.h>
#import <CoreText/CTFont.h>
#import <CoreText/CoreText.h>

@implementation UIImage (CDAdditions)

+ (UIImage *)an_resizableImageWithName:(NSString *)imageName
{
    UIImage* image = [UIImage imageNamed:imageName];
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

+ (UIImage *)an_imageWithColor:(UIColor *)color
{
    return [self an_imageWithColor:color withSize:CGSizeMake(1.0f, 1.0f)];
}

+ (UIImage *)an_imageWithText:(NSString *)text
{
    text = [text cd_stripSpecialCharacters];
    text = [text capitalizedString];
    NSArray* array = [text componentsSeparatedByString:@" "];
    
    __block NSString* username = @"";
    [array enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL *stop) {
        
        if (idx >= 1)
        {
            *stop = YES;
        }
        if (obj.length)
        {
            username = [username stringByAppendingString:[obj substringToIndex:1]];
        }
    }];
    
    UIImage* result = [CDImageCache imageWithKey:username];
    
    if (!result)
    {
        CGFloat diameter = 50.f;
        CGFloat scale = [UIScreen mainScreen].scale;
        CGSize size = CGSizeMake(diameter * scale, diameter * scale);
        
        // Create context
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        size_t bitsPerComponent = 8;
        size_t bytesPerPixel    = 4;
        size_t bytesPerRow      = (size.width * bitsPerComponent * bytesPerPixel + 7) / 8;
        size_t dataSize         = bytesPerRow * size.height;
        
        unsigned char *data = malloc(dataSize);
        memset(data, 0, dataSize);
        
        CGContextRef context = CGBitmapContextCreate(data, size.width, size.height,
                                                     bitsPerComponent,
                                                     bytesPerRow, colorSpace,
                                                     kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
        
        // Drawing
        [self drawAvatarOnContext:context size:size text:username];
        
        // Free resources
        CGColorSpaceRelease(colorSpace);
        CGImageRef imageRef = CGBitmapContextCreateImage(context);
        result = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        
        CGImageRelease(imageRef);
        CGContextRelease(context);
        free(data);
        
        [CDImageCache saveImage:result key:username];
    }
    return result;
}

+ (void)an_drawAvatarOnContext:(CGContextRef)context size:(CGSize)size text:(NSString *)text
{
    // Draw circle
    
    //create custom background color for each craracher pair
    float charSum = 0;
    for (int i = 0 ; i < [text length]; i++)
    {
        const unichar character = [text characterAtIndex:i];
        charSum += character;
    }

    CGFloat floatValue = fabsf(cosf(charSum));
    
    const CGFloat *colorComponents = CGColorGetComponents([UIColor colorWithHue:floatValue saturation:0.12 brightness:0.85 alpha:1].CGColor);
    CGContextSetRGBFillColor (context,
                              colorComponents[0],
                              colorComponents[1],
                              colorComponents[2],
                              colorComponents[3]);
    CGContextMoveToPoint(context, size.width/2.0f, size.height/2.0f);
    CGContextFillEllipseInRect(context, CGRectMake(0.0f, 0.0f, size.width, size.height));
    
    // Draw text
    CGFloat fontPointSize = [self fontPointSizeForString:text forParentHeight:size.height];
    UIFont *font = [UIFont an_regularFontWithSize:fontPointSize];
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)font.fontName, font.pointSize, nil);
    CGColorRef colorRef = [UIColor whiteColor].CGColor;
    
    NSMutableAttributedString *stringToDraw = [[NSMutableAttributedString alloc] initWithString:text];
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)stringToDraw,
                                   CFRangeMake(0, [stringToDraw length]), kCTFontAttributeName, fontRef);
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)stringToDraw,
                                   CFRangeMake(0, [stringToDraw length]), kCTForegroundColorAttributeName, colorRef);
    // draw string
    CGContextSetTextPosition(context, (size.width - stringToDraw.size.width)/2.0f, size.height/3.0f);
    CTLineRef lineRef = CTLineCreateWithAttributedString((CFAttributedStringRef)stringToDraw);
    CTLineDraw(lineRef, context);
    
    CGContextStrokePath(context);
    CFRelease(lineRef);
    CFRelease(fontRef);
}

+ (CGFloat)an_fontPointSizeForString:(NSString *)string forParentHeight:(CGFloat)height
{
    NSMutableAttributedString *stringToDraw = [[NSMutableAttributedString alloc] initWithString:string];
    
    CGFloat tempFontPointSize = 29.0f;
    UIFont *tempFont = [UIFont an_lightFontWithSize:tempFontPointSize];
    CTFontRef tempFontRef = CTFontCreateWithName((CFStringRef)tempFont.fontName, tempFont.pointSize, nil);
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)stringToDraw,
                                   CFRangeMake(0, [stringToDraw length]), kCTFontAttributeName, tempFontRef);
    
    CGFloat tempFontHeight = stringToDraw.size.height;
    CGFloat fontPointSize = tempFontHeight * height / (3.0f * tempFontPointSize);
    
    CFRelease(tempFontRef);
    
    return fontPointSize;
}

- (UIImage *)an_drawImage:(UIImage *)inputImage inRect:(CGRect)frame
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    [self drawInRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height)];
    [inputImage drawInRect:frame];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)an_overlapWithBlack
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

@end
