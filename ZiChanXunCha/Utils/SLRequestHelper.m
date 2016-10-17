//
//  SLRequestHelper.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/10/9.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLRequestHelper.h"
#import "AES.h"

static NSString * const AESKey = @"!@#$%12345678901";

@implementation SLRequestHelper

+(NSDictionary*)parametersFromModel:(id)model{
    NSDictionary * parameters = nil;
    if (!model || model == nil) {
        return parameters;
    }
    NSString * jsonString = [model modelToJSONString];
    NSString * encryptJsonString = [AES sl_EncryptString:jsonString key:AESKey];
    if (encryptJsonString!=nil) {
        parameters = @{@"data":encryptJsonString};
    }
    return parameters;
}


+(NSString*)responseString:(id)obj{
    NSString * responseString = nil;
    if (![obj isKindOfClass:[NSData class]]) {
        return responseString;
    }
    
    NSString * s = [(NSData*)obj utf8String];
    responseString = [AES sl_DecryptString:s key:AESKey];
    
    return responseString;
}


+(NSDictionary*)responseDictionary:(id)obj{
    
    NSDictionary * dictionary = nil;
    NSString * responseString = [SLRequestHelper responseString:obj];
    dictionary = [responseString jsonValueDecoded];
    return dictionary;
}


@end
