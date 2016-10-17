//
//  SLBaseViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/18.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLBaseViewController.h"

@interface SLBaseViewController ()

@end

@implementation SLBaseViewController


-(instancetype)init{
    self = [super init];
    if (self) {
           }
    return self;
}


-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


-(instancetype)initWithTitle:(NSString *)t tabBarItemImage:(NSString *)img{
    self = [super init];
    if (self) {
        self.title = t;
        self.tabBarItem.image = [UIImage imageNamed:img];
        NSString * seletedImage = [NSString stringWithFormat:@"%@_selected",img];
        self.tabBarItem.selectedImage = [UIImage imageNamed:seletedImage];
    }
    return self;

}


@end
