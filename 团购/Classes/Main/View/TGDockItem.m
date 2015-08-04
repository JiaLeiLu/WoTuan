//
//  TGDockItem.m
//  团购
//
//  Created by 陆佳磊 on 15/7/31.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGDockItem.h"

@implementation TGDockItem
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, KDockItemW, 2);
        imageView.image = [UIImage imageNamed:@"separator_tabbar_item.png"];
        [self addSubview:imageView];
        _divider = imageView;
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    // 去除选中时的高亮
}

-(void)setIcon:(NSString *)icon selectedIcon:(NSString *)selectedIcon
{
    self.icon = icon;
    self.selectedIcon = selectedIcon;
}

-(void)setSelectedIcon:(NSString *)selectedIcon
{
    _icon = selectedIcon;
    [self setImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateDisabled];
}

-(void)setIcon:(NSString *)icon
{
    _icon = icon;
    [self setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
}


-(void)setFrame:(CGRect)frame
{
    frame.size = CGSizeMake(KDockItemW, KDockItemH);
    [super setFrame:frame];
}

@end
