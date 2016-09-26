//
//  SLVideoPlayer.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/9.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^StringBlock)(NSString * videoPath);

@interface SLVideoPlayer : UIView

@property(nonatomic ,copy)StringBlock(playVideoBlock);

/**
 *  播放网络视频
 *
 *  @param urlString 视频地址字符串
 *
 *  @return 返回self
 */
-(instancetype)initWithUrlString:(NSString *)urlString;



@end
