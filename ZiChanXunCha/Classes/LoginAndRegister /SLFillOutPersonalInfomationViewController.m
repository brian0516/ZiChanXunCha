//
//  SLFillOutPersonalInfomationViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/28.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLFillOutPersonalInfomationViewController.h"
#import "SLBaseTableView.h"
#import "SLFillOutInfomationCell.h"


// MARK:静态字符串
static NSString * const KSegmentControllerView  = @"SegmentController";
static NSString * const KLabelColorNormal       =  @"666666";
static NSString * const KLabelColorSelected     = @"0076dd";

// MARK: 布局
static CGFloat const KSegmentControllerHeight = 45;




@interface SLFillOutPersonalInfomationViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)SLBaseTableView * tableView;
@property (nonatomic,strong)UIView * accessoryView;
@property (nonatomic,strong)UIView * segmentControllerView;
@property (nonatomic,assign)BOOL  basicInfoSelected;
@property (nonatomic,assign)BOOL accessoryInfoSelected;



@property (weak, nonatomic) IBOutlet UILabel *basicInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessoryInfoLabel;
@property (weak, nonatomic) IBOutlet UIView *segIndicatorLine;
@property (weak, nonatomic) IBOutlet UIView *gapLine;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *segIndicatorLeading;

@end

@implementation SLFillOutPersonalInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"巡查人员信息";
    [self _layoutSubViews];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*2,0);
}




#pragma -mark -------privateMethod----------
-(void)_layoutSubViews{

    DefineWeakSelf;
    
    [self.segmentControllerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(64);
        make.leftMargin.offset(0);
        make.width.offset(kScreenWidth);
        make.height.equalTo(@(KSegmentControllerHeight));
    }];
    
    
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.segmentControllerView.mas_bottom).offset(1);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        
    }];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView);
        make.left.equalTo(weakSelf.scrollView);
        make.width.equalTo(weakSelf.scrollView);
        make.height.equalTo(weakSelf.scrollView.mas_height);
    }];
    
    
    
    [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView);
        make.left.equalTo(weakSelf.scrollView).offset(kScreenWidth);
        make.width.equalTo(weakSelf.scrollView);
        make.height.equalTo(weakSelf.scrollView.mas_height);
    }];
 
}

//更新indicatorLine的约束
-(void)upDateLayoutOfIndictorLine:(CGFloat)X{
    self.segIndicatorLeading.constant = X;
}


// 设置tableView
//TODO:
-(void)configTableView:(SLBaseTableView*)tableView{

    tableView.cellForRow = ^(UITableView * tableView,NSIndexPath * indexPath){

        SLFillOutInfomationCell * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLFillOutInfomationCell" owner:self options:nil]lastObject];
        
        
        return cell;
    };
    
    
    
}












#pragma -mark -----scrollViewDelegat-----
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGPoint  point =  scrollView.contentOffset;
    [self upDateLayoutOfIndictorLine:point.x/2];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  CGPoint  point =  scrollView.contentOffset;
    if (point.x == kScreenWidth) {
        self.accessoryInfoSelected = YES;
        self.basicInfoSelected = NO;
    }
    
    if (point.x == 0) {
        self.basicInfoSelected = YES;
        self.accessoryInfoSelected = NO;
    }

}



#pragma -mark -----actions-----

- (void)basicInfoTap:(id)sender {
    self.basicInfoSelected = YES;
    self.accessoryInfoSelected = NO;
}

- (void)accessoryInfoTap:(id)sender {
    self.basicInfoSelected = NO;
    self.accessoryInfoSelected = YES;
}


#pragma -mark -----lazyload-----

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.backgroundColor = [UIColor yellowColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
        [_scrollView addSubview:self.tableView];
        [_scrollView addSubview:self.accessoryView];
    }
    
    return _scrollView;
}


-(UIView *)accessoryView{
    if (!_accessoryView) {
        _accessoryView = [[[NSBundle mainBundle]loadNibNamed:@"SLAccessoryView" owner:self options:nil]lastObject];
//        _accessoryView.backgroundColor = [UIColor greenColor];
 
    }
    return _accessoryView;
}


-(SLBaseTableView *)tableView{
    if (!_tableView) {
        _tableView = [[SLBaseTableView alloc]init];
        [self configTableView:_tableView];
    }
    return _tableView;
}

-(UIView *)segmentControllerView{
    if (!_segmentControllerView) {
        _segmentControllerView = [[[NSBundle mainBundle]loadNibNamed:KSegmentControllerView owner:self options:nil]lastObject];
        
        _basicInfoLabel.textColor = [UIColor colorWithHexString:KLabelColorSelected];
        _accessoryInfoLabel.textColor = [UIColor colorWithHexString:KLabelColorNormal];
        _segIndicatorLine.backgroundColor = UIColorHex(0076dd);
        _gapLine.backgroundColor = UIColorHex(bdc8d9);
        UITapGestureRecognizer * tap1= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(basicInfoTap:)];
        [_basicInfoLabel addGestureRecognizer:tap1];
        _basicInfoLabel.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tap2= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(accessoryInfoTap:)];
        [_accessoryInfoLabel addGestureRecognizer:tap2];
        _accessoryInfoLabel.userInteractionEnabled = YES;
        _accessoryInfoSelected = NO;
        _basicInfoSelected = YES;
        [self.view addSubview:_segmentControllerView];
    }
    return _segmentControllerView;
}


-(void)setBasicInfoSelected:(BOOL)basicInfoSelected{
    if (_basicInfoSelected == basicInfoSelected) {
        return;
    }
    _basicInfoSelected = basicInfoSelected;
    NSString * colorString = basicInfoSelected?KLabelColorSelected:KLabelColorNormal;
    self.basicInfoLabel.textColor = [UIColor colorWithHexString:colorString];
 
    if (basicInfoSelected) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }

}


-(void)setAccessoryInfoSelected:(BOOL)accessoryInfoSelected{

    if (_accessoryInfoSelected == accessoryInfoSelected) {
        return;
    }
    
    _accessoryInfoSelected = accessoryInfoSelected;
    
    NSString * colorString = accessoryInfoSelected?KLabelColorSelected:KLabelColorNormal;
    
    self.accessoryInfoLabel.textColor = [UIColor colorWithHexString:colorString];

    if (accessoryInfoSelected) {
        [self.scrollView setContentOffset:CGPointMake(kScreenWidth, 0) animated:YES];
    }
}




@end
