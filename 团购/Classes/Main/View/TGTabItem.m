//
//  TGTabItem.m
//  团购
//
//  Created by 陆佳磊 on 15/7/31.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGTabItem.h"

@implementation TGTabItem

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundImage:[UIImage imageNamed:@"bg_tabbar_item.png"] forState:UIControlStateDisabled];
    }
    return self;
}

-(void)setEnabled:(BOOL)enabled
{
    
    _divider.hidden = !enabled;
    
    // 用来控制顶部分割线要不要显示
    [super setEnabled:enabled];
}


@end
