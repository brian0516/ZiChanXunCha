//
//  SLMineViewController.m
//  ZiChanXunCha
//  我的
//  Created by shuanglong on 16/9/18.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLMineViewController.h"
#import "SLTableViewController.h"

static const CGFloat MJDuration = 2.0;

@interface SLMineViewController ()

@property(nonatomic,strong) SLTableViewController * tableViewController;

@end

@implementation SLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DefineWeakSelf;
    
    SLTableViewController * tv = [[SLTableViewController alloc]init];
    [self addChildViewController:tv];
    [self.view addSubview:tv.view];
    self.tableViewController = tv;
    
    
    __block typeof(tv)weakTv = tv;
    
    
    
    //设置cell点击;
    tv.cellDidSelected = ^(NSIndexPath * indexPath){
    
        NSString * data = weakTv.data[indexPath.row];
        DLog(@"selectedData = %@",data);
    
    };
    
    
    //设置cell
    tv.cellForRow = ^(UITableView * tableView,NSIndexPath*indexPath){
            static NSString *ID = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
        
            cell.textLabel.text = [NSString stringWithFormat:@"SL%@ - %@", indexPath.row % 2?@"push":@"modal", weakSelf.tableViewController.data[indexPath.row]];
        
        return cell;
    };
    
    
    //设置头部刷新
    tv.headerRefreshAvailable = YES;
    tv.headerRefresh = ^{
        [weakSelf loadNewData];
    };
    
    
    tv.footerRefreshAvailable = YES;
    tv.footerRefresh = ^{
        
      [self.tableViewController.tableView.mj_footer endRefreshing];
       
    };
    
}


-(void)loadNewData{
    
    DLog(@"123");
    
    for (int i = 0; i<5; i++) {
        [self.tableViewController.data addObject:MJRandomData];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableViewController.tableView reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableViewController.tableView.mj_header endRefreshing];
    });
    
    
}



@end
