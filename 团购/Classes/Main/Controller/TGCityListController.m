//
//  TGCityListController.m
//  团购
//
//  Created by 陆佳磊 on 15/8/3.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGCityListController.h"
#import "TGCitiesSectionModel.h"
#import "NSObject+Value.h"
#import "TGCityModel.h"

#define KsearchHeight 44
@interface TGCityListController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    NSMutableArray *_citiesSectionArray; // 所有城市组
    UIView *_cover; // 遮盖
    UITableView *_tableView;
    UISearchBar *_searchbar;
}
@end

@implementation TGCityListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1.添加搜素框
    [self addSearchBar];
    // 2.添加tableView
    [self addTableView];
    
    // 3.加载数据源
    [self loadCityData];
    
}
#pragma  mark - 加载城市数据
-(void)loadCityData
{
    _citiesSectionArray = [NSMutableArray array];
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cities.plist" ofType:nil]];
    for (NSDictionary *dict in array)
    {
        TGCitiesSectionModel *sectionModel = [[TGCitiesSectionModel alloc] init];
        [sectionModel setValues:dict];
        [_citiesSectionArray addObject:sectionModel];
    }
    
}

#pragma mark - 添加搜索框
-(void)addSearchBar
{
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KsearchHeight)];
    _searchbar.delegate = self;
    _searchbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _searchbar.placeholder = @"输入城市名或拼音";
//    _searchbar.barStyle = UIBarStyleBlackTranslucent;
    [self.view addSubview:_searchbar];
}
#pragma mark - 添加tableView
-(void)addTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KsearchHeight, self.view.frame.size.width, self.view.frame.size.height-KsearchHeight) style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    tableView.sectionHeaderHeight = 40;
    [self.view addSubview:_tableView];
}

#pragma mark - UISearchBar的代理方法
// 文字改变
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}
// 搜索框开始编辑
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // 1.显示取消按钮
    [searchBar setShowsCancelButton:YES];
    // 2.显示蒙板
    if(_cover == nil)
    {
        _cover = [[UIView alloc] init];
        _cover.backgroundColor = [UIColor blackColor];
        _cover.frame = _tableView.frame;
        _cover.autoresizingMask = _tableView.autoresizingMask;
       UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverClick)];
         [_cover addGestureRecognizer:tap];
    }
    
    [self.view addSubview:_cover];
    
    _cover.alpha = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        _cover.alpha = 0.7;
    }];
    
}
#pragma mark - 当退出搜索框的键盘(失去第一响应者)
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self coverClick];
}
#pragma mark - 点击取消按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self coverClick];
}
#pragma mark -点击蒙板
-(void)coverClick
{
    // 1. 移除蒙板
    [UIView animateWithDuration:0.3 animations:^{
        _cover.alpha = 0.0;
    } completion:^(BOOL finished) {
         [_cover removeFromSuperview];
    }];
   
    // 2. 隐藏取消按钮
    [_searchbar setShowsCancelButton:NO];
    // 3. 退出键盘
    [_searchbar resignFirstResponder];
}
#pragma mark - UITableView的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _citiesSectionArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TGCitiesSectionModel *citySectionModel =_citiesSectionArray[section];
    return citySectionModel.cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    TGCitiesSectionModel *citySectionModel =_citiesSectionArray[indexPath.section];
    TGCityModel *cityModel = citySectionModel.cities[indexPath.row];
    cell.textLabel.text = cityModel.name;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    TGCitiesSectionModel *sectionModel = _citiesSectionArray[section];
    return sectionModel.name;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    // KVC 取出_citiesDataArray中所有字典name属性的值，返回一个数组
    
    return [_citiesSectionArray valueForKey:@"name"];
}
@end
