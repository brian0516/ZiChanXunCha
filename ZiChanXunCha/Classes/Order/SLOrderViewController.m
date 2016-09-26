//
//  SLOrderViewController.m
//  ZiChanXunCha
//  待接单列表
//  Created by shuanglong on 16/9/18.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderViewController.h"
#import "ViewController.h"

@interface SLOrderViewController ()

@end

@implementation SLOrderViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, kScreenWidth, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
}


-(void)test{


    [self.navigationController pushViewController:[[ViewController alloc]init] animated:YES];
    
}

@end
