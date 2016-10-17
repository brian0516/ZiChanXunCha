//
//  SLMachinaInfoCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/30.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLMachinaInfoCell.h"

@interface SLMachinaInfoCell ()

@property (weak, nonatomic) IBOutlet UIView *myBackgroundView;


@end


@implementation SLMachinaInfoCell


-(void)awakeFromNib{
    [super awakeFromNib];
    self.myBackgroundView.layer.cornerRadius = 3;
    self.myBackgroundView.layer.borderWidth = 0.5;
    self.myBackgroundView.layer.borderColor = UIColorHex(cccccc).CGColor;
    self.myBackgroundView.layer.masksToBounds = YES;

}

-(instancetype)init{
    return [SLMachinaInfoCell loadFromNib];
    
    
}

+(SLMachinaInfoCell*)loadFromNib{
    SLMachinaInfoCell  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLMachinaInfoCell" owner:self options:nil]lastObject];
    
    return cell;
}


@end
