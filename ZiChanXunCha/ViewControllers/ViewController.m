//
//  ViewController.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/7.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "ViewController.h"
//#import <AVFoundation/AVFoundation.h>
//#import "SLLoginAndRegisterRequest.h"
//#import <Security/Security.h>
//#import "AppDelegate.h"
//#import <objc/runtime.h>



static NSString *const dataUrl = @"http://api.douban.com/v2/movie/top250?apikey=02d830457f4a8f6d088890d07ddfae47";


static NSString* testPrivateKeyPem = @"-----BEGIN PRIVATE KEY-----\
MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAL8VQpM6fdMV21Wa\
lERf933AWzNGGndab3Jdw1R1+MW4hq7oqH/5GJ7YmNBA637zU4jTTzPv+NGO7+tk\
mHYgyaDB/7NE2509WvoSBq0yrWqsNCq16OgExJvtlb5Q9Bt9mFbsirz1tIHmGc8I\
6iOv01O5nD+qgmmC17CCu9UegaBnAgMBAAECgYA9JaSEULdrERd7MVg4+SzNxPxq\
UAiwIPSA+JhFMutE+mO/HRyutxu12UItgljZ6yvUISq7SBOrm74S6cIQKzXZ+UnT\
wYLs9Y57zMeowYuQ+M9x6C9x7aaqpzzfBQ6yVjFzQenWqbSPLh3X+eN7ZGJpDcOz\
MvnXdXecX2Ox42gEYQJBAPddsSrzRtYCkKRtLwgdcd3z6DA4mwT1jUXhjTuGbZEU\
f8zjaimV0f85uvLsbpk3djzVLBY4Ain9vjaA4MaIHwsCQQDFwKiof59L6VBXDFCx\
kKxvhYMf9yv6k7qNPtU3cJ3M1DEenWeN7Htt0hag0BZadNW4xt6RvSqQ3gaGPGdX\
nA2VAkB/gx2LzWIreaEEEYBYB42l41BCYzuN3+JWLoG2OIKMceu7O1ODYkag8Sps\
hPIyKwPZMe4K+g4rhTCjOeYkkRCnAkBxe2sOLxbSMFT7b0TLcVOTOBIUgPqK9MXk\
kn83LnhP+CEsCXZIusHmNt7ncCKzzEJtpCpLhjvsII2r8PP5EcO1AkA4RA3aoQbY\
RlQ7GXeQjsH6erpyOIWBYbQg34T2Zr+D/BkQUTLawoozDhUSdTtMqC5cdYV3ICXl\
pFpgnvqP7ASJ\
-----END PRIVATE KEY-----";

static NSString* testPublicKeyPem = @"-----BEGIN PUBLIC KEY-----\
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/FUKTOn3TFdtVmpREX/d9wFsz\
Rhp3Wm9yXcNUdfjFuIau6Kh/+Rie2JjQQOt+81OI008z7/jRju/rZJh2IMmgwf+z\
RNudPVr6EgatMq1qrDQqtejoBMSb7ZW+UPQbfZhW7Iq89bSB5hnPCOojr9NTuZw/\
qoJpgtewgrvVHoGgZwIDAQAB\
-----END PUBLIC KEY-----";


@interface ViewController ()

@property (nonatomic ,strong) UIButton * btn;

@property(nonatomic,retain) NSData*     encryptData;

@property(nonatomic,retain) NSString*   privateKeyPem;
@property(nonatomic,retain) NSString*   publicKeyPem;

@property (nonatomic,assign) BOOL isEncrypt;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];

 

    
    
    
    [PPNetworkHelper GET:@"http://192.168.0.190:8080/patrol-web/app/appUser/test.do" parameters:nil success:^(id responseObject) {
        


//        DLog(@"解密1 = %@,解密2 = %@",decreyptData,astring);
//
//        NSData * d = [RSA decryptData:encWithPrivKey privateKey:privkey];
//        　NSString *aString = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
//          NSLog(@"aString: %@", aString);
        
    } failure:^(NSError *error) {
        
          DLog(@"失败 = %@",error);
        
    }];

//    [RSA decryptString:encWithPrivKey privateKey:privkey];
   
    
//    NSString * string = [NSString stringWithFormat:@"老师的解放路口可视对讲"];
//    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
  
//    DLog(@"data = %@",data);
    
//    NSError* error = nil;
//    NSString* privateKeyPemFile = [[NSBundle mainBundle]pathForResource:@"privatekeyfile" ofType:@"key"];
//    _privateKeyPem = [NSString stringWithContentsOfFile:privateKeyPemFile encoding:NSUTF8StringEncoding error:&error];
//    
//    if(error)
//    {
//        NSLog(@"error:%@",error.localizedDescription);
//    }
//    
//    NSString* publicKeyPemFile = [[NSBundle mainBundle]pathForResource:@"pubkeyfile" ofType:@"key"];
//    _publicKeyPem = [NSString stringWithContentsOfFile:publicKeyPemFile encoding:NSUTF8StringEncoding error:&error];
//    
//    if(error)
//    {
//        NSLog(@"error:%@",error.localizedDescription);
//    }
//
//    
//    
    
    
    
    
//-----------------------------网络-------------------------------------
//    [PPNetworkHelper GET:dataUrl parameters:nil responseCache:^(id responseCache) {
//        
//        NSLog(@"缓存 : %@",responseCache);
////        self.cacheData.text = [self jsonToString:responseCache];
//        
//    } success:^(id responseObject) {
//        
//        NSString * text = [self jsonToString:responseObject];
//        
//        DLog(@"%@",text);
//        
//    } failure:^(NSError *error) {
//        
//    }];

