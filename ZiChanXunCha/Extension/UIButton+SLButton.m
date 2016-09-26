//
//  UIButton+SLButton.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/24.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "UIButton+SLButton.h"

@implementation UIButton (SLButton)

-(void)setBackgroundColor:(UIColor *)backgroundColor ForState:(UIControlState)state{

    UIImage * image = [self imageWithColor:backgroundColor];
    [self setBackgroundImage:image forState:state];
    
}

//  颜色转换为背景图片
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



@end
