//
//  SLRegisterViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/24.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLRegisterViewController.h"
#import "SLLoginTextField.h"
#import "SLSetPasswordForRegisterViewController.h"

// MARK: 静态字符串
static NSString * const KLogoName   = @"xc_logo";
static NSString * const KNextButtonTitle = @"下一步";
static NSString * const KNextBtnBgColor    = @"0177DC";
static NSString * const KAgreeBtnImageNormal = @"0177dc";
static NSString * const KAgreeBtnImageSelected = @"";
static NSString * const KGetIdentifyBtnBgColor = @"8ac8ff";
static NSString * const KGetIdentifyBtnTitle = @"获取验证码";
static NSString * const KGetIdentifyBtnAgainTitle = @"重新获取";
static CGFloat    const KGetIdentifyBtnFontSize = 12.0f;

#ifdef DEBUG
static CGFloat    const  KGetIdentifyDuration = 10.0f;
#else
static CGFloat    const  KGetIdentifyDuration = 180.0f;
#endif
// MARK: 布局
static CGFloat const KNavigationBarHeight = 64.0f;

static CGFloat const KLogoWidth = 78.0f;
static CGFloat const KLogoTop = 35.0f;
static CGFloat const KLeftAndRightMargin    = 30.0f;  //按钮和输入框的左右边距
static CGFloat const KBtnAndTextFieldHeight = 44.0f;
static CGFloat const KPhoneNumberTFTopOffSet = 50.0f;
static CGFloat const KIdentifyTFTopOffSet = 15;

static CGFloat const KNextBtnWidth = 160.0f;
static CGFloat const KNextBtnTopOffSet = 50.0f;

static CGFloat const KAgreeBtnTopOffSet = 33.0f;

static CGFloat const KGetIdentifyBtnHeight = 28.0f;
static CGFloat const KGetIdentifyBtnWidth = 95.0f;




@interface SLRegisterViewController ()

@property (nonatomic,strong)UIImageView * logoImageView;
@property (nonatomic,strong)SLLoginTextField * enterPhoneNumberTF;
@property (nonatomic,strong)SLLoginTextField * identifyCodeTF;//验证码
@property (nonatomic,strong)UIButton * nextButton;
@property (nonatomic,strong)UIButton * agreeBtn;
@property (nonatomic,strong)UIButton * getIdentifyCodeBtn; // 获取验证码

@end

@implementation SLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"手机注册";
    [self _layoutSubViews];
}


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.nextButton.layer.cornerRadius = self.nextButton.height/2;
    self.nextButton.layer.masksToBounds = YES;
    
    self.getIdentifyCodeBtn.layer.cornerRadius = self.getIdentifyCodeBtn.height/2;
    self.getIdentifyCodeBtn.layer.masksToBounds = YES;
    
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
    
    
    
    //布局enterPhoneNumberTF
    [self.enterPhoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(KLeftAndRightMargin));
        make.right.equalTo(@(-KLeftAndRightMargin));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.height.equalTo(@(KBtnAndTextFieldHeight));
        make.top.equalTo(weakSelf.logoImageView.mas_bottom).offset(KPhoneNumberTFTopOffSet);
    }];
    
    
    //布局identifyCodeTF
    [self.identifyCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(KLeftAndRightMargin));
        make.right.equalTo(@(-KLeftAndRightMargin));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.height.equalTo(@(KBtnAndTextFieldHeight));
        make.top.equalTo(weakSelf.enterPhoneNumberTF.mas_bottom).offset(KIdentifyTFTopOffSet);
    }];
    
    
    //获取验证码按钮
    [self.getIdentifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(KGetIdentifyBtnWidth);
        make.height.mas_equalTo(KGetIdentifyBtnHeight);
        make.centerY.mas_equalTo(weakSelf.identifyCodeTF.mas_centerY);
        make.rightMargin.mas_equalTo(weakSelf.identifyCodeTF.mas_rightMargin);
    }];
    
    
    //下一步按钮
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.equalTo(@(KNextBtnWidth));
        make.height.equalTo(@(KBtnAndTextFieldHeight));
        make.top.equalTo(weakSelf.identifyCodeTF.mas_bottom).offset(KNextBtnTopOffSet);
    }];
    
    //条款按钮
    [self.agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weakSelf.view);
        make.height.equalTo(@(KBtnAndTextFieldHeight));
        make.top.equalTo(weakSelf.nextButton.mas_bottom).offset(KAgreeBtnTopOffSet);
        make.left.equalTo(@(0));
    }];
}


