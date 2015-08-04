//
//  UIBarButtonItem+Lu.m
//  雯微
//
//  Created by 陆佳磊 on 15/7/25.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "UIBarButtonItem+Lu.h"

@implementation UIBarButtonItem (Lu)

-(instancetype)initWithIcon:(NSString *)icon hightLightedIcon:(NSString *)hightlighted target:(id)target action:(SEL)action
{
    // 创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置普通图片
    UIImage *image = [UIImage imageNamed:icon];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    // 设置高亮图片
    [btn setBackgroundImage:[UIImage imageNamed:hightlighted] forState:UIControlStateHighlighted];
    
    // 3.设置尺寸
    btn.bounds = (CGRect){CGPointZero,image.size};
    
    // 4.加入监听
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:btn];
}


+ (UIBarButtonItem *)barButtonWithIcon:(NSString *)icon hightLightedIcon:(NSString *)hightlighted target:(id)target action:(SEL)action;
{
    
    return [[self alloc] initWithIcon:icon hightLightedIcon:hightlighted target:target action:action];
}


@end
