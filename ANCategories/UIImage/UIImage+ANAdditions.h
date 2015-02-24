//
//  UIImage+ANAdditions.h
//
//  Created by Oksana Kovalchuk on 9/8/13.
//  Copyright (c) 2013 ANODA. All rights reserved.
//

@interface UIImage (ANAdditions)

+ (UIImage*)an_resizableImageWithName:(NSString*)imageName;
+ (UIImage*)an_resizableImageFromImage:(UIImage*)image;
+ (UIImage*)an_imageWithColor:(UIColor*)color withSize:(CGSize)size;
+ (UIImage*)an_imageWithColor:(UIColor*)color;

- (UIImage*)an_drawImage:(UIImage *)inputImage inRect:(CGRect)frame;
- (UIImage*)an_overlapWithBlack;

- (UIImage*)an_correctScaleImageWithOrientation:(UIImageOrientation)orientation;
- (UIImage*)an_correctScaleImage;

- (UIImage*)an_scaleToSize:(CGSize)size;
- (UIImage*)an_imageByTintingWithColor:(UIColor*)color;

@end
