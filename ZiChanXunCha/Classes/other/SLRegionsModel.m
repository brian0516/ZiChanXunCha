//
//  SLRegionsModel.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/10.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLRegionsModel.h"

@implementation SLRegionsModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name":@"n",
             @"cid":@"i",
             @"subRegions":@"c"};
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"subRegions" : SLRegionsModel.class,
           };
}

@end
