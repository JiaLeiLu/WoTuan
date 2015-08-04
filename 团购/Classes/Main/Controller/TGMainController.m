//
//  TGMainController.m
//  团购
//
//  Created by 陆佳磊 on 15/7/31.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGMainController.h"
#import "TGDock.h"
#import "TGDealListViewController.h"
#import "TGMineViewController.h"
#import "TGCollectViewController.h"
#import "TGMapViewController.h"
#import "TGNavigationController.h"
@interface TGMainController ()<TGDockDelegate>

@property(nonatomic,strong)TGDock *dock;
@end

@implementation TGMainController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加Dock
    TGDock *dock = [[TGDock alloc] init];
    dock.frame = CGRectMake(0, 0, 0, self.view.frame.size.height);
    [self.view addSubview:dock];
    
    dock.delegate = self;
    _dock = dock;
    
    // 2.添加自控制器
    [self addAllControllers];
    
}

#pragma mark - 添加子控制器
-(void)addAllControllers
{
    // 团购控制器
    TGDealListViewController *dealListController = [[TGDealListViewController alloc] init];
    TGNavigationController *dealNav = [[TGNavigationController alloc] initWithRootViewController:dealListController];
    [self addChildViewController:dealNav];
    
    // 地图控制
    TGMapViewController *mapController = [[TGMapViewController alloc] init];
    TGNavigationController *mapNav = [[TGNavigationController alloc] initWithRootViewController:mapController];
    [self addChildViewController:mapNav];
    
    // 收藏
    TGCollectViewController *collectController = [[TGCollectViewController alloc] init];
    TGNavigationController *collectNav = [[TGNavigationController alloc] initWithRootViewController:collectController];
    [self addChildViewController:collectNav];
    
    // 我的
    TGMineViewController *mineController = [[TGMineViewController alloc] init];
    TGNavigationController *mineNav = [[TGNavigationController alloc] initWithRootViewController:mineController];
    [self addChildViewController:mineNav];
    
    
    // 默认选中团购控制器
    [self dock:nil tabChangeFrom:0 to:0];
}


-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    // 旋转屏幕
}


#pragma mark - 点击了某一个标签
-(void)dock:(TGDock *)dock tabChangeFrom:(NSInteger)from to:(NSInteger)to
{
    MyLog(@"%lf----%lf",self.view.frame.size.width,self.view.frame.size.height);
    // 先移除旧的控制器
    UIViewController *old = self.childViewControllers[from];
    [old.view removeFromSuperview];
    
    // 添加新的控制器
    UIViewController *new = self.childViewControllers[to];
    CGFloat w = self.view.frame.size.width - KDockItemW;
    CGFloat H = self.view.frame.size.height;
    new.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    new.view.frame = CGRectMake(KDockItemW, 0, w, H);
    [self.view addSubview:new.view];
}


@end
