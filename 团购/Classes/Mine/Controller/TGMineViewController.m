//
//  TGMineViewController.m
//  团购
//
//  Created by 陆佳磊 on 15/8/2.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGMineViewController.h"

@interface TGMineViewController ()

@end

@implementation TGMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"退出登录" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = item;
    
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
