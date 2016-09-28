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

/**
 *  刷新的block
 */
//typedef void(^refreshBlock)();



/**
 *  tableViewCell
 */

typedef UITableViewCell*(^cellForRowBlock)(UITableView * tableView,NSIndexPath * indexPath);


@interface SLBaseTableView : UIView

@property (nonatomic,copy) cellDidSelectedBlock(cellDidSelected);

//@property (nonatomic,copy) refreshBlock(headerRefresh);
//
//@property (nonatomic,copy) refreshBlock(footerRefresh);

@property (nonatomic,copy) cellForRowBlock(cellForRow);


@end
