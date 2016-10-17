//
//  SLIncomeAndExpenseInfoViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLIncomeAndExpenseInfoViewController.h"
#include "SLCell3.h"


@interface SLIncomeAndExpenseInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>;

@property (nonatomic,strong)UITableView * tableView;

@end

@implementation SLIncomeAndExpenseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"家庭收入支出情况";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColorHex(f4f4f4);
    
    DefineWeakSelf;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view).offset(10);
        make.right.equalTo(weakSelf.view).offset(-10);
    }];
    
}


//MARK: -tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SLCell3 * cell = [[SLCell3 alloc]init];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

//MARK: ---------GetterAndSetter-------------------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColorHex(f4f4f4);
        _tableView.showsVerticalScrollIndicator = NO;
        //  支持自适应 cell
        _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
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
