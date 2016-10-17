//
//  SLOrderList_LoactionCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/10.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderList_LoactionCell.h"


@interface SLOrderList_LoactionCell ()
@property (weak, nonatomic) IBOutlet UIView *bgView;



@end

@implementation SLOrderList_LoactionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bgView.layer.cornerRadius = 3;
    self.bgView.layer.borderWidth = 0.5;
    self.bgView.layer.borderColor = UIColorHex(cccccc).CGColor;
    self.bgView.layer.masksToBounds = YES;
    
}

-(instancetype)init{
    return [SLOrderList_LoactionCell loadFromNib];
    
    
}

+(SLOrderList_LoactionCell*)loadFromNib{
    SLOrderList_LoactionCell  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLOrderList_LoactionCell" owner:self options:nil]lastObject];
    
    return cell;
}
@end
