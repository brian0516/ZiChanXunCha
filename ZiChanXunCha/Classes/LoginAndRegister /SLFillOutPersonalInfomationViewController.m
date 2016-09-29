//
//  SLFillOutPersonalInfomationViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/28.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLFillOutPersonalInfomationViewController.h"
#import "SLBaseTableView.h"
#import "SLFillOutInfomationCell.h"
#import "SLSegmentController.h"
#import "SLFillOutInfomationCell2.h"
#import "SLFillOutInfomationCell3.h"

// MARK:静态字符串

// MARK: 布局
static CGFloat const KSegmentControllerHeight = 45;




@interface SLFillOutPersonalInfomationViewController ()<UIScrollViewDelegate,SLSegmentControllerDelegate>

@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)SLBaseTableView * tableView;
@property (nonatomic,strong)UIView * accessoryView;
@property (nonatomic,strong)SLSegmentController * segmentControllerView;
@property (nonatomic,assign)BOOL  basicInfoSelected;
@property (nonatomic,assign)BOOL accessoryInfoSelected;



@property (weak, nonatomic) IBOutlet UILabel *basicInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *accessoryInfoLabel;
@property (weak, nonatomic) IBOutlet UIView *segIndicatorLine;
@property (weak, nonatomic) IBOutlet UIView *gapLine;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *segIndicatorLeading;


@property (nonatomic,strong)NSArray * cellTitleArray;
@property (nonatomic,strong)NSArray * placeholdersArray;

@end

@implementation SLFillOutPersonalInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"巡查人员信息";
    [self _layoutSubViews];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*2,0);
}




#pragma -mark -------privateMethod----------
-(void)_layoutSubViews{

    DefineWeakSelf;
    
    [self.segmentControllerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(64);
        make.leftMargin.offset(0);
        make.width.offset(kScreenWidth);
        make.height.equalTo(@(KSegmentControllerHeight));
    }];
    
    
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.segmentControllerView.mas_bottom).offset(1);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        
    }];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView);
        make.left.equalTo(weakSelf.scrollView);
        make.width.equalTo(weakSelf.scrollView);
        make.height.equalTo(weakSelf.scrollView.mas_height);
    }];
    
    
    
    [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView);
        make.left.equalTo(weakSelf.scrollView).offset(kScreenWidth);
        make.width.equalTo(weakSelf.scrollView);
        make.height.equalTo(weakSelf.scrollView.mas_height);
    }];
    
}

//更新indicatorLine的约束
-(void)upDateLayoutOfIndictorLine:(CGFloat)X{
    self.segIndicatorLeading.constant = X;
}


// 设置tableView
//TODO:
-(void)configTableView:(SLBaseTableView*)tableView{

    DefineWeakSelf;
    
    
    //设置tableView内容
    tableView.cellForRow = ^(UITableView * tableView,NSIndexPath * indexPath){
        
        UITableViewCell * cell = nil;
        
        if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 7) {
            
                    cell = [[[NSBundle mainBundle]loadNibNamed:@"SLFillOutInfomationCell" owner:self options:nil]lastObject];
            
            // 设置title
            SLFillOutInfomationCell * c1 = (SLFillOutInfomationCell*)cell;
            c1.titleLabel.text = weakSelf.cellTitleArray[indexPath.row];
            c1.textField.placeholder = weakSelf.placeholdersArray[indexPath.row];
            c1.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
       else if (indexPath.row == 1) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"SLFillOutInfomationCell2" owner:self options:nil]lastObject];
           SLFillOutInfomationCell2 * c2 = (SLFillOutInfomationCell2*)cell;
           c2.titleLabel.text = weakSelf.cellTitleArray[indexPath.row];
           c2.selectionStyle = UITableViewCellSelectionStyleNone;
           
       }
        
       else if (indexPath.row == 3 || indexPath.row == 6){
       
           cell = [[[NSBundle mainBundle]loadNibNamed:@"SLFillOutInfomationCell3" owner:self options:nil]lastObject];
           SLFillOutInfomationCell3 * c3 = (SLFillOutInfomationCell3*)cell;
           c3.titleLabel.text = weakSelf.cellTitleArray[indexPath.row];
           c3.placeholderLabel.text = self.placeholdersArray[indexPath.row];
           c3.selectionStyle = UITableViewCellSelectionStyleNone;
            }
       else{
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
       }
        
         return cell;
    };
    
    
    //设置tableView点击事件
    
    
    
    
    
}


