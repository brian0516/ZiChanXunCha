//
//  SLUnannoncedCell2.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLUnannoncedCell2.h"

@implementation SLUnannoncedCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)init{
    return [SLUnannoncedCell2 loadFromNib];
    
    
}

+(SLUnannoncedCell2*)loadFromNib{
    SLUnannoncedCell2  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLUnannoncedCell2" owner:self options:nil]lastObject];
    
    return cell;
}

@end
