//
//  SLBaseTableView.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/28.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]
/**
 *  cell被点击的block
 *
 */
typedef void(^cellDidSelectedBlock)(NSIndexPath *indexPath);



typedef CGFloat(^floatBlock)();

typedef NSInteger(^NSIntegerBlock)();

/**
 *  刷新的block
 */
typedef void(^refreshBlock)();



/**
 *  tableViewCell
 */

typedef UITableViewCell*(^cellForRowBlock)(UITableView * tableView,NSIndexPath * indexPath);


@interface SLBaseTableView : UIView

@property (nonatomic,strong)UITableView * tableView;

@property (nonatomic,strong)NSMutableArray * dataArr;

@property (nonatomic)BOOL headerRefreshAvailable;

@property (nonatomic)BOOL footerRefreshAvailable;

@property (nonatomic,copy) cellDidSelectedBlock(cellDidSelected);

@property (nonatomic,copy) refreshBlock(headerRefresh);

@property (nonatomic,copy) refreshBlock(footerRefresh);

@property (nonatomic,copy) cellForRowBlock(cellForRow);

@property (nonatomic,strong) UIView * footerView;

@property (nonatomic,copy)floatBlock(cellHeightBlock);

@property (nonatomic,copy)NSIntegerBlock(numberOfRowBlock);


-(void)reloadData;

@end
