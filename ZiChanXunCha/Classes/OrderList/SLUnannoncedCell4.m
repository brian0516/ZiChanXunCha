//
//  SLUnannoncedCell4.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/13.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLUnannoncedCell4.h"

@interface SLUnannoncedCell4 ()<UITextViewDelegate>

@end

@implementation SLUnannoncedCell4

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)init{
    return [SLUnannoncedCell4 loadFromNib];
    
    
}

+(SLUnannoncedCell4 *)loadFromNib{
    SLUnannoncedCell4  * cell = [[[NSBundle mainBundle]loadNibNamed:@"SLUnannoncedCell4" owner:self options:nil]lastObject];
    
    return cell;
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
