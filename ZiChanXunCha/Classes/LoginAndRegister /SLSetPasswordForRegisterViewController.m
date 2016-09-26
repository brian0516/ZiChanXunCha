//
//  SLSetPasswordForRegisterViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/26.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLSetPasswordForRegisterViewController.h"
#import "SLLoginTextField.h"
// MARK: 静态字符串
static NSString * const KLogoName   = @"logo";
static NSString * const KNoticeText = @"*6-16位字符,数字、字母、符号至少有两种元素组合";
static NSString * const KRegisterBtnTitle = @"注册";

static CGFloat    const KNoticeTextFontSize = 11.0f;
static NSString * const KNoticeTextColor = @"757a8a";
static NSString * const KRegisterBtnBgColor = @"0177DC";

// MARK: 布局
static CGFloat const KNavigationBarHeight = 64.0f;

static CGFloat const KLogoWidth = 78.0f;
static CGFloat const KLogoTop = 35.0f;

static CGFloat const KLeftAndRightMargin    = 30.0f;  //按钮和输入框的左右边距
static CGFloat const KBtnAndTextFieldHeight = 44.0f;
static CGFloat const KConfirmPasswordTopOffset = 15;
static CGFloat const KPasswordTFTopOffSet = 50.0f;

static CGFloat const KNoticeLabelTopOffSet = 10.0f;

static CGFloat const KRegisterBtnWidth = 230;
static CGFloat const KRegisterBtnTopOffSet = 30;

@interface SLSetPasswordForRegisterViewController ()

@property (nonatomic,strong)UIImageView * logoImageView;

@property (nonatomic,strong)SLLoginTextField * passwordTF;
@property (nonatomic,strong)SLLoginTextField * confirmPasswordTF;
@property (nonatomic,strong)UIButton * registerBtn ;

@property (nonatomic,strong)YYLabel * noticeLabel;


@end

@implementation SLSetPasswordForRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"手机注册";
    [self _layoutSubViews];
    
}


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.registerBtn.layer.cornerRadius = self.registerBtn.height/2;
    self.registerBtn.layer.masksToBounds = YES;
}

#pragma -mark  --------privateMethod----
-(void)_layoutSubViews{
    
    DefineWeakSelf;
    
    //布局"logo"
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(KLogoWidth, KLogoWidth));
        make.centerX.mas_equalTo(weakSelf.view);
        make.top.mas_equalTo(@(KNavigationBarHeight+KLogoTop));
    }];


    //布局password
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(KLeftAndRightMargin));
        make.right.equalTo(@(-KLeftAndRightMargin));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.height.equalTo(@(KBtnAndTextFieldHeight));
        make.top.equalTo(weakSelf.logoImageView.mas_bottom).offset(KPasswordTFTopOffSet);
    }];
    
    
    //布局confirmpassword
    [self.confirmPasswordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(KLeftAndRightMargin));
        make.right.equalTo(@(-KLeftAndRightMargin));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.height.equalTo(@(KBtnAndTextFieldHeight));
        make.top.equalTo(weakSelf.passwordTF.mas_bottom).offset(KConfirmPasswordTopOffset);
    }];

    
    //布局提醒消息
    [self.noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(weakSelf.passwordTF);
        make.top.mas_equalTo(weakSelf.confirmPasswordTF.mas_bottom).offset(KNoticeLabelTopOffSet);
        
    }];
    
    
    //注册按钮
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(KBtnAndTextFieldHeight);
        make.width.mas_equalTo(KRegisterBtnWidth);
        make.top.mas_equalTo(weakSelf.noticeLabel.mas_bottom).offset(KRegisterBtnTopOffSet);
        make.centerX.mas_equalTo(weakSelf.view);
    }];
    
}


#pragma -mark acttions---

-(void)registerBtnClicked:(id)sender{


}


# pragma -mark ------lazyLoad------
//logo图片
-(UIImageView *)logoImageView{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]init];
        // TODO SL-添加图片名称,改变背景颜色
        _logoImageView.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.9];
        _logoImageView.image = [UIImage imageNamed:KLogoName];
        [self.view addSubview:_logoImageView];
    }
    return _logoImageView;
}


//输入密码
-(SLLoginTextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [[SLLoginTextField alloc]initWithStyle:SLLoginTextFieldStyleDefault PreFixImage:[UIImage imageNamed:@"logo"] placeholder:@"请输入密码" subFixImage:nil];
        _passwordTF.secureTextEntry = YES;
        [self.view addSubview:_passwordTF];
    }
    return _passwordTF;
}

//再次输入密码
-(SLLoginTextField *)confirmPasswordTF{
    if (!_confirmPasswordTF) {
        _confirmPasswordTF = [[SLLoginTextField alloc]initWithStyle:SLLoginTextFieldStyleDefault PreFixImage:[UIImage imageNamed:@"logo"] placeholder:@"请再次输入密码" subFixImage:nil];
        _confirmPasswordTF.secureTextEntry = YES;
        [self.view addSubview:_confirmPasswordTF];
    }
    return _confirmPasswordTF;
}

-(YYLabel *)noticeLabel{
    if (!_noticeLabel) {
        _noticeLabel = [[YYLabel alloc]init];
        _noticeLabel.text = KNoticeText;
        _noticeLabel.font = [UIFont systemFontOfSize:KNoticeTextFontSize];
        _noticeLabel.textColor = [UIColor colorWithHexString:KNoticeTextColor];
        [self.view addSubview:_noticeLabel];
    }
    return _noticeLabel;
}


//注册按钮
-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_registerBtn setTitle:KRegisterBtnTitle forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_registerBtn setBackgroundColor:[UIColor colorWithHexString:KRegisterBtnBgColor] ForState:UIControlStateNormal];
        [_registerBtn setBackgroundColor:[[UIColor colorWithHexString:KRegisterBtnBgColor] colorWithAlphaComponent:0.8] ForState:UIControlStateHighlighted];
        
        [self.view addSubview:_registerBtn];
    }
    return _registerBtn;
}


@end
