//
//  SLLoginAndRegisterRequest.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/14.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SLRegisterFeedBackInfo;

typedef void(^registerFeedBackBlock)(BOOL success,SLRegisterFeedBackInfo* registerFeedBackInfo);



#pragma -mark 注册登录基类
@interface SLLoginAndRegisterRequest : NSObject

@property(nonatomic,strong)NSString * mobile;
@property(nonatomic,strong)NSString * password;
@property(nonatomic,strong)NSString * phoneSign;  //设备唯一标识


+(instancetype)defaultInstance;

/**
 *  发起请求
 */
-(void)requestWithBlock:(registerFeedBackBlock)feedBackBlock;

/**
 *  判断提交的信息是否符合要求
 *
 *  @return
 */
-(BOOL)isInfoAvailable;

/**
 *  判断电话号码是否符合要求
 *
 *  @return
 */
-(BOOL)isMobileAvailable;

/**
 *  判断密码是否相同并符合要求
 *
 *  @return
 */
-(BOOL)isPasswordAvailable;

/**
 *  判断验证码是否为空
 */
-(BOOL)isIdentifyCodeAvailable;


@end



#pragma - mark 登录类model
@interface SLLoginModel : SLLoginAndRegisterRequest

+(instancetype)defaultInstance;

@end

#pragma - mark 注册model
@interface SLRegisterModel : SLLoginAndRegisterRequest

@property (nonatomic,strong)NSString *confirmPassword;
@property (nonatomic,strong)NSString *verify; //是否验证通过

+(instancetype)defaultInstance;

@end




#pragma -mark 返回结果的用户信息
@interface SLReigisterFeedBackUserInfo : NSObject

@property (nonatomic,strong) NSString * tokenStr;  //登录令牌
@property (nonatomic,strong) NSString * loginId; // 巡查人员登录ID;

@end


#pragma - mark 返回结果
@interface SLRegisterFeedBackInfo : NSObject

@property(nonatomic,strong)NSString * code; //方法执行状态码
@property(nonatomic,strong)NSString * msg; //方法执行的信息
@property(nonatomic,strong)SLReigisterFeedBackUserInfo * userInfo;

@end

