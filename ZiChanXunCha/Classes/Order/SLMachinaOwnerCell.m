//
//  SLMachinaOwnerCell.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/8.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLMachinaOwnerCell.h"


@interface SLMachinaOwnerCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *genderImageView;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


@end

@implementation SLMachinaOwnerCell

-(void)awakeFromNib{
    [super awakeFromNib];
    UIImage * image = [UIImage imageNamed:@"backgroundImage-2"];
    image = [image stretchableImageWithLeftCapWidth:15 topCapHeight:15];
    self.backgroundImageView.image = image;
    
    self.imageView.layer.shadowColor = [UIColor redColor].CGColor;
    self.imageView.layer.shadowOffset = CGSizeMake(10,10);
    self.imageView.layer.opacity = 0.9;
    self.imageView.layer.shadowRadius = 5;
    
    
}

-(instancetype)init{
    return [SLMachinaOwnerCell loadFromNib];


}

+(SLMachinaOwnerCell*)loadFromNib{
    SLMachinaOwnerCell  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLMachinaOwnerCell" owner:self options:nil]lastObject];

    return cell;
}



@end
