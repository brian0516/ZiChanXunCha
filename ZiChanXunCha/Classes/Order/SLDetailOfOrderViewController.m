//
//  SLDetailOfOrderViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/30.
//  Copyright © 2016年 shuanglong. All rights reserved.
//



#import "SLDetailOfOrderViewController.h"
#import "SLBaseTableView.h"
#import "SLMachinaOwnerCell.h"
#import "SLMachinaInfoCell.h"
#import "SLTitleCell.h"
#import "SLAcceptAndRejectView.h"

@interface SLDetailOfOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)SLAcceptAndRejectView * acceptAndRejectView;

@end

@implementation SLDetailOfOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    DefineWeakSelf;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view).offset(-50);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
    }];
    
    [self.acceptAndRejectView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@(50));
        make.bottom.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    else{
        return 5;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = nil;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell = [[SLTitleCell alloc]init];
        }
        else{
        cell = [[SLMachinaOwnerCell alloc]init];
        }
    }
    
    else{
        if (indexPath.row == 0 ) {
            cell = [[SLTitleCell alloc]init];
        }
        else{
        cell = [[SLMachinaInfoCell alloc]init];
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 25;
        }
        return 150;
    }

    else{
        if (indexPath.row == 0) {
            return 40;
        }
        return 130;
    }
}



-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColorHex(f4f4f4);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


-(SLAcceptAndRejectView *)acceptAndRejectView{
    if (!_acceptAndRejectView) {
        _acceptAndRejectView = [[SLAcceptAndRejectView alloc]init
                                ];
        [self.view addSubview:_acceptAndRejectView];
    }
    
    return _acceptAndRejectView;
}

@end
