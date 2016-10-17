//
//  UIImageView+SLImageView.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "UIImageView+SLImageView.h"

@implementation UIImageView (SLImageView)

-(void)setStretchableImageWithName:(NSString*)imageName{
    UIImage * image = [UIImage imageNamed:imageName];
    image = [image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    self.image = image;
}

@end
