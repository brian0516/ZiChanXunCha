//
//  SLTableViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/18.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLTableViewController.h"

#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface SLTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    
}

//设置头部刷新
-(void)setHeaderRefreshAvailable:(BOOL)headerRefreshAvailable{
    DefineWeakSelf;
    _headerRefreshAvailable = headerRefreshAvailable;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        if (weakSelf.headerRefresh) {
            weakSelf.headerRefresh();
        }
        
    }];
    
}


//设置底部刷新
-(void)setFooterRefreshAvailable:(BOOL)footerRefreshAvailable{
    DefineWeakSelf;
    
    _footerRefreshAvailable = footerRefreshAvailable;
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (weakSelf.footerRefresh) {
            weakSelf.footerRefresh();
        }
    }];
    
}




-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-100);
        [self.view addSubview:_tableView];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    static NSString *ID = @"cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //    if (cell == nil) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    //    }
    //
    //    cell.textLabel.text = [NSString stringWithFormat:@"SL%@ - %@", indexPath.row % 2?@"push":@"modal", self.data[indexPath.row]];
    //
    //    return cell;
    
    if (self.cellForRow) {
        return self.cellForRow(tableView,indexPath);
    }
    else{
        static NSString *ID = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellDidSelected) {
        self.cellDidSelected(indexPath);
    }
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
