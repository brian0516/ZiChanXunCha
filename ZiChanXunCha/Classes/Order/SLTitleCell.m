//
//  SLTitleCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/10.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLTitleCell.h"

@implementation SLTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)init{
    return [SLTitleCell loadFromNib];
    
    
}

+(SLTitleCell*)loadFromNib{
    SLTitleCell  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLTitleCell" owner:self options:nil]lastObject];
    
    return cell;
}



@end
