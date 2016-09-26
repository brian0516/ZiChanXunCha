//
//  SLMainViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/9.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLMainViewController.h"
#import "AppDelegate.h"
#import "SLPlayVideoController.h"
#import "SLLoginTextField.h"
#import "SLRegisterViewController.h"

// MARK: 静态字符串
static NSString * const KBgColor    = @"006cba"; //背景颜色
static NSString * const KLogoName   = @"logo";
static NSString * const KSlogan     = @"大田金融资产管理有限公司";
static NSString * const KLoginBtnTitle      =  @"登录";
static NSString * const KLoginBtnBgColor    = @"f6ab00";
static NSString * const KForgetPassWordBtnTitle = @"忘记密码?";
static NSString * const KRegisterBtnTitle       = @"申请准入";

// MARK: 布局

static CGFloat const KLeftAndRightMargin    = 30.0f;  //按钮和输入框的左右边距
static CGFloat const KBtnAndTextFieldHeight = 44.0f;
static CGFloat const KVerticalGapNormal     = 10.0f;   //上下间距,输入框上下间距
static CGFloat const KVerticalLineWidth     = 1.0f;     //分隔竖线宽度
static CGFloat const KVerticalLineHeight    = 15.0f;    //分割线高度
static CGFloat const KVerticalGapLoginBtnBelow = 23.0f; // 登录按钮和下方分割线的距离

static CGFloat const KPlayBtnBottomOffSet = 35.0f;      //视频播放按钮居底部
static CGFloat  const   KLogoWidth = 90.0f; // Logo宽度
static CGFloat  const   KLogAndSloganGap = 15.0f; //logo和slogan间距

static CGFloat const KVerticalLineAndBtnGap = 30.0f; //竖线与按钮间距


@interface SLMainViewController ()

@property (nonatomic,strong) UIImageView * logoImageView;   // logo
@property (nonatomic,strong) UILabel * sloganLabel;         //slogan
@property (nonatomic,strong) SLLoginTextField * userNameTF;           //enterUserName
@property (nonatomic,strong) SLLoginTextField * passwordTF;           // enterPassword
@property (nonatomic,strong) UIButton * loginBtn;           //loginButton
@property (nonatomic,strong) UIButton * forgetPasswordBtn;  //getpassword;
@property (nonatomic,strong) UIButton * registerBtn;        //register
@property (nonatomic,strong) UIView * notice;               //温馨提示
@property (nonatomic,strong) UIButton * playVideoBtn;
@property (nonatomic,strong) UIView * verticalLine;         //分隔线

@property (nonatomic,strong) UIView * temView; //透明层

@end


@implementation SLMainViewController

#pragma -mark ---liftCycle

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:KBgColor];
    [self _layoutSubViews];
    
    self.navigationController.navigationBarHidden = YES;
}


#pragma - mark ---------privateMethod------------

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.loginBtn.layer.cornerRadius = self.loginBtn.height/2;
    self.loginBtn.layer.masksToBounds = YES;
    
    self.playVideoBtn.layer.cornerRadius = self.playVideoBtn.height/2;
    self.playVideoBtn.layer.masksToBounds = YES;
    
}

//布局子视图
-(void)_layoutSubViews{

    DefineWeakSelf;
    
    //先布局输入密码框
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(KLeftAndRightMargin));
        make.right.equalTo(@(-KLeftAndRightMargin));
        make.centerY.equalTo(weakSelf.view.mas_centerY);
        make.height.equalTo(@(KBtnAndTextFieldHeight));
    }];
    
    //布局"输入用户名"
    [self.userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.equalTo(weakSelf.passwordTF);
        make.rightMargin.equalTo(weakSelf.passwordTF);
        make.height.equalTo(weakSelf.passwordTF);
        make.centerY.equalTo(weakSelf.view.mas_centerY).offset(-(KBtnAndTextFieldHeight+KVerticalGapNormal));
    }];
    
    //布局"登录按钮"
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.equalTo(weakSelf.passwordTF);
        make.rightMargin.equalTo(weakSelf.passwordTF);
        make.height.equalTo(weakSelf.passwordTF);
        make.centerY.equalTo(weakSelf.view.mas_centerY).offset(KBtnAndTextFieldHeight+KVerticalGapNormal);
    }];
    
    //布局"分隔竖线"
    [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(KVerticalLineWidth));
        make.height.equalTo(@(KVerticalLineHeight));
        make.top.equalTo(weakSelf.loginBtn.mas_bottom).offset(KVerticalGapLoginBtnBelow);
        make.centerXWithinMargins.equalTo(weakSelf.loginBtn);
    }];
    
    //布局"忘记密码按钮"
    [self.forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.rightMargin.equalTo(weakSelf.verticalLine.mas_leftMargin).offset(-KVerticalLineAndBtnGap);
        make.centerY.equalTo(weakSelf.verticalLine);
    }];
    
    
    //布局"申请按钮"
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.equalTo(weakSelf.verticalLine.mas_rightMargin).offset(KVerticalLineAndBtnGap);
        make.centerY.equalTo(weakSelf.verticalLine);    }];
    
    //布局"播放视频按钮"
    [self.playVideoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.equalTo(weakSelf.passwordTF);
        make.rightMargin.equalTo(weakSelf.passwordTF);
        make.height.equalTo(weakSelf.passwordTF);
        make.bottom.equalTo(weakSelf.view).offset(-KPlayBtnBottomOffSet);
    }];
    
    //布局"logo透明层"
    [self.temView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(weakSelf.view);
        make.leftMargin.equalTo(weakSelf.view);
        make.rightMargin.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.userNameTF.mas_top);
    }];
    
    
    //布局"logo"
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(KLogoWidth));
        make.height.equalTo(@(KLogoWidth));
        make.center.equalTo(weakSelf.temView);
    }];
    
    //布局"slogan"
    [self.sloganLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.logoImageView.mas_bottom).offset(KLogAndSloganGap);
        make.centerX.equalTo(weakSelf.view);
    }];
    
}


