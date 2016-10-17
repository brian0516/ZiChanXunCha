//
//  SLLoginAndRegisterRequest.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/14.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLLoginAndRegisterRequest.h"

@implementation SLLoginAndRegisterRequest


-(void)requestWithUrl:(NSString*)urlString Block:(registerFeedBackBlock)feedBackBlock{
    
    BOOL isAvailable = [self isInfoAvailable];
    if (!isAvailable) {
        return;
    }
    //将model转为json
      NSDictionary * paratmeters = [SLRequestHelper parametersFromModel:self];

    [PPNetworkHelper POST:urlString parameters:paratmeters success:^(id responseObject) {
        
        if (responseObject == nil || !responseObject ) {
            if (feedBackBlock) {
                feedBackBlock(NO,nil);
            }
            return ;
        }
        
        
        NSDictionary * dictionary = [SLRequestHelper responseDictionary:responseObject];
        
        SLRequestStatusModel * status = [SLRequestStatusModel modelWithJSON:dictionary];
        if (status.code != 200) {
            [XHToast showCenterWithText:status.msg];
            if (feedBackBlock) {
                feedBackBlock(NO,nil);
            }
        }
        else{
            SLRegisterFeedBackInfo * feedBackInfo = [SLRegisterFeedBackInfo modelWithJSON:dictionary[@"data"]];
            if (feedBackBlock) {
                feedBackBlock(YES,feedBackInfo);
            }
        }
    } failure:^(NSError *error) {
        if (feedBackBlock) {
            feedBackBlock(NO,nil);
            [XHToast showCenterWithText:@"网络故障,请稍后再试!"];
        }
    }];
}


//判断提交的信息是否符合要求
-(BOOL)isInfoAvailable{
    if ([self isMobileAvailable]&&[self isPasswordAvailable]&&[self isIdentifyCodeAvailable]) {
        return YES;
    }
    return NO;;
}


//判断电话号码是否符合要求
-(BOOL)isMobileAvailable{
    
    if ([self.mobile isBlackString]||![self.mobile telephoneRegular]) {
          [XHToast showCenterWithText:@"请检查电话号码是否正确!"];
        return NO;
    }
    return YES;
}


//判断密码是否相同并符合要求
-(BOOL)isPasswordAvailable{
    
    return [self.password passwordRegular];
    
}


-(BOOL)isIdentifyCodeAvailable{
    return YES;
}


@end





#pragma -mark 登录Model
@implementation SLLoginModel

+(instancetype)defaultInstance{
    static SLLoginModel * model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        model = [[SLLoginModel alloc]init];
        model.phoneSign = [[[UIDevice currentDevice] identifierForVendor]UUIDString];
        
        
    });
    return model;
}

@end



@implementation SLRegisterModel

+(instancetype)defaultInstance{
    static SLRegisterModel * model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        model = [[SLRegisterModel alloc]init];
        model.phoneSign = [[[UIDevice currentDevice] identifierForVendor]UUIDString];
        
        
    });
    return model;
}







//重写password判断
-(BOOL)isPasswordAvailable{

    if (![self.password isEqualToString:self.confirmPassword]) {
        [XHToast showCenterWithText:@"请检查密码是否一致!"];
        return NO;
    }
    
    BOOL r = [self.password passwordRegular];
    if (!r) {
        [XHToast showCenterWithText:@"密码格式不正确"];
    }
    
    
    return r;
}

//重写验证码判断
-(BOOL)isIdentifyCodeAvailable{
    if ([self.vcode isBlackString]) {
        [XHToast showCenterWithText:@"请检查验证码是否正确!"];
        return NO;
    }
    
    return YES;
}

@end


#pragma -mark ----反馈数据里面的用户信息
@implementation SLReigisterFeedBackUserInfo


@end

#pragma -mark ----登录反馈数据
@implementation SLRegisterFeedBackInfo


//字段映射
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userInfo":@"data"};
}


@end

