//
//  SLMacroDefinition.h
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/7.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#ifndef SLMacroDefinition_h
#define SLMacroDefinition_h


//----------------------------------打印日志-------------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#endif /* SLMacroDefinition_h */


//weakSelf
#define DefineWeakSelf __weak __typeof(self) weakSelf = self




