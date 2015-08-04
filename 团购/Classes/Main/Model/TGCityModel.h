//
//  TGCity.h
//  团购
//
//  Created by 陆佳磊 on 15/8/4.
//  Copyright (c) 2015年 LU. All rights reserved.
//

#import "TGBaseModel.h"

@interface TGCityModel :TGBaseModel
@property(nonatomic,strong)NSArray *districts;
@property(nonatomic,assign) BOOL hot;
@end
