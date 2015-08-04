//
//  TGCity.m
//  团购
//
//  Created by 陆佳磊 on 15/8/4.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGCityModel.h"
#import "TGDistrictModel.h"
#import "NSObject+Value.h"
@implementation TGCityModel
-(void)setDistricts:(NSArray *)districts
{
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary*dict in districts)
    {
        TGDistrictModel *model = [[TGDistrictModel alloc] init];
        [model setValues:dict];
        [array addObject:model];
    }
    
    _districts = array;
    
}

@end
