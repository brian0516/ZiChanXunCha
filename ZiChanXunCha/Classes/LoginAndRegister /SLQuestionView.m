//
//  SLQuestionView.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/28.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLQuestionView.h"

// MARK: 静态字符串
static NSString * const KTitleBgColor = @"0076DD";

// MARK:
static CGFloat const KImageViewTopOffset = 25;
static CGFloat const KTitleLabelLeftOffset = 30;
static CGFloat const KTitleLabelTopOffset = 25;
static CGFloat const KTableViewTopOffSet = 25;

static CGFloat const KCellBGLeftMargin = 30;
static CGFloat const KCellBGHeight = 44;

static CGFloat const KCellAnswerLeftOffSet = 20;


@interface SLQuestionViewCell ()

@property (nonatomic,strong)UIView * bgView;
@property (nonatomic,strong)UILabel * answerLabel;

@end

@implementation SLQuestionViewCell

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(0);
        make.left.offset(KCellBGLeftMargin);
        make.right.offset(-KCellBGLeftMargin);
        make.height.mas_equalTo(KCellBGHeight);

    }];
    

    [self.answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KCellAnswerLeftOffSet);
        make.right.offset(-KCellAnswerLeftOffSet);
        make.centerY.offset(0);
    }];
    
    
}




-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = UIColorHex(f0f0f0);
        [_bgView addSubview:self.answerLabel];
        _bgView.layer.cornerRadius =KCellBGHeight/2;
        _bgView.layer.masksToBounds = YES;
        [self.contentView addSubview:_bgView];
        
    }
    return _bgView;
}

-(UILabel *)answerLabel{
    if (!_answerLabel) {
        _answerLabel = [[UILabel alloc]init];
        _answerLabel.textColor = UIColorHex(333333);
    }
    return _answerLabel;
}



@end

#pragma -mark -------------------------------------------------------


@interface SLQuestionView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,strong)UITableView * tableView;




@end


@implementation SLQuestionView


-(void)layoutSubviews{
    [super layoutSubviews];
    
    DefineWeakSelf;
    
    //使用marsonry label自适应高度,要做如下设置
    self.titleLabel.preferredMaxLayoutWidth = (self.width -10.0 * 2);
    [self.titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    self.titleLabel.numberOfLines =0;
    
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf);
        make.top.offset(KImageViewTopOffset);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf.imageView);
        make.size.mas_equalTo(weakSelf.imageView);
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imageView.mas_bottom).offset(KTitleLabelTopOffset);
        make.leftMargin.offset(KTitleLabelLeftOffset);
        make.rightMargin.offset(-KTitleLabelLeftOffset);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(KTableViewTopOffSet);
        make.left.and.right.offset(0);
        make.bottom.mas_equalTo(0);
    }];
  
}

#pragma -mark -------------tableViewDelegate---------------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SLQuestionViewCell * cell = [[SLQuestionViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.answerLabel.text = @"这里是答案";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DLog(@"12312312323");

}


#pragma -mark -----------------lazyLoad----------------
-(UIImageView *)imageView{

    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"xc_tihao"];
        [self addSubview:_imageView];
        [_imageView addSubview:self.label];
    }
    return _imageView;
}

-(UILabel*)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor colorWithHexString:KTitleBgColor];
    }
    return _label;
}

-(YYLabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[YYLabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor colorWithHexString:KTitleBgColor];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.alwaysBounceVertical = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
        [self addSubview:_tableView];
    }
    return _tableView;
}


@end





