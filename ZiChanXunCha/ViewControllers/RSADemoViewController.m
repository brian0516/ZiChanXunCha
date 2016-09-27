//
//  RSADemoViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/26.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "RSADemoViewController.h"
#import "AES.h"

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
    
    
    NSString * key = @"1234567890123456";
    //加密
    NSString * originalText = @"你好啊";
    
    /*
    NSData * textData = [originalText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData * encryptData = [textData AES128EncryptWithKey:key];
    
    NSString * encryptString = [[NSString alloc]initWithData:encryptData encoding:NSUTF8StringEncoding];
    
    NSData * base64Data = [NSData dataWithBase64EncodedString:encryptString];
    
    
    NSString * encryptyString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    
      DLog(@"encryptyString = %@",encryptyString);
    */
    
    NSString * text = @"eQKo0dcHPUqGd7+x635iuIOrUZmpiXXexpx+h+D5FCc=";
    

    NSString * decryptString = [AES sl_DecryptString:text key:key];
    DLog(@"==========解密%@=========",decryptString);
    
    
//    NSString *  encryptString = [AES sl_EncryptString:originalText key:key];
//      DLog(@"==========加密%@=========",encryptString);
    
    
    //使用YYData加密
    
//    NSData * YYData = [textData aes256EncryptWithKey:keyData iv:nil];
//    NSString * YYDataString = [[NSString alloc]initWithData:YYData encoding:NSUTF8StringEncoding];
//    DLog(@"YYDataString = %@",YYDataString);

    
    
    //使用自写方法加密
//    NSData * data = [self encryptText:text];
//    NSString * dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    DLog(@"dataString = %@",dataString);

    //使用AES加密
//    NSString * encryptString = [AESCrypt encrypt:text password:key];
//    DLog(@"===encryptString=== = %@",encryptString);

    
//    NSString * encryptedString = @"baNrf+TJmfx2d/yRvKVPAA==";
//    NSString * decryptString = [AESCrypt decrypt:encryptedString password:key];
//    DLog(@"===decryptString=== = %@",decryptString);

    
    
//    NSString * encryptString = [AESCrypt encrypt:text password:key];
    
    
//       NSString * encryptString = @"STuiTpD09wRHTP5lQNcWkg==";
//    NSData * data = [encryptString dataUsingEncoding:NSUTF8StringEncoding];
//    NSString * de = [AESCrypt decrypt:encryptString password:key];
//    DLog(@"cryptString = %@",cryptString);

//    DLog(@"decryptString = %@",de);
    
}




-(const char *)UnicodeToISO88591:(NSString *)src
{
    NSStringEncoding enc =  CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    return [src cStringUsingEncoding:enc];
}

@end
