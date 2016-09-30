//
//  SLOrderCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/29.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderCell.h"

@implementation SLOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)buttonClicked:(id)sender {
    UIButton * btn = (UIButton*)sender;
    btn.selected = !btn.selected;
    
    if (self.btnClickBlock) {
        self.btnClickBlock(btn.selected);
    }
    
}

@end
