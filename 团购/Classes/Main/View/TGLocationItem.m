//
//  TGLocationItem.m
//  团购
//
//  Created by 陆佳磊 on 15/7/31.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGLocationItem.h"
#import "TGCityListController.h"
#define KImageScale 0.5

@interface TGLocationItem()<UIPopoverControllerDelegate>
{
    UIPopoverController *_popover;
}

@end


@implementation TGLocationItem

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self setIcon:@"ic_district" selectedIcon:@"ic_district_hl"];
        
        // 设置默认的文字
        [self setTitle:@"定位中" forState:UIControlStateNormal];
        // 设置状态
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.imageView.contentMode = UIViewContentModeBottom;
        
        
        [self addTarget:self action:@selector(locationClick) forControlEvents:UIControlEventTouchDown];

    }
    return self;
}

#pragma mark - 监听屏幕旋转的通知
//-(void)screenRotation
//{
//    MyLog(@"屏幕的方向");
//    if (_popover.popoverVisible)
//    {
//        // 关闭之前的
//        [_popover dismissPopoverAnimated:NO];
//        // 创建新的
//        [self performSelector:@selector(locationClick) withObject:nil afterDelay:0.5];
//    }
//}
#pragma mark - 点击location
-(void)locationClick
{
    TGCityListController *cityListCtrl = [[TGCityListController alloc] init];
    
    _popover = [[UIPopoverController alloc] initWithContentViewController:cityListCtrl];
    _popover.popoverContentSize = CGSizeMake(320, 640);
    // self.bounds   self
    // self.frame    self.superview
    [_popover presentPopoverFromRect:self.bounds inView:self permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    _popover.delegate = self;
    
    // 监听屏幕旋转的通知
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenRotation) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}

//-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
//{
//    // popver被销毁的时候移除监听
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
//
//
//-(void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}




-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height * KImageScale;
    return CGRectMake(0, 0, w, h);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height * (1-KImageScale);
    CGFloat y = contentRect.size.height - h;
    return CGRectMake(0, y, w, h);
}

@end
