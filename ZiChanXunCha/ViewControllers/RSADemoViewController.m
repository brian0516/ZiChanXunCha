//
//  RSADemoViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/26.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "RSADemoViewController.h"
#import "AES.h"
#import "DES3Util.h"
#import "NSData+AES128.h"

@interface RSADemoViewController ()

@property(nonatomic,assign) id encryptData;

@end

@implementation RSADemoViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    
////    string 转成 char:
////    char mychar[100];
////    NSString * mystring;
////    strcpy(mychar,(char *)[mystring UTF8String]);
////    
////    
////    char 转成 string:
////    NSString *TempString;
////    char mychar[100];
////    mystring=[NSString stringWithFormat:@"%s",mychar];
////    
////    
////    
////    char[]转NSString有更简单的方法，NSString类方法：
////    + (id)stringWithUTF8String:(const char *)bytes。
////    
////    你会用到的！
//    
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    [PPNetworkHelper GET:@"http://192.168.0.190:8080/patrol-web/app/appUser/test.do" parameters:nil success:^(id responseObject) {
//        
//        NSString * keyString = @"!@#$123456";
//        
//        NSString * s = @"8#Å¥5ÇÒ³³|/";
//            char mychar[100];
//            NSString * mystring = @"8#Å¥5ÇÒ³³|/";
//        strcpy(mychar,(char *)[self UnicodeToISO88591:mystring]);
//        
//        
//        NSString * newString = [NSString stringWithFormat:@"%s",mychar];
//        
//        
//        printf("=======%@",newString);
////       NSUTF8StringEncoding
//        
////        DLog(@"成功 = %@",deString);
//        
//        
//    } failure:^(NSError *error) {
//        
//        DLog(@"失败 = %@",error);
//        
//    }];
//
//    
//    
//    
//}


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
}


-(const char *)UnicodeToISO88591:(NSString *)src
{
    NSStringEncoding enc =  CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    return [src cStringUsingEncoding:enc];
}

@end
