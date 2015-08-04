//
//  TGDock.m
//  团购
//
//  Created by 陆佳磊 on 15/7/31.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGDock.h"
#import "TGMoreItem.h"
#import "TGLocationItem.h"
#import "TGTabItem.h"

@interface TGDock()
{
    TGTabItem *_selectItem; // 被选中的标签
}
@end


@implementation TGDock

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 1.自动伸缩（高度 + 右边间距）
        
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
        // 2. 设置背景
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tabbar"]];
        
        // 3.添加logo
        [self addlogo];
        
        // 4.添加标签选项
        [self addTabs];
        // 5.添加定位
        [self addLocation];
        // 6.添加更多
        [self addMore];
    }
    return self;
}

#pragma mark - 添加选项标签
-(void)addTabs
{
    // 1.团购
    [self addOneTab:@"ic_deal" selectIcon:@"ic_deal_hl" index:1];
    
    // 2.地图
    [self addOneTab:@"ic_map" selectIcon:@"ic_map_hl" index:2];
    
    // 3.收藏
    [self addOneTab:@"ic_collect" selectIcon:@"ic_collect_hl" index:3];
    
    // 4.我的
    [self addOneTab:@"ic_mine" selectIcon:@"ic_mine_hl" index:4];
    
    // 5.添加底部分割线
    UIImageView *divider = [[UIImageView alloc] init];
    divider.image = [UIImage imageNamed:@"separator_tabbar_item"];
    divider.frame = CGRectMake(0, KDockItemH*5, KDockItemW, 2);
    [self addSubview:divider];

}

#pragma mark - 添加tab
-(void)addOneTab:(NSString *)icon selectIcon:(NSString *)selectIcon index:(NSInteger)index
{
    TGTabItem *itemTab = [[TGTabItem alloc] init];
    [itemTab setIcon:icon selectedIcon:selectIcon];
    itemTab.frame = CGRectMake(0, KDockItemH*index, 0, 0);
    [self addSubview:itemTab];
    itemTab.tag = index - 1;
    [itemTab addTarget:self action:@selector(tabClick:) forControlEvents:UIControlEventTouchUpInside];
    
    if (index == 1)
    {
        [self tabClick:itemTab];
    }
    
}

#pragma mark - 添加按钮的监听
-(void)tabClick:(TGTabItem *)tabItem
{
    // 通知代理
    if ([_delegate respondsToSelector:@selector(dock:tabChangeFrom:to:)])
    {
        [self.delegate dock:self tabChangeFrom:_selectItem.tag to:tabItem.tag];
    }

    // 1.先还原
    _selectItem.enabled = YES;
    // 2.不能点击
    tabItem.enabled = NO;
    // 3.赋值
    _selectItem = tabItem;
    
}


#pragma mark - 添加定位
-(void)addLocation
{
    TGLocationItem *location = [[TGLocationItem alloc] init];
    CGFloat y = self.frame.size.height - KDockItemH*2;
    location.frame = CGRectMake(0, y, 0, 0);
    //location.enabled = NO;
    [self addSubview:location];
}

#pragma mark - 添加更多
-(void)addMore
{
    TGMoreItem *more = [[TGMoreItem alloc] init];
    CGFloat y = self.frame.size.height-KDockItemH;
    more.frame = CGRectMake(0, y, 0, 0);
    //more.enabled = NO;
    [self addSubview:more];
    
    
}
#pragma mark - 添加LOGO
-(void)addlogo
{
    UIImageView *logo = [[UIImageView alloc] init];
    logo.image = [UIImage imageNamed:@"ic_logo.png"];
    CGFloat scale = 0.65;
    CGFloat logoW = logo.image.size.width * scale;
    CGFloat logoH = logo.image.size.height * scale;
    logo.bounds = CGRectMake(0, 0, logoW, logoH);
    // 设置位置
    logo.center = CGPointMake(KDockItemW*0.5, KDockItemW*0.5);
    [self addSubview:logo];
}


#pragma mark - 重写setFrame方法：内定自己的宽度
-(void)setFrame:(CGRect)frame
{
    frame.size.width = KDockItemW;
    [super setFrame:frame];
}


@end
