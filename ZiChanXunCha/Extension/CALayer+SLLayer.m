//
//  CALayer+SLLayer.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/30.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "CALayer+SLLayer.h"

@implementation CALayer (SLLayer)

//添加设置cornerRadius的方法,XIB使用
- (void)setLayerCornerRadius:(NSNumber*)radius
{
    self.cornerRadius = [radius floatValue];
}


@end
