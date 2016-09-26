//
//  RSADemoViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/26.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "RSADemoViewController.h"
#import "RSA.h"

@interface RSADemoViewController ()

@property(nonatomic,assign) id encryptData;

@end

@implementation RSADemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [PPNetworkHelper GET:@"http://192.168.0.190:8080/patrol-web/app/appUser/test.do" parameters:nil success:^(id responseObject) {
        
        DLog(@"成功 = %@",responseObject);
        
        
    } failure:^(NSError *error) {
        
        DLog(@"失败 = %@",error);
        
    }];

    
    
    
}



@end
