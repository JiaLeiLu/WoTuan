//
//  TGMoreItem.m
//  团购
//
//  Created by 陆佳磊 on 15/7/31.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGMoreItem.h"
#import "TGMoreController.h"
#import "TGNavigationController.h"
@implementation TGMoreItem

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 自动伸缩
         self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self setIcon:@"ic_more.png" selectedIcon:@"ic_more_hl.png"];
        
        
//        [self addTarget:self action:@selector(more) UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

#pragma mark - 更多
-(void)moreClick
{
    self.enabled = NO;
    // 弹出更多
    TGMoreController *moreCtrl = [[TGMoreController alloc] init];
    TGNavigationController *nav = [[TGNavigationController alloc] initWithRootViewController:moreCtrl];
    moreCtrl.moreItem = self;
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
//    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.window.rootViewController presentViewController:nav animated:YES completion:nil];
}


@end
