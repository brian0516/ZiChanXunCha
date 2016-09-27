//
//  AES.h
//  AES128
//
//  Created by shuanglong on 16/9/27.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AES : NSObject

+(NSString*)sl_EncryptString:(NSString*)message key:(NSString*)key;

+(NSString*)sl_DecryptString:(NSString*)message key:(NSString*)key;


@end
