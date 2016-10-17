//
//  SLOrderListTableViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/14.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderListTableViewController.h"
#import "SLOrderListCell.h"


@interface SLOrderListTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation SLOrderListTableViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorHex(f4f4f4);
    [self tableView];
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SLOrderListCell * cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[SLOrderListCell alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.frame = CGRectMake(10, 0, self.view.width-20, self.view.height-64-45-49);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 75.0f;
        _tableView.backgroundColor = UIColorHex(f4f4f4);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
