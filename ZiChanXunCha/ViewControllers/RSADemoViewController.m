//
//  RSADemoViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/26.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "RSADemoViewController.h"
#import "AES.h"
#import "SLSegmentController.h"


@interface RSADemoViewController ()

@property(nonatomic,assign) id encryptData;

@end

@implementation RSADemoViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];

    //根据label反算view
    
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UILabel * label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor greenColor];
    label.numberOfLines = 0;
    label.text = @"首先，玉米籽粒收获对于破解玉米作物机械化生产难题和打通玉米生产全程机械化“最后一公里”意义重大。近年来，在农机购置补贴政策的强力拉动以及各地政府和行业同仁们的共同努力下，我国玉米作物的机械化生产水平持续连年高速发展，截止到2015年末，全国玉米收获机械化率已经接近63%，可以说成绩斐然。然而，相对于95%以上的小麦机收率和接近80%的水稻机收率，玉米的机械化作业水平在三大粮食作物中仍是短板,不仅表现在机械化率这个量化指标上，更大的问题是当前以摘穗剥皮为主流的机械化收获方式还存在着很大的局限性和不经济性。道理非常浅显，从田间收获的玉米棒子既不适宜大规模安全存储，又不能直接进行烘干后归仓储存，要实现谷物颗粒归仓，还需要追加粉碎脱粒、排杂筛选等大量的后续作业。而推广籽粒收获模式刚好弥补了玉米摘穗收获的短板和不足，对于打通玉米全程机械化生产的“最后一公里”意义重大。";
    [view addSubview:label];
    
    UIView * view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor purpleColor];
    [view addSubview:view2];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(10);
        make.left.equalTo(view);
        make.width.equalTo(view);
    }];
    
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.equalTo(view);
        make.width.equalTo(view);
        make.height.equalTo(@(100));

    }];
    
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(100);
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
        make.bottom.equalTo(view2.mas_bottom).offset(10);
        
        
    }];
    
    
    
    
    
    
    
    


}




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




//-(void)viewDidLoad{
//    [super viewDidLoad];
//    
//    
//    NSString * key = @"1234567890123456";
//    //加密
//    NSString * originalText = @"你好啊";

    /*
    NSData * textData = [originalText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData * encryptData = [textData AES128EncryptWithKey:key];
    
    NSString * encryptString = [[NSString alloc]initWithData:encryptData encoding:NSUTF8StringEncoding];
    
    NSData * base64Data = [NSData dataWithBase64EncodedString:encryptString];
    
    
    NSString * encryptyString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    
      DLog(@"encryptyString = %@",encryptyString);
    */
    
//    NSString * text = @"eQKo0dcHPUqGd7+x635iuIOrUZmpiXXexpx+h+D5FCc=";
//    
//
//    NSString * decryptString = [AES sl_DecryptString:text key:key];
//    DLog(@"==========解密%@=========",decryptString);
    
    
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
    
//}




-(const char *)UnicodeToISO88591:(NSString *)src
{
    NSStringEncoding enc =  CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    return [src cStringUsingEncoding:enc];
}

@end
