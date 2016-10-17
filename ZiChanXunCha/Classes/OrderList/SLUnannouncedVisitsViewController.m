//
//  SLAnnouncedVisitsViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLUnannouncedVisitsViewController.h"
#import "SLUnannouncedHeaderView.h"
#import "SLUnannoncedCell1.h"
#import "SLUnannoncedCell2.h"
#import "SLUnannoncedCell3.h"
#import "SLUnannoncedCell4.h"


@interface SLUnannouncedVisitsViewController ()<UITableViewDelegate,UITableViewDataSource>;

@property (nonatomic,strong)UITableView * tableView;

@end

@implementation SLUnannouncedVisitsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7 ;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = nil;
   
    if (indexPath.row == 0 ) {
        cell = [[SLUnannoncedCell1 alloc]init];
    }
   else if (indexPath.row == 1 || indexPath.row == 2) {
        cell = [[SLUnannoncedCell2 alloc]init];
    }
   else if (indexPath.row == 3 || indexPath.row == 4) {
        cell = [[SLUnannoncedCell3 alloc]init];
    }
   else if (indexPath.row == 5 || indexPath.row == 6) {
        cell = [[SLUnannoncedCell4 alloc]init];
    }
   else{
    
   }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SLUnannouncedHeaderView * view = [[SLUnannouncedHeaderView alloc]init];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerViewClick:)];
    [view addGestureRecognizer:tap];
    view.userInteractionEnabled = YES;
    view.tag = 100+section;
    return view;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 63;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

//MARK: -------------Actions---------
-(void)headerViewClick:(id)sender{
    
}


//MARK: ---------GetterAndSetter-------------------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
