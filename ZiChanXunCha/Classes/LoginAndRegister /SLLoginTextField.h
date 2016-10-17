//
//  SLLoginTextField.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/24.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SLLoginTextFieldStyle)
{
    SLLoginTextFieldStyleDefault = 0,
    SLLoginTextFieldCorner = 1,
};


typedef void(^buttonBlock)();

@interface SLLoginTextField : UIView

@property(nonatomic,assign)UIKeyboardType  keyboardType;

@property(nonatomic,assign)UIReturnKeyType  returnType;

@property (nonatomic,assign) BOOL secureTextEntry;

@property (nonatomic,copy) buttonBlock(buttonBlock);

@property (nonatomic,strong)NSString * contentText;

@property(nonatomic,assign)id<UITextFieldDelegate>delegate;

@property(nonatomic,strong)void(^returnButtonClick)();

@property(nonatomic,strong)void(^textFieldDidEndEditingBlock)(NSString*string);


/**
 *  初始化
 *
 *  @param image    顶端的视图
 *  @param title    title文字
 *  @param subImage 尾部的视图
 *
 *  @return self
 */
-(instancetype)initWithStyle:(SLLoginTextFieldStyle)style PreFixImage:(UIImage*)image placeholder:(NSString*)placeholder subFixImages:(NSArray*)subImages;

@end
