//
//  SLOrderListViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/18.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderListViewController.h"
#import "SLSegmentController.h"
#import "iCarousel.h"
#import "SLBaseTableView.h"
#import "SLOrderListCell.h"
#import "SLVisitsInformationViewController.h"
#import "SLUnannouncedVisitsViewController.h"
#import "SLOrderListTableViewController.h"


// MARK: 布局
static CGFloat const KSegmentControllerHeight = 45;

@interface SLOrderListViewController ()<SLSegmentControllerDelegate,iCarouselDelegate,iCarouselDataSource>

@property(nonatomic,strong)SLSegmentController * segmentControllerView;
@property(nonatomic,strong)iCarousel * carousel;

@end

@implementation SLOrderListViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self _layoutSubViews];
    
    [self.segmentControllerView setBadgeValue:0 atIndex:0];
    [self.segmentControllerView setBadgeValue:10 atIndex:1];
    [self.segmentControllerView setBadgeValue:100 atIndex:2];
    [self.segmentControllerView setBadgeValue:0 atIndex:3];
    [self.segmentControllerView setBadgeValue:10 atIndex:4];
    [self.segmentControllerView setBadgeValue:100 atIndex:5];
    
    
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
    tableView.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableView.backgroundColor = UIColorHex(f4f4f4);
    tableView.tag = 100;
    tableView.frame = CGRectMake(0,0, view.width,view.height);
    tableView.layer.borderColor = UIColorHex(cccccc).CGColor;
    tableView.layer.borderWidth = 0.5;
    [view addSubview:tableView];
    
    //MARK:测试数据
    tableView.dataArr = @[@"1",@"1",@"1"];
    
    
    
//    tableView.headerRefreshAvailable = YES;
//    tableView.footerRefreshAvailable = YES;
    
    [self configTableView:tableView];
    
    return view;
}


//MARK:设置tableView
-(void)configTableView:(SLBaseTableView*)tableView{
    
    DefineWeakSelf;
    __block typeof(tableView)weakTableView = tableView;
    
    //设置tableViewCell
    tableView.cellForRow = ^(UITableView * tableView,NSIndexPath*indexPath){
        
        
        SLOrderListCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
        if (!cell) {
            cell = [[SLOrderListCell alloc]init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    };
    
    //设置tableView的高度
    tableView.cellHeightBlock = ^{return 75.0;};
    
    
    //设置tableView的点击
    tableView.cellDidSelected = ^(NSIndexPath *indexPath){
        [weakSelf configCellSelected:indexPath];
    };
    
}

-(void)configCellSelected:(NSIndexPath*)indexPath{
    NSInteger currentItemIndex = self.carousel.currentItemIndex;
    switch (currentItemIndex) {
        case 0:
        {
            //明访
//            SLVisitsInformationViewController * visitsInformation = [[SLVisitsInformationViewController alloc]init];
//            [self.navigationController pushViewController:visitsInformation animated:YES];
            
            //暗访
            SLUnannouncedVisitsViewController * unannouncedVisits = [[SLUnannouncedVisitsViewController alloc]init];
            [self.navigationController pushViewController:unannouncedVisits animated:nil];
            
        }
            break;
            
        case 1:
        {
             DLog(@"当前的列表为 = %ld",(long)currentItemIndex);
        }
            break;
            
        case 2:
        {
             DLog(@"当前的列表为 = %ld",(long)currentItemIndex);
        }
            break;
            
        default:
        {
            DLog(@"当前的列表为 = %ld",(long)currentItemIndex);
        }
            break;
    }
}




-(void)tableView:(SLBaseTableView*)tableView configRefresh:(NSInteger)index{
    
    __block typeof(tableView) weakTableView = tableView;
    
    DefineWeakSelf;
    
    //加载数据
    tableView.headerRefresh = ^{
        
//        [weakSelf tableView:weakTableView refreshDataWithIndex:index];
    };
    
    
    tableView.footerRefresh = ^{
//        [weakSelf tableView:weakTableView loadDataWithIndex:index];
    };
}



//MARK:----------------------各种代理--------------

-(UIView*)CREATETABLEVIEW{
    UIView * v = [[UIView alloc]initWithFrame:self.carousel.bounds];
    SLOrderListTableViewController * tableViewController = [[SLOrderListTableViewController alloc]init];
    [self addChildViewController:tableViewController];
    
    [v addSubview:tableViewController.view];
//    tableViewController
    return v;

}


//MARK: carousel的delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 4;
}






- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    
    if (view == nil) {
//        view = [self createTabelView];
        view = [self CREATETABLEVIEW];
        
        
    }

//    SLBaseTableView * tv = [view viewWithTag:100];
//    [self tableView:tv configRefresh:index];
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
        _segmentControllerView = [[SLSegmentController alloc]initWithTitles:@[@"待巡查",@"巡查中",@"补充资料",@"已完成"]];
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

@end
