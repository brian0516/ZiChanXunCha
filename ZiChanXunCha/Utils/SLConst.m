//
//  SLConst.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/7.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>




#ifdef DEBUG
NSString * const KBaseUrl = @"http://192.168.0.190:8080/patrol-web/";
#else
NSString * const KBaseUrl = @"";
#endif

NSString * const KGetVcodeUrlString = @"app/appUser/getVcode.action";

NSString * const KRegisterUrlString = @"app/appUser/userRegister.action";

NSString * const KLoginUrlString = @"app/appUser/userLoginPass.action";


//--------
NSString * const KVideoUrlString  = @"http://oaundxu29.bkt.clouddn.com/Ferr2DTerrainunity3d.mp4";

NSString * const KUrl_UserRegister = @"app/appUser/userRegister.do";
