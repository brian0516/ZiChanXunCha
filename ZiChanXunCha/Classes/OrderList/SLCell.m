//
//  SLCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/12.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLCell.h"

@interface SLCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *textFieldBackgroundView;

@end

@implementation SLCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UIImage * image = [UIImage imageNamed:@"backgroundImage-2"];
    image = [image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    self.backgroundImageView.image = image;

    self.textFieldBackgroundView.layer.borderWidth = 0.5;
    self.textFieldBackgroundView.layer.borderColor = UIColorHex(bdc9d9).CGColor;
    
}

-(instancetype)init{
    return [SLCell loadFromNib];
    
    
}

+(SLCell*)loadFromNib{
    SLCell  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLCell" owner:self options:nil]lastObject];
    
    return cell;
}

@end
