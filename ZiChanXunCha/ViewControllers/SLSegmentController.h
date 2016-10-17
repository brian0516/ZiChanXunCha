//
//  SLSegmentController.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/29.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLSegmentController;

@protocol SLSegmentControllerDelegate <NSObject>

@optional

-(void)segment:(SLSegmentController*)seg didSelectedAtIndex:(NSInteger)index;

@end

@interface SLSegmentController : UIView

@property(nonatomic,assign)id<SLSegmentControllerDelegate>delegate;

@property(nonatomic,assign,readonly)NSInteger itemCount;

-(instancetype)initWithTitles:(NSArray*)titles;

-(void)upDateIndicatorConstrait:(CGFloat)indicatorX animate:(BOOL)animate;

-(void)setSelectedIndex:(NSInteger)selectedIndex;

//设置角标
-(void)setBadgeValue:(NSInteger)value atIndex:(NSInteger)index;



@end
