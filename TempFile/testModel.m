//
//  testModel.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/30.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "testModel.h"

@implementation testModel
-(instancetype)initWithNotificationName:(NSString *)name{
    self = [super init];
    if (self) {
        
        NSString * sName = [NSString stringWithFormat:@"%@SelectedAll",name];
        NSString * desName = [NSString stringWithFormat:@"%@DeselectedAll",name];
        
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(select:) name:sName object:nil];
        
         [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(deSelect) name:desName object:nil];
        
    }
    return self;
}


-(void)select:(NSNotification*)noti{
    self.selected = YES;
}


-(void)deSelect{
    self.selected = NO;
}


@end
