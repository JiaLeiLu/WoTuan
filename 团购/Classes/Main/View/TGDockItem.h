//
//  TGDockItem.h
//  团购
//
//  Created by 陆佳磊 on 15/7/31.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGDockItem : UIButton
{
    UIImageView *_divider;
}
/**
 *  普通图片
 */
@property(nonatomic,copy)NSString *icon;
/**
 *  选中图片
 */
@property(nonatomic,copy)NSString *selectedIcon;

-(void)setIcon:(NSString *)icon selectedIcon:(NSString *)selectedIcon;

@end
