//
//  SLOrderViewController.m
//  ZiChanXunCha
//  待接单列表
//  Created by shuanglong on 16/9/18.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderViewController.h"
#import "ViewController.h"
#import "SLSegmentController.h"
#import "iCarousel.h"
#import "SLBaseTableView.h"
#import "SLOrderCell.h"

// MARK: 布局
static CGFloat const KSegmentControllerHeight = 45;



@interface SLOrderViewController ()<SLSegmentControllerDelegate,iCarouselDelegate,iCarouselDataSource>

@property(nonatomic,strong)SLSegmentController * segmentControllerView;

@property(nonatomic,strong)iCarousel * carousel;

@property (nonatomic,strong)NSMutableArray * data;


@end

@implementation SLOrderViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self _layoutSubViews];
}

//MARK: ---------------私有方法------------------
//MARK:布局子视图
-(void)_layoutSubViews{
    DefineWeakSelf;
    
    [self.segmentControllerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(0);
        make.left.offset(0);
        make.width.offset(kScreenWidth);
        make.height.equalTo(@(KSegmentControllerHeight));
    }];
    
    [self.carousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.segmentControllerView.mas_bottom);
        make.left.equalTo(weakSelf.view);
        make.width.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view);
    }];
    
}

//MARK:为carousel创建tableView
-(UIView*)createTabelView{
    UIView * view = [UIView new];
    view.frame = self.carousel.bounds;
    SLBaseTableView * tableView = [[SLBaseTableView alloc]init];
    tableView.frame = CGRectMake(10,10, view.width-20,view.height-20);
    tableView.layer.borderColor = UIColorHex(cccccc).CGColor;
    tableView.layer.borderWidth = 0.5;
    [view addSubview:tableView];
    [self configTableView:tableView];
    
    return view;
}


//MARK:设置tableView
-(void)configTableView:(SLBaseTableView*)tableView{

    DefineWeakSelf;
    
    //设置tableViewCell
    tableView.cellForRow = ^(UITableView * tableView,NSIndexPath*indexPath){
        
        
        SLOrderCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
        if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SLOrderCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    };
    
    
    tableView.cellHeightBlock = ^{return 56.0;};
    
    tableView.numberOfRowBlock = ^{return (NSInteger)weakSelf.data.count;};
    
    tableView.cellDidSelected = ^(NSIndexPath *indexPath){
    
    
    };
    
}




//MARK:----------------------各种代理--------------
//MARK: carousel的delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 2;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    
    if (view == nil) {
        view = [self createTabelView];
    }
    return view;
    
}

-(void)carouselDidScroll:(iCarousel *)carousel{
    CGFloat  offset =  carousel.scrollOffset;
    CGFloat offset2 = carousel.width*offset;
    CGFloat indicatourX = offset2/self.segmentControllerView.itemCount;

    [self.segmentControllerView upDateIndicatorConstrait:indicatourX animate:NO];
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    [self.segmentControllerView setSelectedIndex:carousel.currentItemIndex];
}



//MARK: segmentController代理
-(void)segment:(SLSegmentController *)seg didSelectedAtIndex:(NSInteger)index{
    [self.carousel scrollToItemAtIndex:index animated:YES];
}



//MARK:------------------setter和getter---------------
-(SLSegmentController *)segmentControllerView{
    if (!_segmentControllerView) {
        _segmentControllerView = [[SLSegmentController alloc]initWithTitles:@[@"明访",@"暗访"]];
        _segmentControllerView.delegate = self;
        [self.view addSubview:_segmentControllerView];
    }
    return _segmentControllerView;
}

-(iCarousel *)carousel{
    if (!_carousel) {
        _carousel = [[iCarousel alloc]init];
        _carousel.backgroundColor = UIColorHex(F4F4F4);
        _carousel.delegate = self;
        _carousel.dataSource = self;
        _carousel.decelerationRate = 1.0;
        _carousel.scrollSpeed = 1.0;
        _carousel.type = iCarouselTypeLinear;
        _carousel.pagingEnabled = YES;
        _carousel.clipsToBounds = YES;
        _carousel.bounceDistance = 0.2;
        [self.view addSubview:_carousel];
    }
    return _carousel;
}



-(NSMutableArray *)data{
    if (!_data) {
        _data = [NSMutableArray array];
        [_data addObjectsFromArray:@[@"1",@"2",@"3"]];
    }
    return _data;
}

@end
