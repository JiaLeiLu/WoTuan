//
//  CitiesSectionModel.m
//  团购
//
//  Created by 陆佳磊 on 15/8/4.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGCitiesSectionModel.h"
#import "TGCityModel.h"
#import "NSObject+Value.h"
@implementation TGCitiesSectionModel
-(void)setCities:(NSArray *)cities
{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary*dict in cities)
    {
        TGCityModel *model = [[TGCityModel alloc] init];
        [model setValues:dict];
        [array addObject:model];
       
    }
    _cities = array;

    
}
@end
