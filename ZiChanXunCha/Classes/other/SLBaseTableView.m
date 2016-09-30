//
//  SLBaseTableView.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/28.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLBaseTableView.h"

@interface SLBaseTableView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>;

@end

@implementation SLBaseTableView


-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(void)setFooterView:(UIView *)footerView{
    _footerView = footerView;
    self.tableView.tableFooterView = footerView;
}


-(void)reloadData{
    [self.tableView reloadData];
}

-(void)layoutSubviews{
    [super layoutSubviews];

    DefineWeakSelf;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf);
        make.right.mas_equalTo(weakSelf);
        make.height.mas_equalTo(weakSelf);
        make.top.mas_equalTo(0);
    }];
}


#pragma -mark --------tableViewDelegate-----

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellForRow) {
        return self.cellForRow(tableView,indexPath);
    }
    else{
        static NSString *ID = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.textLabel.text = @"123";
        return cell;
    }
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellDidSelected) {
        self.cellDidSelected(indexPath);
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.cellHeightBlock) {
        return self.cellHeightBlock();
    }
    else{
        return 50;
    }
}


//- (NSMutableArray *)data
//{
//    if (!_data) {
//        self.data = [NSMutableArray array];
//        for (int i = 0; i<5; i++) {
//            [self.data addObject:MJRandomData];
//        }
//    }
//    return _data;
//}


#pragma -mark   ---------lazyLoad---------

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
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



@end