#pragma -mark ---------actions ------------

-(void)nextStep:(id)sender{
    
    SLSetPasswordForRegisterViewController * setPassword = [[SLSetPasswordForRegisterViewController alloc]init];
    [self.navigationController pushViewController:setPassword animated:YES];
    
    
}


//获取验证码
-(void)getIdentify:(id)sender{
    
    UIButton * btn = sender;
    btn.userInteractionEnabled = NO;
    
    [SLHelper countDownWithDuration:KGetIdentifyDuration eveySecondBlock:^(NSUInteger leftSeconds) {
        
        NSString * titleStrint = [NSString stringWithFormat:@"重新获取(%lu)",(unsigned long)leftSeconds];
        btn.userInteractionEnabled = YES;
        [btn setTitle:titleStrint forState:UIControlStateNormal];
        
        
    } finishBlock:^(BOOL finished) {
        btn.userInteractionEnabled = YES;
        [btn setTitle:KGetIdentifyBtnAgainTitle forState:UIControlStateNormal];
        
    }];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



#pragma -mark  -----------lazyLoad-------------
//输入电话
-(SLLoginTextField *)enterPhoneNumberTF{
    if (!_enterPhoneNumberTF) {
        _enterPhoneNumberTF = [[SLLoginTextField alloc]initWithStyle:SLLoginTextFieldStyleDefault PreFixImage:[UIImage imageNamed:@"xc_phone"] placeholder:@"请输入手机号" subFixImages:nil];
        [self.view addSubview:_enterPhoneNumberTF];
    }
    return _enterPhoneNumberTF;
}

//输入验证码
-(SLLoginTextField *)identifyCodeTF{
    if (!_identifyCodeTF) {
        _identifyCodeTF = [[SLLoginTextField alloc]initWithStyle:SLLoginTextFieldStyleDefault PreFixImage:[UIImage imageNamed:@"xc_yzm"] placeholder:@"请输入短信验证码" subFixImages:nil];
        [self.view addSubview:_identifyCodeTF];
    }
    return _identifyCodeTF;
}

//logo图片
-(UIImageView *)logoImageView{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]init];
        _logoImageView.image = [UIImage imageNamed:KLogoName];
        [self.view addSubview:_logoImageView];
    }
    return _logoImageView;
}

//下一步按钮
-(UIButton *)nextButton{
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_nextButton setTitle:KNextButtonTitle forState:UIControlStateNormal];
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
        [_nextButton setBackgroundColor:[UIColor colorWithHexString:KNextBtnBgColor] ForState:UIControlStateNormal];
        [self.view addSubview:_nextButton];
    }
    return _nextButton;
}

//agreeButton
-(UIButton *)agreeBtn{
    if(!_agreeBtn){
        _agreeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _agreeBtn.backgroundColor = [UIColor redColor];
        [_agreeBtn setBackgroundImage:[UIImage imageNamed:KAgreeBtnImageNormal] forState:UIControlStateNormal];
        [_agreeBtn setBackgroundImage:[UIImage imageNamed:KAgreeBtnImageSelected] forState:UIControlStateSelected];
        [self.view addSubview:_agreeBtn];
    }
    return _agreeBtn;
}


//获取验证码
-(UIButton *)getIdentifyCodeBtn{
    if (!_getIdentifyCodeBtn) {
        _getIdentifyCodeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _getIdentifyCodeBtn.backgroundColor = [UIColor colorWithHexString:KGetIdentifyBtnBgColor];
        [_getIdentifyCodeBtn setTitle:KGetIdentifyBtnTitle forState:UIControlStateNormal];
        [_getIdentifyCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _getIdentifyCodeBtn.titleLabel.font = [UIFont systemFontOfSize:KGetIdentifyBtnFontSize];
        [_getIdentifyCodeBtn addTarget:self action:@selector(getIdentify:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_getIdentifyCodeBtn];
    }
    return _getIdentifyCodeBtn;
}


@end
