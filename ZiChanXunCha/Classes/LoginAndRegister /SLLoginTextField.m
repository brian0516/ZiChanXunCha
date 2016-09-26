//
//  SLLoginTextField.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/24.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLLoginTextField.h"

// MARK: 静态量
static NSString * KLineColor = @"CCCCCC";


// MARK: 布局数据
static CGFloat const KVerticalLineWidth = 1.0f;
static CGFloat const KVerticalLineTopAndBottomMargin = 10.0f;




@interface SLLoginTextField ()

@property(nonatomic,strong) UIImageView * preFixImageView;   //顶端的视图
@property(nonatomic,strong) UIButton * subButton;   //尾部的视图
@property(nonatomic,strong) UIView * verticalLine; //分割线
@property(nonatomic,strong) UITextField * textField;

@property (nonatomic,strong)UIView * bottomLine;//底部线;

@property (nonatomic,assign) SLLoginTextFieldStyle style;

@end

@implementation SLLoginTextField

-(instancetype)initWithStyle:(SLLoginTextFieldStyle)style PreFixImage:(UIImage*)image placeholder:(NSString*)placeholder subFixImages:(NSArray*)subImages{

    self = [super init];
    if (self) {
        
        self.style = style;
        
        self.keyboardType = UIKeyboardTypeDefault;
        
        self.secureTextEntry = NO;
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.clipsToBounds = YES;
        
        if (image) {
            self.preFixImageView.image = image;
        }
        
        if (subImages.count!=0) {
            [self.subButton setImage:[subImages firstObject] forState:UIControlStateNormal];
            [self.subButton setImage:[subImages lastObject] forState:UIControlStateSelected];
        }
        
        [self textField];
        if (placeholder!=nil) {
            self.textField.placeholder = placeholder;
        }
    }
    return self;
}

//设置键盘
-(void)setKeyboardType:(UIKeyboardType)keyboardType{
    _keyboardType = keyboardType;
    self.textField.keyboardType = keyboardType;
}


//设置是否使用密码格式
-(void)setSecureTextEntry:(BOOL)security{
    _secureTextEntry = security;
    [self.textField setSecureTextEntry:security];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    DefineWeakSelf;
    if (self.style == SLLoginTextFieldStyleDefault) {
        [self bottomLine];
        
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(KVerticalLineWidth));
            make.width.equalTo(weakSelf.mas_width);
            make.bottom.equalTo(weakSelf.mas_bottom);
            make.left.equalTo(@(0));
        }];
        
    }

    if (self.style == SLLoginTextFieldCorner) {
        self.layer.cornerRadius = self.height/2;
    }
    
    
    
    if (_preFixImageView) {
        
        [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(KVerticalLineWidth));
            make.topMargin.equalTo(weakSelf).offset(KVerticalLineTopAndBottomMargin);
            make.bottomMargin.equalTo(weakSelf).offset(-KVerticalLineTopAndBottomMargin);
            make.leftMargin.offset(weakSelf.height);
        }];
        
        [self.preFixImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(weakSelf.height, weakSelf.height));
            make.leftMargin.offset(15);
            make.centerY.equalTo(weakSelf);
        }];
        
      
        
    }
    
    if (_subButton) {
        [self.subButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(weakSelf.height, weakSelf.height));
            make.rightMargin.equalTo(weakSelf);
            make.centerY.equalTo(weakSelf);
        }];
    }
    
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        CGFloat offSetLeft = 10;
        CGFloat offSetRight = 0;
        
        
        if (_preFixImageView) {
            offSetLeft += weakSelf.height+KVerticalLineWidth;
        }
        
        if (_subButton) {
            offSetRight += weakSelf.height;
        }
        make.left.equalTo(weakSelf).offset(offSetLeft);
        make.right.equalTo(weakSelf).offset(-offSetRight);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.equalTo(weakSelf);
        
    }];
    
}

#pragma -mark  ------actions-------
-(void)subButtonClickd:(id)sender{
    
    UIButton * btn = sender;
    btn.selected = !btn.selected;
    
    if (self.buttonBlock) {
        self.buttonBlock();
    }

}

#pragma - mark  --------lazyLoad--------

//前段视图
-(UIImageView *)preFixImageView{
    if (!_preFixImageView) {
        _preFixImageView = [[UIImageView alloc]init];
        [self addSubview:_preFixImageView];
    }
    return _preFixImageView;
}



-(UIButton *)subButton{
    if (!_subButton) {
        _subButton = [[UIButton alloc]init];
        [_subButton addTarget:self action:@selector(subButtonClickd:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_subButton];
    }
    return  _subButton;
}

-(UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.backgroundColor = [UIColor whiteColor];
        [self addSubview:_textField];
    }
    return _textField;
}

-(UIView *)verticalLine{
    if (!_verticalLine) {
        _verticalLine = [[UIView alloc]init];
        _verticalLine.backgroundColor = [UIColor colorWithHexString:KLineColor];
        [self addSubview:_verticalLine];
    }
    return _verticalLine;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]init];
        _bottomLine.backgroundColor = [UIColor colorWithHexString:KLineColor];
        [self addSubview:_bottomLine];
    }
    return _bottomLine;
}

@end
