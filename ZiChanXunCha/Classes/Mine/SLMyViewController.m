//
//  SLMyViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLMyViewController.h"
#import "SLMyCostViewController.h"

@interface SLMyViewController ()

@end


@implementation SLMyViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden = YES;
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}


- (IBAction)myCost:(id)sender {
    SLMyCostViewController * cost = [[SLMyCostViewController alloc]init];
    [self.navigationController pushViewController:cost animated:YES];
    
    
}

@end
