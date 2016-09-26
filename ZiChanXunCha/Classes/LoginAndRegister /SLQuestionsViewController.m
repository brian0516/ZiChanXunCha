//
//  SLQuestionsViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/26.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLQuestionsViewController.h"

// MARK: 静态字符串
static NSString * const KBgImageViewName = @"questionsBg";



// MARK: 布局
static CGFloat const KBgImageViewTopOffSet = 80.0f;
static CGFloat const KBgImageViewMargin = 30.0f;
static CGFloat const KBgImageViewBottomOffSet = 100.0f;


@interface SLQuestionsViewController ()

@property (nonatomic,strong)UIImageView * bgImageView;

@property (nonatomic,strong)UIView * questionView;


@end

@implementation SLQuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _layoutSubViews];
 
    
    
}

-(void)_layoutSubViews{
    
    DefineWeakSelf;

    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(KBgImageViewTopOffSet);
        make.bottom.offset(-KBgImageViewBottomOffSet);
        make.left.offset(KBgImageViewMargin);
        make.right.offset(-KBgImageViewMargin);
    }];
    
    
    [self.questionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.bgImageView);
        make.left.mas_equalTo(weakSelf.bgImageView);
        make.right.mas_equalTo(weakSelf.bgImageView);
        make.height.mas_equalTo(weakSelf.bgImageView.mas_height).offset(-100);
    }];

}


#pragma -mark lazyLoad

-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:KBgImageViewName];
        [self.view addSubview:_bgImageView];
    }
    return _bgImageView;
}

-(UIView *)questionView{
    if (!_questionView) {
        _questionView = [[UIView alloc]init];
        _questionView.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.8];
        [self.view addSubview:_questionView];
    }
    return _questionView;
}

@end
