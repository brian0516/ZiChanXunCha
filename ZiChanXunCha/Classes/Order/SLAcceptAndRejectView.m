//
//  SLAcceptAndRejectView.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/10.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLAcceptAndRejectView.h"

@implementation SLAcceptAndRejectView

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(instancetype)init{
    return [SLAcceptAndRejectView loadFromNib];
    
    
}

+(SLAcceptAndRejectView*)loadFromNib{
    SLAcceptAndRejectView  * view = [[[NSBundle mainBundle]loadNibNamed:@"SLAcceptAndRejectView" owner:self options:nil]lastObject];
    
    return view;
}



@end
