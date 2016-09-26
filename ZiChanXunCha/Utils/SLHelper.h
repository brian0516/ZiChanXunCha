//
//  SLHelper.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/14.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^integerBlock)(NSUInteger leftSeconds);
typedef void(^boolBlock)(BOOL finished);

@interface SLHelper : NSObject
/**
 *  倒计时
 *
 *  @param duration        持续的时间
 *  @param leftSecondBlock 还剩的时间block
 *  @param finishBlock     结束的时间block;
 */
+(void)countDownWithDuration:(NSTimeInterval)duration eveySecondBlock:(integerBlock)leftSecondBlock finishBlock:(boolBlock)finishBlock;

@end
