//
//  SLNumberOfChooseView.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/30.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLNumberOfChooseView.h"

@implementation SLNumberOfChooseView

-(instancetype)init{
    self = [super init];
    if (self) {
        self = [self loadFromNib];
    }
    return self;
}


-(SLNumberOfChooseView*)loadFromNib{
    SLNumberOfChooseView * view = [[[NSBundle mainBundle]loadNibNamed:@"numberOfChooseView" owner:self options:nil]lastObject];
    return view;
}

//全选tag = 100, 拒单tag = 101 接单tag= 102
- (IBAction)buttonClick:(id)sender {
    
    UIButton * button = (UIButton*)sender;
    
    if (self.buttonClickBlock) {
        self.buttonClickBlock(button,button.tag);
    }

    button.selected = !button.selected;
}



@end
