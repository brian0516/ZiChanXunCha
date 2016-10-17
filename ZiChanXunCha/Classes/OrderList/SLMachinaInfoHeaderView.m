//
//  SLMachinaInfoHeaderView.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLMachinaInfoHeaderView.h"

@implementation SLMachinaInfoHeaderView


-(void)awakeFromNib{
    [super awakeFromNib];
    DLog(@"lkajdflkajsdfkl");
}

-(instancetype)init{

    return [SLMachinaInfoHeaderView loadFromNib];
}

+(SLMachinaInfoHeaderView*)loadFromNib{
    
    SLMachinaInfoHeaderView  * view = [[[NSBundle mainBundle]loadNibNamed:@"SLMachinaInfoHeaderView" owner:self options:nil]lastObject];
    
    
    return view;
    
}


@end
