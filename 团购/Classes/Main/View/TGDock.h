//
//  TGDock.h
//  团购
//
//  Created by 陆佳磊 on 15/7/31.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TGDock;
@protocol TGDockDelegate <NSObject>
@optional
-(void)dock:(TGDock *)dock tabChangeFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface TGDock : UIView
@property (nonatomic,weak)id<TGDockDelegate>delegate;
@end
