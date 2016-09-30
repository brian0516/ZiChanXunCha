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
#import "CALayer+SLLayer.h"
#import "testModel.h"
#import "SLNumberOfChooseView.h"
#import "SLDetailOfOrderViewController.h"

// MARK: 布局
static CGFloat const KSegmentControllerHeight = 45;



@interface SLOrderViewController ()<SLSegmentControllerDelegate,iCarouselDelegate,iCarouselDataSource>

@property(nonatomic,strong)SLSegmentController * segmentControllerView;

@property(nonatomic,strong)iCarousel * carousel;

@property (nonatomic,strong)SLNumberOfChooseView * numberOfChooseView;

@property (nonatomic,strong)SLNumberOfChooseView * numberOfChooseView2;


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
    
    
    [self.numberOfChooseView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(50));
        make.left.equalTo(weakSelf.view);
        make.width.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view);
    }];
    
    [self.numberOfChooseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(50));
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
    tableView.tag = 100;
    tableView.frame = CGRectMake(10,10, view.width-20,view.height-20);
    tableView.layer.borderColor = UIColorHex(cccccc).CGColor;
    tableView.layer.borderWidth = 0.5;
    [view addSubview:tableView];
    tableView.headerRefreshAvailable = YES;
    tableView.footerRefreshAvailable = YES;
    
    [self configTableView:tableView];
    
    return view;
}


//MARK:设置tableView
-(void)configTableView:(SLBaseTableView*)tableView{

    DefineWeakSelf;
    __block typeof(tableView)weakTableView = tableView;
    
    
    //设置tableViewCell
    tableView.cellForRow = ^(UITableView * tableView,NSIndexPath*indexPath){
        
        
        SLOrderCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
        if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SLOrderCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        testModel * m = weakTableView.dataArr[indexPath.row];
        cell.titleLabel.text = m.name;
        cell.subTitleLabel.text = m.phoneNumber;
        cell.btn.selected = m.selected;
        cell.btnClickBlock = ^(BOOL seleted){
            m.selected = seleted;
            
            SLNumberOfChooseView * numberOfChooseView = nil;
            
            if (weakSelf.carousel.currentItemIndex == 0) {
                numberOfChooseView = weakSelf.numberOfChooseView;
            }
            else{
                numberOfChooseView = weakSelf.numberOfChooseView2;
            }
            
            NSInteger currentNumber = [numberOfChooseView.numberLabel.text integerValue];
            
            if (m.selected) {
                currentNumber++;
            }
            else{
                currentNumber--;
            }
            
            if (currentNumber != weakTableView.dataArr.count) {
                numberOfChooseView.selectAllButton.selected = NO;
            }
            
            if (currentNumber == weakTableView.dataArr.count) {
                numberOfChooseView.selectAllButton.selected = YES;
            }
            
            
            numberOfChooseView.numberLabel.text = [NSString stringWithFormat:@"%ld",(long)currentNumber];
        };
        return cell;
    };
    
    //设置tableView的高度
    tableView.cellHeightBlock = ^{return 56.0;};
    
    
    //设置tableView的点击
    tableView.cellDidSelected = ^(NSIndexPath *indexPath){
        SLDetailOfOrderViewController * detail = [[SLDetailOfOrderViewController alloc]init];
        [weakSelf.navigationController pushViewController:detail animated:YES];
    };
    
    
    
}


-(void)tableView:(SLBaseTableView*)tableView configRefresh:(NSInteger)index{

    __block typeof(tableView) weakTableView = tableView;
    
    DefineWeakSelf;
    
    //加载数据
    tableView.headerRefresh = ^{
        
        [weakSelf tableView:weakTableView refreshDataWithIndex:index];
    };

    
    tableView.footerRefresh = ^{
    [weakSelf tableView:weakTableView loadDataWithIndex:index];
    };
}





-(void)tableView:(SLBaseTableView*)tableView refreshDataWithIndex:(NSInteger)index{

    sleep(3);
    
    if (index == 0) {
        
        
        self.numberOfChooseView.selectAllButton.selected = NO;
        
        for (NSInteger i = 0; i<10; i++) {
         
            testModel * m = [[testModel alloc]initWithNotificationName:@"index0"];
            m.name = @"用户名";
            m.phoneNumber = @"1234567890";            [tableView.dataArr addObject:m];
        }
        
        [tableView reloadData];
        [tableView.tableView.mj_header endRefreshing];
        
    }
    else{
        for (NSInteger i = 0; i<10; i++) {
            
            testModel * m = [[testModel alloc]initWithNotificationName:@"index1"];
            m.name = @"用户名";
            m.phoneNumber = @"1234567890";
            [tableView.dataArr addObject:m];
        }
        
        [tableView reloadData];
        [tableView.tableView.mj_header endRefreshing];
    }
}


