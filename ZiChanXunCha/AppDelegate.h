//
//  AppDelegate.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/7.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,assign)PPNetworkStatus networkStatus;

/**
 *  设置主控制器
 */
-(BOOL)configRootViewController:(NSString*)viewControllerName;

@end

