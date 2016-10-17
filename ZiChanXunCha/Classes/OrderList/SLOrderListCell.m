//
//  SLOrderListCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/8.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLOrderListCell.h"

@interface SLOrderListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UIImageView *indicatorImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *indicatorLabel;

@end

@implementation SLOrderListCell


-(void)awakeFromNib{
    [super awakeFromNib];
    
    UIImage * image = [UIImage imageNamed:@"backgroundImage_1"];
    image = [image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    self.backgroundImageView.image = image;

}

-(instancetype)init{
    return [SLOrderListCell loadFromNib];
    
    
}

+(SLOrderListCell*)loadFromNib{
    SLOrderListCell  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLOrderListCell" owner:self options:nil]lastObject];
    
    return cell;
}

@end
