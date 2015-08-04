//
//  UIImage+Lu.m
//  雯微
//
//  Created by 陆佳磊 on 15/7/21.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "UIImage+Lu.h"

@implementation UIImage (Lu)

#pragma mark - 随意拉伸
+(UIImage *)resizedImage:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    
    return  [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
}

@end
