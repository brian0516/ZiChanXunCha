//
//  SLFillOutInfomationCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/28.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLFillOutInfomationCell.h"

@interface SLFillOutInfomationCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation SLFillOutInfomationCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.titleLabel.textColor = UIColorHex(757a8a);
    
    DLog(@"======");
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
