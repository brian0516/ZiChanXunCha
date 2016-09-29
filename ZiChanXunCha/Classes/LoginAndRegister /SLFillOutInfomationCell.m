//
//  SLFillOutInfomationCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/28.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLFillOutInfomationCell.h"

@interface SLFillOutInfomationCell ()


@end

@implementation SLFillOutInfomationCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.titleLabel.textColor = UIColorHex(757a8a);
    self.textField.textAlignment = NSTextAlignmentRight;

}

@end
