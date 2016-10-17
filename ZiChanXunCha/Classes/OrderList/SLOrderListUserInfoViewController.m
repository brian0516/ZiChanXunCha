//
//  SLOrderListUserInfoViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/12.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderListUserInfoViewController.h"
#import "SLCell.h"
#import "SLTitleCell.h"

@interface SLOrderListUserInfoViewController ()<UITableViewDelegate,UITableViewDataSource>;

@property (nonatomic,strong)UITableView * tableView;

@end

@implementation SLOrderListUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    DefineWeakSelf;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
    }];
    
    
    
}

//MARK: -tableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4 ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        SLTitleCell * cell = [[SLTitleCell alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        
        SLCell * cell = nil;
        cell = [[SLCell alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 44;
    }
    else{
        return 112;
    }
}



//MARK: ---------GetterAndSetter-------------------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColorHex(f4f4f4);
        [self.view addSubview:_tableView];
        
        UIView * v = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, 145)];
        UIButton * commitBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 230, 45)];
        [commitBtn setBackgroundColor:UIColorHex(0076dd) ForState:UIControlStateNormal];
        [commitBtn setTitle:@"保存" forState:UIControlStateNormal];
        [commitBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        commitBtn.center = v.center;
        commitBtn.layer.cornerRadius = 22.5;
        commitBtn.layer.masksToBounds = YES;
        [v addSubview:commitBtn];
        _tableView.tableFooterView = v;
        
    }
    return _tableView;
}

@end