-(void)tableView:(SLBaseTableView*)tableView loadDataWithIndex:(NSInteger)index{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        sleep(3);
        
        if (index == 0) {
            for (NSInteger i = 0; i<10; i++) {
                
               
                testModel * m = [[testModel alloc]initWithNotificationName:@"index0"];
                m.name = @"用户名";
                m.phoneNumber = @"1234567890";
                [tableView.dataArr addObject:m];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [tableView reloadData];
                [tableView.tableView.mj_footer endRefreshing];
            });
            
        }
        else{
            for (NSInteger i = 0; i<10; i++) {
                
                testModel * m = [[testModel alloc]initWithNotificationName:@"index1"];
                m.name = @"用户名";
                m.phoneNumber = @"1234567890";
                [tableView.dataArr addObject:m];
    
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [tableView reloadData];
                [tableView.tableView.mj_footer endRefreshing];
  
            });
        }

    });
    
  }


//MARK: 设置底部视图
-(void)configNumberOfView:(SLNumberOfChooseView*)view{
   
    view.buttonClickBlock = ^(UIButton * btn,NSInteger tag){
        
        //全选
        if (tag == 100) {
            [self selectedAll:btn];
        }
        
        
        //拒单
        if (tag == 101) {
            
        }
        
        
        //接单
        if (tag == 102) {
            
        }
        
    };
    
    
    
}


-(void)configNumberOfView2:(SLNumberOfChooseView*)view{
    view.buttonClickBlock = ^(UIButton * btn,NSInteger tag){
        //全选
        if (tag == 100) {
           [self selectedAll:btn];
        }
        //接单
        if (tag == 102) {
            
        }
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
    
    SLBaseTableView * tv = [view viewWithTag:100];
    
    [self tableView:tv configRefresh:index];
    
    return view;
    
}

-(void)carouselDidScroll:(iCarousel *)carousel{
    
    CGFloat  offset =  carousel.scrollOffset;
    CGFloat offset2 = carousel.width*offset;
    CGFloat indicatourX = offset2/self.segmentControllerView.itemCount;

    [self.segmentControllerView upDateIndicatorConstrait:indicatourX animate:NO];
    
    
    self.numberOfChooseView.alpha = 1-offset;
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    [self.segmentControllerView setSelectedIndex:carousel.currentItemIndex];
}



//MARK: segmentController代理
-(void)segment:(SLSegmentController *)seg didSelectedAtIndex:(NSInteger)index{
    [self.carousel scrollToItemAtIndex:index animated:YES];
}

//MARK:---------------actions--------------

- (void)selectedAll:(UIButton*)button {
    UIButton * btn = button;
    NSString * selectName = nil;
    NSString * deSelectName = nil;
    
    NSInteger index = -1;
    
    UIView * view =  self.carousel.currentItemView;
    SLBaseTableView * tableView = [view viewWithTag:100];
    
    if ([button isDescendantOfView:self.numberOfChooseView]) {
        index = 0;
        selectName = @"index0SelectedAll";
        deSelectName =@"index0DeselectedAll" ;
    }
    if ([button isDescendantOfView:self.numberOfChooseView2]) {
        index = 1;
        selectName = @"index1SelectedAll";
        deSelectName =@"index1DeselectedAll" ;
    }
    
    if (!btn.selected) {
        [[NSNotificationCenter defaultCenter]postNotificationName:selectName object:nil];
        if (index == 0) {
            self.numberOfChooseView.numberLabel.text = [NSString stringWithFormat:@"%ld",tableView.dataArr.count];
        }
        if (index == 1) {
            self.numberOfChooseView2.numberLabel.text = [NSString stringWithFormat:@"%ld",tableView.dataArr.count];
        }
        
    }
    
    else{
        [[NSNotificationCenter defaultCenter]postNotificationName:deSelectName object:nil];
        
        if (index == 0) {
            self.numberOfChooseView.numberLabel.text = @"0";
        }
        
        if (index == 1) {
            self.numberOfChooseView2.numberLabel.text = @"0";
        }
    }
    [tableView reloadData];

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


-(SLNumberOfChooseView *)numberOfChooseView{
    if (!_numberOfChooseView) {
        _numberOfChooseView = [[SLNumberOfChooseView alloc]init];
        [self configNumberOfView:_numberOfChooseView];
        _numberOfChooseView.rejectBtn.hidden = YES;
        [self.view addSubview:_numberOfChooseView];
    }
    
    return _numberOfChooseView;
}


-(SLNumberOfChooseView *)numberOfChooseView2{
    if (!_numberOfChooseView2) {
        _numberOfChooseView2 = [[SLNumberOfChooseView alloc]init];
        [self configNumberOfView2:_numberOfChooseView2];
        [self.view addSubview:_numberOfChooseView2];
    }
    
    return _numberOfChooseView2;
}



@end