//-----------------------------视频-------------------------------------
//    UIImage * i = [self thumbnailImageForVideo:[NSURL URLWithString:@"http://mpv.videocc.net/4559da324b/0/4559da324b6c813324a2289f59baaa40_1.mp4"] atTime:0];
//    
//    UIImageView * iv = [[UIImageView alloc]initWithImage:i];
//    
//    iv.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    [self.view addSubview:iv];
 //-----------------------------布局-------------------------------------
    
    
    //---------------------YYLabel----------------------
    
    
//    YYLabel * l = [[YYLabel alloc]init];
//    l.frame = CGRectMake(100, 100, 100, 100);
//    l.numberOfLines = 2;
//    l.text = @"12345678901234567890123";
//    l.backgroundColor = [UIColor redColor];
//    [self.view addSubview:l];
    
    
    
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [btn setTitle:@"测试" forState:UIControlStateNormal];
//    [btn setBackgroundColor:[UIColor colorWithRed:0.3 green:0.8 blue:0.6 alpha:1]];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    btn.frame = CGRectMake(0, 0, 100, 50);
//    btn.center = self.view.center;
//    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//    btn.layer.cornerRadius = 5.0f;
//    [self.view addSubview:btn];
//    self.btn = btn;
    
}


-(void)test{
    
    
//    if (!self.isEncrypt) {
//        //准备原始数据
//    NSString* originString = @"Hello VKRSA";
//    NSData* originData = [originString dataUsingEncoding:NSUTF8StringEncoding];
//    
//    //准备公钥
//    NSError* error = nil;
//    SecKeyRef publicKey = [VKRSAKeyHelper publicKeyOfPem:_publicKeyPem error:&error];
//    if(error || publicKey == nil)
//    {
//        NSLog(@"omg,there is an error :%@",error?error.localizedDescription:@"public key fail");
//        return ;
//    }
//    
//    _encryptData = [VKRSA encryptData:originData withKey:publicKey];
//        self.isEncrypt = !self.isEncrypt;
//    }
//    else{
//    
//        //准备私钥
//        NSError* error = nil;
//        SecKeyRef privateKey = [VKRSAKeyHelper privateKeyOfPem:_privateKeyPem error:&error];
//        if(error || privateKey==nil)
//        {
//            NSLog(@"omg,there is an error :%@",error ?error.localizedDescription:@"private key fail");
//            return ;
//        }
//        
//        NSData* originData = [VKRSA decryptData:_encryptData withKey:privateKey];
//        if(originData!=nil)
//        {
//            NSString* orginString = [[NSString alloc]initWithData:originData encoding:NSUTF8StringEncoding];
//            NSLog(@"decrypt ok,and orgin string is :%@",orginString);
//        }else{
//            NSLog(@"omg,there is an error during decrpting,but i dont' know why");
//        }
//
//        
//        self.isEncrypt = !self.isEncrypt;
//        
//    }
    
}

/*
-(void)test{


    UIApplication * application = [UIApplication sharedApplication];
    AppDelegate * delegate = application.delegate;
    
    [delegate loginSuccess];

}
*/
 
 
 
/*
//keyChain
-(void)test{

    
    YYKeychainItem * item = [[YYKeychainItem alloc]init];
    item.account = @"18911189514";
    item.password = @"qqqqqq";
    
    [YYKeychain insertItem:item];
    
    NSString * pass = [YYKeychain getPasswordForService:@"123" account:@"18911189514"];
    
    DLog(@"pas = %@",pass);
    

}
*/



//接口测试

/*
-(void)test{
//!!! 以机手查询为例 http://api.nongjibang.com:7080/dudriver/query.do page=1&limit=5&ordering=10
    
    NSDictionary * parameters = @{
                                  @"page":@"1",
                                  @"limit":@"5",
                                  @"ordering":@"10",
                                  };
    

    
    NSString * urlString = @"http://api.nongjibang.com:7080/dudriver/query.do";
    
    
    
    [PPNetworkHelper GET:urlString parameters:parameters success:^(id responseObject) {
        
        DLog(@"嘟嘟作业 = %@",responseObject);
        
        
    } failure:^(NSError *error) {
        
        
        
    }];
    
}
*/


