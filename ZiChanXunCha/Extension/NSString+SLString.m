//
//  NSString+SLString.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/14.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "NSString+SLString.h"

@implementation NSString (SLString)

-(BOOL)isBlackString{

    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;

}


-(BOOL)telephoneRegular{
    
    NSString * regex = @"^1(([3,8][0-9]{9})|(4[5,7][0-9]{8})|(5[0,1,2,3,5,6,7,8,9][0-9]{8})|(7((0[0,5,9][0-9]{7})|([6-8][0-9]{8}))))$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}


-(BOOL)passwordRegular{
    
    NSString * regex = @"^[@A-Za-z0-9|!|#|$|%|^|&|*|.|~]{6,18}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}



@end
