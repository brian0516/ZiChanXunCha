//
//  NSString+SLString.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/14.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SLString)

/**
 *  判断是不是空字符串
 *
 *  @return
 */
-(BOOL)isBlackString;


/**
 *  判断电话号码是否符合要求
 *
 *  @return
 */
-(BOOL)telephoneRegular;



/**
 *  判断密码是否是6位以上的数字或者字母
 *
 *  @return 
 */
-(BOOL)passwordRegular;


@end
