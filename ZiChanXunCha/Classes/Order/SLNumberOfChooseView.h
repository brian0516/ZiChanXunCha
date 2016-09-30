//
//  SLNumberOfChooseView.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/30.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SLNumberOfChooseView : UIView

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UIButton *rejectBtn;

@property (weak, nonatomic) IBOutlet UIButton *selectAllButton;

@property(nonatomic,copy) void(^buttonClickBlock)(UIButton*btn,NSInteger tag);

@end
