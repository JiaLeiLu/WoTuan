//
//  UIBarButtonItem+Lu.h
//  雯微
//
//  Created by 陆佳磊 on 15/7/25.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Lu)
- (instancetype)initWithIcon:(NSString *)icon hightLightedIcon:(NSString *)hightlighted target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)barButtonWithIcon:(NSString *)icon hightLightedIcon:(NSString *)hightlighted target:(id)target action:(SEL)action;

@end
