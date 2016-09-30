//
//  testModel.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/30.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface testModel : NSObject

@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * phoneNumber;
@property(nonatomic)BOOL selected;

-(instancetype)initWithNotificationName:(NSString*)name;


@end
