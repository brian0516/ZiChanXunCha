//
//  SLQuestionsViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/26.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLQuestionsViewController.h"
#import "iCarousel.h"
#import "SLQuestionTableView.h"

// MARK: 静态字符串
static NSString * const KBgImageViewName = @"questionsBg";
static NSString * const KBgColor = @"0076dd";
static CGFloat const KLabelTag = 101;

// MARK: 布局
static CGFloat const KBgImageViewTopOffSet = 80.0f;
static CGFloat const KBgImageViewMargin = 30.0f;
static CGFloat const KBgImageViewBottomOffSet = 100.0f;


@interface SLQuestionsViewController ()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic,strong)UIImageView * bgImageView;
@property (nonatomic,strong)iCarousel * questionView;
@property (nonatomic,strong)UILabel * pageLabel;

@end

@implementation SLQuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:KBgColor];
    
    self.questionView.frame = CGRectMake(0,0,kScreenWidth-30,(kScreenWidth-30)*1.4);
    self.questionView.layer.cornerRadius = 15;
    self.questionView.layer.masksToBounds = YES;
    self.questionView.center = self.view.center;
    
    CALayer * layer1 = [self creatLayWithBound:self.questionView.bounds color:[UIColor colorWithHexString:@"80bbee"]];
    CALayer * layer2 = [self creatLayWithBound:layer1.bounds color:[UIColor colorWithHexString:@"66adeb"]];
    CALayer * layer3 = [self creatLayWithBound:layer2.bounds color:[UIColor colorWithHexString:@"4d9fe7"]];
    
    layer1.frame = CGRectMake(0, 0, layer1.width-30, layer1.height*0.9);
    layer1.center = self.questionView.center;
    layer1.top  = self.questionView.top;
    layer1.top -= 15;
    
    layer2.frame = CGRectMake(0, 0, layer1.width-30, layer2.height*0.9);
    layer2.center = layer1.center;
    layer2.top = layer1.top;
    layer2.top -= 15;

    layer3.frame = CGRectMake(0, 0, layer2.width-30, layer3.height*0.9);
    layer3.center = layer2.center;
    layer3.top = layer2.top;
    layer3.top -=15;
    
    
    [self.view.layer addSublayer:layer3];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer1];
    [self.view addSubview:_questionView];
    [self.view addSubview:self.pageLabel];
    
}


-(CALayer*)creatLayWithBound:(CGRect)bounds color:(UIColor*)color{
    CALayer * layer = [[CALayer alloc]init];
    layer.frame = bounds;
    layer.cornerRadius = 15;
    layer.masksToBounds = YES;
    layer.backgroundColor = color.CGColor;
    return layer;
}



-(void)_layoutSubViews{
    
    DefineWeakSelf;

    
    [self.questionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KBgImageViewMargin);
        make.right.offset(-KBgImageViewMargin);
        make.height.mas_equalTo(weakSelf.questionView.mas_width).multipliedBy(1.5);
        make.center.mas_equalTo(weakSelf.view);
    }];

}


#pragma -mark ---------icrouselDelegate-----------

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{

    return 10;
    
    
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    
    if (!view) {
        view = [self creatIcarouselView:carousel];
    }
    
    
    UILabel * label = [view viewWithTag:KLabelTag];
    label.text = [NSString stringWithFormat:@"第%ld题",index+1];
    
    return view;

}



- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    NSInteger currentPage = carousel.currentItemIndex+1;
    NSString * pageIndicator = [NSString stringWithFormat:@"%ld / %ld",currentPage,carousel.numberOfItems];
    self.pageLabel.text = pageIndicator;
}



//创建carousel视图
-(UIView*)creatIcarouselView:(iCarousel*)carousel{
    UIView * view = [[UIView alloc]init];
    view.frame = carousel.bounds;
    UIImageView * imageView = [self creatImageView];
    [view addSubview:imageView];
    
    UILabel * label = [self creatLabel];
    [imageView addSubview:label];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25);
        make.centerX.mas_equalTo(view);
    }];
    
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(imageView);
        make.bottomMargin.mas_equalTo(imageView);
        make.leftMargin.mas_equalTo(imageView);
        make.rightMargin.mas_equalTo(imageView);
    }];
    
    
    return view;
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

-(iCarousel *)questionView{
    if (!_questionView) {
        _questionView = [[iCarousel alloc]init];
        _questionView.backgroundColor = [UIColor whiteColor];
        _questionView.delegate = self;
        _questionView.dataSource = self;
        _questionView.decelerationRate = 1.0;
        _questionView.scrollSpeed = 1.0;
        _questionView.type = iCarouselTypeLinear;
        _questionView.pagingEnabled = YES;
        _questionView.clipsToBounds = YES;
        _questionView.bounceDistance = 0.2;

    }
    return _questionView;
}


-(UIImageView *)creatImageView{
    UIImageView * imageView;
    imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"xc_tihao"];
    imageView.frame = CGRectMake(130, 25, 100, 40);
    return imageView;
}

-(UILabel*)creatLabel{
    UILabel * label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = KLabelTag;
    label.textColor = [UIColor colorWithHexString:KBgColor];
    return label;
}


-(UILabel*)pageLabel{
    if (!_pageLabel) {
        _pageLabel = [[UILabel alloc]init];
        _pageLabel.textAlignment = NSTextAlignmentCenter;
        _pageLabel.textColor = [UIColor whiteColor];
        _pageLabel.frame = CGRectMake(0, 0, 100, 30);
        _pageLabel.centerX = self.view.centerX;
        _pageLabel.bottom = self.view.bottom-20;
    }
    
    return _pageLabel;
}



@end
