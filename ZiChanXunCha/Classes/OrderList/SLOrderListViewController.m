//
//  SLOrderListViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/18.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderListViewController.h"
/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

static const CGFloat MJDuration = 2.0;

@interface SLOrderListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation SLOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-149);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    __weak __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}


-(void)loadNewData{

    DLog(@"123");
    
    for (int i = 0; i<5; i++) {
        [self.data addObject:MJRandomData];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [tableView reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [tableView.mj_header endRefreshing];
    });

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", indexPath.row % 2?@"push":@"modal", self.data[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
}

- (NSMutableArray *)data
{
    if (!_data) {
        self.data = [NSMutableArray array];
        for (int i = 0; i<5; i++) {
            [self.data addObject:MJRandomData];
        }
    }
    return _data;
}
@end
