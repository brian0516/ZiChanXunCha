//
//  SLUnannoncedCell1.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLUnannoncedCell1.h"

@implementation SLUnannoncedCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)init{
    return [SLUnannoncedCell1 loadFromNib];
    
    
}

+(SLUnannoncedCell1*)loadFromNib{
    SLUnannoncedCell1  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLUnannoncedCell1" owner:self options:nil]lastObject];
    
    return cell;
}


@end
