//
//  SLVideoAndAudioAttachmentViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLVideoAndAudioAttachmentViewController.h"
#import "SLCell4.h"


@interface SLVideoAndAudioAttachmentViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>;

@property (nonatomic,strong)UITableView * tableView;


@end

@implementation SLVideoAndAudioAttachmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"其它信息";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColorHex(f4f4f4);
    
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
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SLCell4 * cell = [[SLCell4 alloc]init];
    
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
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColorHex(f4f4f4);
        _tableView.showsVerticalScrollIndicator = NO;
        //  支持自适应 cell
        _tableView.estimatedRowHeight = 170;
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