// TODO 登录成功 切换主控制器
-(void)loginSuccess{

//    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
//    [delegate configRootViewController:@"SLMainTabBarController"];
}

#pragma -mark ------------ actions-----------

// TODO 登录
-(void)login{

}


// TODO 找回密码
-(void)getPassword{

}

// TODO 注册
-(void)myRegister{
    SLRegisterViewController * registerViewController = [[SLRegisterViewController alloc]init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}


//跳转到视频播放界面
-(void)playVideo{

    SLPlayVideoController * playVideoController = [[SLPlayVideoController alloc]init];
    
    [self addChildViewController:playVideoController];
    [self.view addSubview:playVideoController.view];
    
    
//    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:playVideoController];
//
//    [self presentViewController:nav animated:YES completion:nil];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


#pragma -mark ----------- lazyLoad --------------

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

//slogan
-(UILabel *)sloganLabel{
    if (!_sloganLabel) {
        _sloganLabel = [[UILabel alloc]init];
        _sloganLabel.text = KSlogan;
        _sloganLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_sloganLabel];
    }
    return _sloganLabel;
}

//输入用户名
// TODO 这个类要重新
-(SLLoginTextField *)userNameTF{
    if (!_userNameTF) {
        _userNameTF = [[SLLoginTextField alloc]initWithStyle:SLLoginTextFieldCorner PreFixImage:[UIImage imageNamed:@"logo"] placeholder:@"请输入用户名/手机号" subFixImage:nil];
        [self.view addSubview:_userNameTF];
    }
    return _userNameTF;
}

//输入密码
// TODO 这个类要重新
-(SLLoginTextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [[SLLoginTextField alloc]initWithStyle:SLLoginTextFieldCorner PreFixImage:[UIImage imageNamed:@"logo"] placeholder:@"请输入密码" subFixImage:[UIImage imageNamed:@"logo"]];
        _passwordTF.secureTextEntry = YES;
        
        
        __block typeof(_passwordTF) weakPasswordTF = _passwordTF;
        _passwordTF.buttonBlock = ^{
            weakPasswordTF.secureTextEntry = !weakPasswordTF.secureTextEntry;
        };
        [self.view addSubview:_passwordTF];
    }
    return _passwordTF;
}

//登录按钮
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:KLoginBtnTitle forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor colorWithWhite:0.90 alpha:1] forState:UIControlStateHighlighted];
        [_loginBtn setBackgroundColor:[UIColor colorWithHexString:KLoginBtnBgColor] ForState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[[UIColor colorWithHexString:KLoginBtnBgColor] colorWithAlphaComponent:0.8] ForState:UIControlStateHighlighted];
        [self.view addSubview:_loginBtn];
    }
    return _loginBtn;
}

//分隔线
-(UIView *)verticalLine{
    if (!_verticalLine) {
        _verticalLine = [UIView new];
        _verticalLine.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_verticalLine];
    }
    return _verticalLine;
}

//忘记密码按钮
-(UIButton *)forgetPasswordBtn{
    if (!_forgetPasswordBtn) {
        _forgetPasswordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_forgetPasswordBtn setTitle:KForgetPassWordBtnTitle forState:UIControlStateNormal];
        [_forgetPasswordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_forgetPasswordBtn addTarget:self action:@selector(getPassword) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_forgetPasswordBtn];
    }
    return _forgetPasswordBtn;
}

//注册按钮
-(UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_registerBtn setTitle:KRegisterBtnTitle forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(myRegister) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_registerBtn];
    }
    return _registerBtn;
}


//播放视频按钮
-(UIButton *)playVideoBtn{
    if (!_playVideoBtn) {
        _playVideoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_playVideoBtn setBackgroundColor:[UIColor redColor] ForState:UIControlStateNormal];
        [_playVideoBtn setBackgroundColor:[UIColor greenColor] ForState:UIControlStateHighlighted];
        [_playVideoBtn addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_playVideoBtn];
    }
    return _playVideoBtn;
}

//透明层
-(UIView *)temView{
    if (!_temView) {
        _temView = [UIView new];
        [self.view addSubview:_temView];
    }
    return _temView;
}


@end
