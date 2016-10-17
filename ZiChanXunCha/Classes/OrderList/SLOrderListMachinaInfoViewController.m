//
//  SLOrderListMachinaInfoViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/12.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderListMachinaInfoViewController.h"
#import "SLCell2.h"
#import "SLTModel.h"
#import "SLMachinaInfoHeaderView.h"


@interface SLOrderListMachinaInfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>;

@property (nonatomic,strong)UITableView * tableView;

@property (nonatomic,strong)NSMutableArray * arr;

@end


@implementation SLOrderListMachinaInfoViewController

-(NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray array];
        for (NSInteger i = 0; i<10; i++) {
            SLTModel* m = [[SLTModel alloc]init];
            m.state  =  NO;
            [_arr addObject:m];
        }
    }
    return _arr;
}


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
    return 5;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SLTModel * m = self.arr[section];
    
    return m.state?10:0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SLCell2 * cell = [[SLCell2 alloc]init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    

}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SLMachinaInfoHeaderView*view = [[SLMachinaInfoHeaderView alloc]init];
    view.tag = 100+section;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerViewClick:)];
    [view addGestureRecognizer:tap];
    view.userInteractionEnabled = YES;

    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView reloadRow:indexPath.row inSection:indexPath.section withRowAnimation:UITableViewRowAnimationAutomatic];
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 63;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

//MARK: ---------Action-------------------
-(void)headerViewClick:(UITapGestureRecognizer*)tap{
    
    SLMachinaInfoHeaderView * view = (SLMachinaInfoHeaderView*)tap.view;
    NSInteger section = view.tag-100;
    SLTModel * m = self.arr[section];
    m.state = !m.state;
    
    [self.tableView reloadSection:section withRowAnimation:UITableViewRowAnimationAutomatic];
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
        _tableView.estimatedRowHeight = 80;
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
