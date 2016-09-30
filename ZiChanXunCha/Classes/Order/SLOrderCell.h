//
//  SLOrderCell.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/29.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnClickBlock)(BOOL selected);

@interface SLOrderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property(nonatomic,copy)btnClickBlock(btnClickBlock);


@end
