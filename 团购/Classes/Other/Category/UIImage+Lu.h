//
//  UIImage+Lu.h
//  雯微
//
//  Created by 陆佳磊 on 15/7/21.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Lu)


/**
 *  可以自由拉伸图片
 *
 *  @param imgName 图片的名字
 *
 *  @return UIImage
 */
+(UIImage *)resizedImage:(NSString *)imgName;
@end
