//
//  SLUnannouncedVisitsViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/10.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLVisitsInformationViewController.h"
#import "SLTitleCell.h"
#import "SLOrderList_VisitsInfoCell.h"
#import "SLMachinaOwnerCell.h"
#import "SLOrderList_LoactionCell.h"
#import "SLOrderListUserInfoViewController.h"
#import "SLOrderListMachinaInfoViewController.h"
#import "SLIncomeAndExpenseInfoViewController.h"
#import "SLOrderList_OhterInfoViewController.h"
#import "SLVideoAndAudioAttachmentViewController.h"


@interface SLVisitsInformationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * tableView;
//MARK:临时
@property (nonatomic,strong)NSArray * titles;
@property (nonatomic,strong)NSArray * imageNames;



@end

@implementation SLVisitsInformationViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单列表";
    
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    else if (section == 1){
        return 6;
    }
    else{
        return 2;
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
    
    else if(indexPath.section == 1){
        if (indexPath.row == 0 ) {
            cell = [[SLTitleCell alloc]init];
        }
        else{
            cell = [[SLOrderList_VisitsInfoCell alloc]init];
            SLOrderList_VisitsInfoCell * c = (SLOrderList_VisitsInfoCell*)cell;
            c.title.text = self.titles[indexPath.row-1];
            c.IV.image = [UIImage imageNamed:self.imageNames[indexPath.row-1]];
        }
    }
    
    else{
        if (indexPath.row == 0) {
              cell = [[SLTitleCell alloc]init];
        }
        else{
            cell = [[SLOrderList_LoactionCell alloc]init];
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
    
    else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            return 40;
        }
        return 50;
    }
    
    else{
        if (indexPath.row == 0) {
            return 40;
        }
        return 160;
    }
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 1:
            {
            //基本信息
                SLOrderListUserInfoViewController * userInfo = [[SLOrderListUserInfoViewController alloc]init];
                [self.navigationController pushViewController:userInfo animated:YES];
            }
                break;
                
            case 2:
            {
                //设备信息
                SLOrderListMachinaInfoViewController * machinaInfo = [[SLOrderListMachinaInfoViewController alloc]init];
                [self.navigationController pushViewController:machinaInfo animated:nil];
                
                
            }
                break;
                
            case 3:
            {
                //支出情况
                SLIncomeAndExpenseInfoViewController * incomeAndExpense = [[SLIncomeAndExpenseInfoViewController alloc]init];
                [self.navigationController pushViewController:incomeAndExpense animated:nil];
            }
                break;
                
            case 4:
            {
                //其它信息
                SLOrderList_OhterInfoViewController * otherInfo = [[SLOrderList_OhterInfoViewController alloc]init];
                [self.navigationController pushViewController:otherInfo animated:nil];
                
            }
                break;
                
            case 5:
            {
                //影像附件
                SLVideoAndAudioAttachmentViewController * videoAndAudioAttachment = [[SLVideoAndAudioAttachmentViewController alloc]init];
                [self.navigationController pushViewController:videoAndAudioAttachment animated:nil];
            }
                break;
                
            default:
                break;
        }
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
        [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [commitBtn setTitleColor:UIColorHex(ffffff) forState:UIControlStateNormal];
        commitBtn.center = v.center;
        commitBtn.layer.cornerRadius = 22.5;
        commitBtn.layer.masksToBounds = YES;
        [v addSubview:commitBtn];
        _tableView.tableFooterView = v;
        
    }
    return _tableView;
}


-(NSArray *)titles{
    if (!_titles) {
        _titles  =@[@"基本信息",@"设备信息",@"支出情况",@"其它信息",@"影像附件"];
    }
    return _titles;
}

-(NSArray *)imageNames{
    if (!_imageNames) {
        _imageNames = @[@"xc_custom",@"xc_equipment",@"xc_money",@"xc_other",@"xc_video"];
    }
    return _imageNames;
}


@end
