//
//  SLUserInfoViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLUserInfoViewController.h"
#import "SLSegmentController.h"
#import "iCarousel.h"

@interface SLUserInfoViewController ()<SLSegmentControllerDelegate,iCarouselDelegate,iCarouselDataSource>

@property(nonatomic,strong)SLSegmentController * segmentControllerView;

@property(nonatomic,strong)iCarousel * carousel;


@end

@implementation SLUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
