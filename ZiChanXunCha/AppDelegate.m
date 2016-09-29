//
//  AppDelegate.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/7.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "AppDelegate.h"
#import "SLMainViewController.h"
#import "ViewController.h"
#import "SLMainTabBarController.h"


@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self startNetworkMonitor];
    
    // TODO 这里判断是否登录
    //    NSString * viewContorllerName = @"ViewController";
//        NSString * viewContorllerName = @"SLMainViewController";
    //     NSString * viewContorllerName = @"RSADemoViewController";
    NSString * viewContorllerName = @"SLMainTabBarController";
    return [self configRootViewController: viewContorllerName];
    
}


#pragma -mark ----privateMethod------

// 开启网络监测
-(void)startNetworkMonitor{
    
    [PPNetworkHelper startMonitoringNetwork];
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatus status) {
        _networkStatus = status;
        
        switch (status) {
            case PPNetworkStatusNotReachable:
            {
                [XHToast showCenterWithText:@"网络出现故障~" duration:3];
            }
                break;
                
            default:
                break;
        }
    }];
}


-(BOOL)configRootViewController:(NSString*)viewControllerName{

    if (self.window) {
        self.window = nil;
    }
    
    Class class = NSClassFromString(viewControllerName);
    id viewController = [[class alloc]init];
    
    self.window                               = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    if ([class isSubclassOfClass:[SLMainViewController class]]) {
            SLNavigationController * nv = [[SLNavigationController alloc]initWithRootViewController:viewController];
        self.window.rootViewController = nv;
    }
    else{
    self.window.rootViewController            = viewController;
    }
    [self.window makeKeyAndVisible];
    
    return self.window?YES:NO;

}

@end
