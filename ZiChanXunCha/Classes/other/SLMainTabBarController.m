//
//  SLMainTabBarController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/18.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLMainTabBarController.h"
#import "SLBaseViewController.h"

@interface SLMainTabBarController ()

@end

@implementation SLMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:@"SLOrderViewController" title:@"接单" image:@"order"];
    [self addChildViewController:@"SLOrderListViewController" title:@"订单" image:@"order"];
    [self addChildViewController:@"SLMineViewController" title:@"我的" image:@"order"];
    [self addChildViewController:@"SLMoreViewController" title:@"更多" image:@"order"];
    
}




//添加子控制器
-(void)addChildViewController:(NSString*)viewControllerName title:(NSString*)title image:(NSString*)imageName{
    
    Class class = NSClassFromString(viewControllerName);
   SLBaseViewController  * viewController = [[class alloc]initWithTitle:title tabBarItemImage:[UIImage imageNamed:imageName]];
    SLNavigationController * nv = [[SLNavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nv];
    
}


@end