/*
//测试注册
-(void)test{
    [SLRegisterModel defaultInstance].mobile = @"13900010001";
    [SLRegisterModel defaultInstance].password = @"qqqqqq";
    [SLRegisterModel defaultInstance].confirmPassword = @"qqqqqq";
    [SLRegisterModel defaultInstance].verify = @"2342";

    
    BOOL isAvailable = [[SLRegisterModel defaultInstance] isInfoAvailable];
    
    if (!isAvailable) {
        [XHToast showCenterWithText:@"信息有误"];
        return;
    }
    
    
    [[SLLoginModel defaultInstance] requestWithBlock:^(BOOL success, SLRegisterFeedBackInfo *registerFeedBackInfo) {
        
        if (success) {
            DLog(@"1==%@,2==%@,3==%@,4==%@",registerFeedBackInfo.code,registerFeedBackInfo.msg,registerFeedBackInfo.userInfo.tokenStr,registerFeedBackInfo.userInfo.loginId);
        }
        
        else{
            [XHToast showCenterWithText:@"网络请求失败"];
        }
        
    }];

}
*/
 
 
//倒数
/*
-(void)test{

    DLog(@"开始倒数")
    self.btn.userInteractionEnabled = NO;
    
    [SLHelper countDownWithDuration:10 eveySecondBlock:^(NSUInteger leftSeconds) {
        
        DLog(@"剩余时间 = %lu",(unsigned long)leftSeconds);
        self.btn.userInteractionEnabled = YES;
        [self.btn setTitle:@"测试" forState:UIControlStateNormal];
        
        
    } finishBlock:^(BOOL finished) {
        DLog(@"结束");
        self.btn.userInteractionEnabled = YES;
        [self.btn setTitle:@"测试" forState:UIControlStateNormal];

    }];
}
*/

//登录测试
/*
-(void)test{
    
    [SLLoginModel defaultInstance].mobile = @"18911189514";
    [SLLoginModel defaultInstance].password = @"ls@#$jloijoiwj2ewe";
//    [SLLoginModel defaultInstance].confirmPassword = @"qqqqqqq";
//    [SLLoginModel defaultInstance].verify = @"123";
    
    BOOL isAvailable = [[SLLoginModel defaultInstance] isInfoAvailable];
    
    if (!isAvailable) {
        [XHToast showCenterWithText:@"信息有误"];
        return;
    }
    
    
    [[SLLoginModel defaultInstance] requestWithBlock:^(BOOL success, SLRegisterFeedBackInfo *registerFeedBackInfo) {
        
        if (success) {
            DLog(@"1==%@,2==%@,3==%@,4==%@",registerFeedBackInfo.code,registerFeedBackInfo.msg,registerFeedBackInfo.userInfo.tokenStr,registerFeedBackInfo.userInfo.loginId);
        }
        
        else{
            [XHToast showCenterWithText:@"网络请求失败"];
        }
        
    }];
    
}
*/



//-----获取视频第一帧图片
//iOS开发之视频根据url获取第一帧图片,获取任一帧图片
//标签： AVURLAsset第一帧图片视频第一帧图片AVAssetImageGenerato
//2016-06-03 14:54 656人阅读 评论(6) 收藏 举报
//分类： Object_c（45）
//版权声明：本文为博主原创文章，未经博主允许不得转载。
//
//[objc] view plain copy 在CODE上查看代码片派生到我的代码片



//- (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time {
//    
//    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
//    NSParameterAssert(asset);
//    AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
//    assetImageGenerator.appliesPreferredTrackTransform = YES;
//    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
//    
//    CGImageRef thumbnailImageRef = NULL;
//    CFTimeInterval thumbnailImageTime = time;
//    NSError *thumbnailImageGenerationError = nil;
//    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
//    
//    if(!thumbnailImageRef)
//        NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
//    
//    UIImage*thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage: thumbnailImageRef] : nil;
//    
//    return thumbnailImage;
//}





/**
 *  json转字符串
 */
- (NSString *)jsonToString:(NSDictionary *)dic
{
    if(!dic){
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}



/* 获取对象的所有属性和属性内容 */
- (NSDictionary *)getAllPropertiesAndVaules
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties =class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}
/* 获取对象的所有属性 */
- (NSArray *)getAllProperties
{
    u_int count;
    
    objc_property_t *properties  =class_copyPropertyList([UIButton class], &count);
    
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    
    free(properties);
    
    return propertiesArray;
}
/* 获取对象的所有方法 */
-(void)getAllMethods
{
    unsigned int mothCout_f =0;
    Method* mothList_f = class_copyMethodList([self class],&mothCout_f);
    for(int i=0;i<mothCout_f;i++)
    {
        Method temp_f = mothList_f[i];
        IMP imp_f = method_getImplementation(temp_f);
        SEL name_f = method_getName(temp_f);
        const char* name_s =sel_getName(method_getName(temp_f));
        int arguments = method_getNumberOfArguments(temp_f);
        const char* encoding =method_getTypeEncoding(temp_f);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,
              [NSString stringWithUTF8String:encoding]);
    }
    free(mothList_f);
}


-(void)getIvarName
{
    u_int count = 0;
    //拷贝出所有的成员变量的列表
    Ivar *ivars =class_copyIvarList([UIButton class], &count);
    for (int i =0; i<count; i++) {
        //取出成员变量
        Ivar var = *(ivars + i);
    
        //打印成员变量名字
        NSLog(@"%s",ivar_getName(var));
        
        
        
    }
    
    //释放
    free(ivars);
}


@end
