//
//  SLRequestHelper.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/9.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLRequestHelper : NSObject


/**
 提交数据时将参数加密
 
 @param model NSDictionary类型或者model类型 ,依赖YYModel将model转string
 
 @return 可用的参数NSDictionary类型,或者nil;
 */
+(NSDictionary*)parametersFromModel:(id)model;




/**
 将接收到的数据解密,转为jsonString
 
 @param obj NSData
 
 @return jsonString;
 */
+(NSString*)responseString:(id)obj;




/**
 将接收到的数据解密,转为NSDictionary;
 
 @param obj NSData
 
 @return jsonString;
 */
+(NSDictionary*)responseDictionary:(id)obj;


@end
