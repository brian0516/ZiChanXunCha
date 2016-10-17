//
//  SLUnannoncedCell3.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLUnannoncedCell3.h"

@implementation SLUnannoncedCell3

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)init{
    return [SLUnannoncedCell3 loadFromNib];
    
    
}

+(SLUnannoncedCell3*)loadFromNib{
    SLUnannoncedCell3  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLUnannoncedCell3" owner:self options:nil]lastObject];
    
    return cell;
}

@end
