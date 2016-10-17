//
//  SLCell3.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLCell3.h"

@interface SLCell3 ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@end

@implementation SLCell3

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(instancetype)init{
    return [SLCell3 loadFromNib];
    
    
}

+(SLCell3*)loadFromNib{
    SLCell3  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLCell3" owner:self options:nil]lastObject];
    cell.clipsToBounds = YES;
    return cell;
}


-(void)textViewDidBeginEditing:(UITextView *)textView{
    _placeholderLabel.hidden = YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length<=0) {
        _placeholderLabel.hidden = NO;
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGRect bounds = textView.bounds;
    // 计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    textView.bounds = bounds;
    // 让 table view 重新计算高度
    UITableView *tableView = [self tableView];
    [tableView beginUpdates];
    [tableView endUpdates];
    
}


- (UITableView *)tableView
{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}



@end
