//
//  SLUnannouncedHeaderView.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLUnannouncedHeaderView.h"

@implementation SLUnannouncedHeaderView


-(instancetype)init{
    
    return [SLUnannouncedHeaderView loadFromNib];
}

+(SLUnannouncedHeaderView*)loadFromNib{
    
    SLUnannouncedHeaderView  * view = [[[NSBundle mainBundle]loadNibNamed:@"SLUnannouncedHeaderView" owner:self options:nil]lastObject];

    
    return view;
    
}



@end
