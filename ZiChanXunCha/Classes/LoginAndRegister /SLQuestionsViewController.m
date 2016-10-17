//
//  SLQuestionsViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/26.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLQuestionsViewController.h"
#import "iCarousel.h"
#import "SLQuestionView.h"


// MARK: 静态字符串
static NSString * const KBgImageViewName = @"questionsBg";
static NSString * const KBgColor = @"0076dd";

// MARK: 布局
//static CGFloat const KBgImageViewTopOffSet = 80.0f;
static CGFloat const KBgImageViewMargin = 30.0f;
//static CGFloat const KBgImageViewBottomOffSet = 100.0f;
static CGFloat const KCommitBtnWidth = 75;

@interface SLQuestionsViewController ()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic,strong)UIImageView * bgImageView;
@property (nonatomic,strong)iCarousel * questionView;
@property (nonatomic,strong)UILabel * pageLabel;
@property (nonatomic,strong)NSArray * titlesArr;
@property (nonatomic,strong)UIButton * commitBtn;

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
    self.questionView.centerY += 30;
    
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
    
    UILabel * l = [[UILabel alloc]init];
    l.frame = CGRectMake(0, 30, kScreenWidth, 40);
    l.text = @"答题申请";
    l.textAlignment = NSTextAlignmentCenter;
    l.font = [UIFont systemFontOfSize:17];
    l.textColor = UIColorHex(ffffff);
    [self.view addSubview:l];
    
    
    self.commitBtn.frame = CGRectMake(0, 0, KCommitBtnWidth, KCommitBtnWidth);
    self.commitBtn.centerX = self.questionView.centerX;
    self.commitBtn.centerY = self.questionView.bottom;
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
        make.centerX.mas_equalTo(weakSelf.view);
        make.centerY.offset(40);
    }];

}

#pragma -mark ---------icrouselDelegate-----------

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{

    return 10;
    
    
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    
    SLQuestionView * questionView = (SLQuestionView*)view;
    
    if (view == nil) {
        view = [self creatIcarouselView:carousel];
        questionView = (SLQuestionView*)view;
    }
    
    questionView.label.text = [NSString stringWithFormat:@"第%ld题",index+1];
    questionView.titleLabel.text = self.titlesArr[index];

    return view;
    
}


- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    NSInteger currentPage = carousel.currentItemIndex+1;
    NSString * pageIndicator = [NSString stringWithFormat:@"%ld / %ld",currentPage,carousel.numberOfItems];
    self.pageLabel.text = pageIndicator;
    
    
    //设置提交按钮的隐藏和显示
    
    if (currentPage == carousel.numberOfItems) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.commitBtn.hidden = NO;
            self.pageLabel.hidden = YES;
        }];
        
       
    }
    else{
        self.commitBtn.hidden = YES;
        self.pageLabel.hidden = NO;
    }
    
}



//创建carousel视图
-(SLQuestionView*)creatIcarouselView:(iCarousel*)carousel{
    SLQuestionView * view = [[SLQuestionView alloc]init];
    view.frame = carousel.bounds;
    return view;
}



#pragma -mark --------actions------
-(void)commit:(id)sender{

    //这里跳转到填写巡查人员信息

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


-(UIButton *)commitBtn{
    if (!_commitBtn) {
        _commitBtn  = [UIButton buttonWithType:UIButtonTypeSystem];
        _commitBtn.backgroundColor = UIColorHex(f7ab00);
        [_commitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [self.view addSubview:_commitBtn];
        _commitBtn.hidden = YES;
        _commitBtn.layer.masksToBounds = YES;
        _commitBtn.layer.cornerRadius = KCommitBtnWidth/2;
        [_commitBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        [_commitBtn addTarget:self action:@selector(commit:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commitBtn;
}





-(NSArray *)titlesArr{
    if (!_titlesArr) {
        _titlesArr = @[@"这是第一题快速机动洛杉矶的离开?",@"这是第二题快速机动洛杉矶的离开据了解受打击陪外婆?",@"这是第三题快速机动洛杉矶的结网ieoiwe离开据了解受打击陪外婆?",@"这是第四题快速机动洛杉矶的结网ieoiwe离开据尽快了解爱上帝问等级哦我了解受打击陪外婆?",@"这是第五题快速机动洛杉矶的结网ieoiwe离开据尽快了解爱上帝问等级哦我了解受打击陪外婆?",@"这是第六题快速机动洛杉矶的结网ieoiwe离开据尽快了解爱上帝问等级哦我了解受打击陪外婆?",@"这是第七题快速机动洛杉矶的结网ieoiwe离开据尽快了解爱上帝问等级哦我了解受打击陪外婆?",@"这是第八题快速机动洛杉矶的结网ieoiwe离开据尽快了解爱上帝问等级哦我了解受打击陪外婆?",@"这是第九题快速机动洛杉矶的结网ieoiwe离开据尽快了解爱上帝问等级哦我了解受打击陪外婆?",@"这是第十题快速机动洛杉矶的结网ieoiwe离开据尽快了解爱上帝问等级哦我了解受打击陪外婆?"];
    }
    return _titlesArr;
}



@end