//设置tableView的footView
-(void)configFooterView:(SLBaseTableView*)tableView{
   
    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,0,100)];
    _tableView.footerView = footView;
    UIButton * btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 50, 230, 44);
    [btn setBackgroundColor:[UIColor colorWithHexString:@"0076dd"] ForState:UIControlStateNormal];
    btn.layer.cornerRadius = 25;
    btn.layer.masksToBounds = YES;
    [footView addSubview:btn];
    btn.centerX = self.view.centerX;
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    
}


#pragma -mark -----scrollViewDelegat-----
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint  point =  scrollView.contentOffset;
    [self.segmentControllerView upDateIndicatorConstrait:point.x/self.segmentControllerView.itemCount animate:NO];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint  point =  scrollView.contentOffset;
    NSInteger index = point.x/scrollView.width;
    [self.segmentControllerView setSelectedIndex:index]; 
}





#pragma -mark ----segmentControllerDelegate-----
-(void)segment:(SLSegmentController *)seg didSelectedAtIndex:(NSInteger)index{
    
    [self.view endEditing:YES];
    [self.scrollView setContentOffset:CGPointMake(kScreenWidth*index, 0) animated:YES];
    
}




#pragma -mark -----actions-----

- (void)basicInfoTap:(id)sender {
    self.basicInfoSelected = YES;
    self.accessoryInfoSelected = NO;
}

- (void)accessoryInfoTap:(id)sender {
    self.basicInfoSelected = NO;
    self.accessoryInfoSelected = YES;
}

//保存基本信息
-(void)save:(id)sender{


}



#pragma -mark -----lazyload-----

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.backgroundColor = [UIColor yellowColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
        [_scrollView addSubview:self.tableView];
        [_scrollView addSubview:self.accessoryView];
    }
    
    return _scrollView;
}


-(UIView *)accessoryView{
    if (!_accessoryView) {
        _accessoryView = [[[NSBundle mainBundle]loadNibNamed:@"SLAccessoryView" owner:self options:nil]lastObject];
//        _accessoryView.backgroundColor = [UIColor greenColor];
 
    }
    return _accessoryView;
}


-(SLBaseTableView *)tableView{
    if (!_tableView) {
        _tableView = [[SLBaseTableView alloc]init];
        [self configTableView:_tableView];
        [self configFooterView:_tableView];
    }
    return _tableView;
}


-(SLSegmentController *)segmentControllerView{
    if (!_segmentControllerView) {
        _segmentControllerView = [[SLSegmentController alloc]initWithTitles:@[@"基本信息",@"附件信息"]];
        _segmentControllerView.delegate = self;
        [self.view addSubview:_segmentControllerView];
    }
    return _segmentControllerView;
}

-(NSArray *)cellTitleArray{
    if (!_cellTitleArray) {
        _cellTitleArray = @[@"真实姓名",@"性       别",@"身份证号",@"家庭住址",@"联系电话",@"工作单位",@"单位地址",@"单位电话"];
    }
    return _cellTitleArray;
}


-(NSArray *)placeholdersArray{
    if (!_placeholdersArray) {
        _placeholdersArray = @[@"您的真实姓名(必填)",@"",@"请输入(必填)",@"填写现在住址详细信息(必填)",@"请输入(必填)",@"请输入(必填)",@"请填写现在办公地址详细信息(必填)",@"请输入(必填)"];
    }
    return _placeholdersArray;
}


@end
