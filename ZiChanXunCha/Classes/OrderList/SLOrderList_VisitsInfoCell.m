//
//  SLOrderList_VisitsInfoCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/10.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderList_VisitsInfoCell.h"



@implementation SLOrderList_VisitsInfoCell


-(void)awakeFromNib{
    [super awakeFromNib];
    
    
}

-(instancetype)init{
    return [SLOrderList_VisitsInfoCell loadFromNib];
    
    
}

+(SLOrderList_VisitsInfoCell*)loadFromNib{
    SLOrderList_VisitsInfoCell  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLOrderList_VisitsInfoCell" owner:self options:nil]lastObject];
    
    return cell;
}
@end
