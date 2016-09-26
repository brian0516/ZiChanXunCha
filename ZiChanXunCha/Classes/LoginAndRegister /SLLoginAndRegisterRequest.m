//
//  SLLoginAndRegisterRequest.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/14.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLLoginAndRegisterRequest.h"

@implementation SLLoginAndRegisterRequest


-(void)requestWithBlock:(registerFeedBackBlock)feedBackBlock{
    
    //将model转为json
    
    NSDictionary * paratmeters = [self modelToJSONObject];
    
    /*
    [PPNetworkHelper POST:KUrl_UserRegister parameters:paratmeters success:^(id responseObject) {
        
        SLRegisterFeedBackInfo * feedBackInfo = [SLRegisterFeedBackInfo modelWithJSON:responseObject];
        
        if (feedBackBlock) {
            feedBackBlock(YES,feedBackInfo);
        }
        
        
    } failure:^(NSError *error) {
        if (feedBackBlock) {
            feedBackBlock(NO,nil);
        }
    }];
    
    */
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataNamed:@"RegisterFeedBack.json"];
        SLRegisterFeedBackInfo * feedBackInfo = [SLRegisterFeedBackInfo modelWithJSON:data];
        
        if (feedBackBlock) {
            feedBackBlock(YES,feedBackInfo);
        }
        
    });
     

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
            return NO;
        }
    return [self.password passwordRegular];
}

//重写验证码判断
-(BOOL)isIdentifyCodeAvailable{
    if ([self.verify isBlackString]) {
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

