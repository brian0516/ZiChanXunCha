//
//  SLPlayVideoController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/23.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLPlayVideoController.h"
#import "HcdCacheVideoPlayer.h"

//???改变视频地址
static NSString * const KUrlString = @"http://oaundxu29.bkt.clouddn.com/Ferr2DTerrainunity3d.mp4";
static CGFloat const KNavigationBarBottom = 64.0f;
static CGFloat const KAspect = 0.5625; //宽高比;


@interface SLPlayVideoController ()
@property(nonatomic,strong) HcdCacheVideoPlayer * play;




@end

@implementation SLPlayVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    UIView * bgView = [[UIView alloc]initWithFrame:self.view.bounds];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    [self.view addSubview:bgView];
    
    

    [self configNavigationBar];
    
    [self configPlayer];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0,kScreenHeight-150, 44, 44);
    btn.centerX = self.view.centerX;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    btn.backgroundColor = [UIColor redColor];
    [btn setImage:[UIImage imageNamed:@"xc_delete"] forState:UIControlStateNormal];
    btn.tintColor = [UIColor whiteColor];
    [self.view addSubview:btn];
    
    
}


-(void)btnClick:(id)sender{

    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    
}

#pragma -mark -privateMethod
//设置播放器
-(void)configPlayer{

    UIView *videoView = [[UIView alloc]init];
    videoView.frame   = CGRectMake(0,KNavigationBarBottom,kScreenWidth,kScreenWidth * KAspect);
    videoView.center = self.view.center;
    
    [self.view addSubview:videoView];

    self.play         = [[HcdCacheVideoPlayer alloc]init];

    [self.play playWithUrl:[NSURL URLWithString:KUrlString]
              showView:videoView
          andSuperView:self.view
             withCache:YES];

    DefineWeakSelf;
    self.play.backBtnBlock =^{
        [weakSelf.play fullScreen];
    };

//    [self.play fullScreen];

}


-(void)configNavigationBar{
    UIBarButtonItem * leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.title = @"视频播放";
}


#pragma -mark - actions
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
