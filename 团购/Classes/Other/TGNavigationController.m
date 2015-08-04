//
//  TGNavigationController.m
//  团购
//
//  Created by 陆佳磊 on 15/8/2.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGNavigationController.h"
#import "UIImage+Lu.h"
@interface TGNavigationController ()

@end

@implementation TGNavigationController




- (void)viewDidLoad {
    [super viewDidLoad];
  
    
}

#pragma mark - 第一次使用类的时候调用这个方法（只调用一次）
+(void)initialize
{
    // 导航栏
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:[UIColor whiteColor]];
    //[bar setBackgroundImage:[UIImage resizedImage:@"bg_navigation"] forBarMetrics:UIBarMetricsDefault];
    // 导航栏按钮
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setBackgroundImage:[UIImage imageNamed:@"bg_navigation_right.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imageNamed:@"bg_navigation_right_hl.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    // 导航栏按钮的文字
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor darkGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    [item setTitleTextAttributes:dict forState:UIControlStateHighlighted];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
