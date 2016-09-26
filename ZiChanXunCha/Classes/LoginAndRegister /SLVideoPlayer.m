//
//  SLVideoPlayer.m
//  ZiChanXunCha
//
//  Created by shuanglong on 16/9/9.
//  Copyright © 2016年 shuanglong. All rights reserved.
//

#import "SLVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"

static NSString * const KDownloadFileFolder = @"downloadFileFolder";

@interface SLVideoPlayer ()<UIAlertViewDelegate>{
    
    NSString * _urlString;

}

@property(nonatomic,strong)UIButton * playBtn;
@property(nonatomic,strong)UIImageView * imageView;
@property(nonatomic,strong)UIActivityIndicatorView * activityIndicator;

@end

@implementation SLVideoPlayer

-(instancetype)initWithUrlString:(NSString *)urlString{
    self = [super init];
    if (self){
        _urlString = urlString;
        self.imageView.image = [self thumbnailImageForVideo:[NSURL URLWithString:urlString] atTime:10];
        [self addSubview:self.imageView];
        [self.imageView addSubview:self.playBtn];
    }
    return self;
}

#pragma - mark ----------------Override--------------
-(void)layoutSubviews{
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _playBtn.centerX = _imageView.centerX;
    _playBtn.centerY = _imageView.centerY;
}


#pragma - mark --------privateMethod -------
//获取视频的第一帧图片
- (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time {
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
    
    if(!thumbnailImageRef)
        NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
    
    UIImage*thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage: thumbnailImageRef] : nil;
    
    return thumbnailImage;
}


//下载视频并播放
-(void)downLoadVideo{
    
    //判断当前路径是否有文件
    NSString * videoName = [self fileExist];
    //如果存在则直接播放
    if (videoName != nil) {
    
    //TODO 播放视频回调
        
        DLog(@"播放视频");
        if (self.playVideoBlock) {
            self.playVideoBlock(videoName)
            ;
            self.playBtn.hidden = NO;
            [self.activityIndicator stopAnimating];
        }
        
    }
    //如果不存在,下载完播放
    else{
        __weak typeof(self)weakSelf = self;
        
        [PPNetworkHelper downloadWithURL:KVideoUrlString fileDir:KDownloadFileFolder progress:^(NSProgress *progress) {
            
        } success:^(NSString *filePath) {
            
            weakSelf.playBtn.hidden = NO;
            [weakSelf.activityIndicator stopAnimating];
            [weakSelf downLoadVideo];
            
        } failure:^(NSError *error) {
            
            weakSelf.playBtn.hidden = NO;
            [weakSelf.activityIndicator stopAnimating];

        }];
        
    }
    
}


-(NSString *)filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString * filePath = [docDir stringByAppendingPathComponent:KDownloadFileFolder];
    return filePath;
}


//判断文件是否存在
-(NSString*)fileExist{

    NSString * filePath = [self filePath];
    
    NSFileManager *myFileManager=[NSFileManager defaultManager];
    NSDirectoryEnumerator *myDirectoryEnumerator;
    myDirectoryEnumerator=[myFileManager enumeratorAtPath:filePath];
    
    //列举目录内容，可以遍历子目录
    for (NSString * fileName in myDirectoryEnumerator) {
        if ([fileName hasSuffix:@".mp4"]) {
            
            return [filePath stringByAppendingPathComponent:fileName];
        }
    }
    return nil;
}


#pragma  - mark ----------actions---------------
//播放按钮点击
-(void)playBtnClicked:(UIButton*)sender{
// 1.隐藏播放按钮显示HUD   2.判断网络  3.下载视频  4.创建播放器播放
    
    sender.hidden = YES;
    [self.activityIndicator startAnimating];
    
    //网络判断
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    PPNetworkStatus status = delegate.networkStatus;
    

        switch (status) {
            case  PPNetworkStatusNotReachable:
            {
                UIAlertView * av = [[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
                [av show];
            }
                break;
            case PPNetworkStatusReachableViaWWAN:
            {
                UIAlertView * av = [[UIAlertView alloc]initWithTitle:@"提示" message:@"当前使用的是蜂窝数据网络,是否继续观看?" delegate:self cancelButtonTitle:@"以后再看" otherButtonTitles:@"坚持观看", nil];
                [av show];
                
            }
                break;

            default:{
                [self downLoadVideo];
            }
                break;
        }
    
    
}

#pragma - mark ----------alertViewDelegate----------

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   
    if (buttonIndex == 1) {
    //TODO继续下载
        [self downLoadVideo];
    }
    else{
        self.playBtn.hidden = NO;
        [self.activityIndicator stopAnimating];
    }
}




#pragma -mark ------lazyLoad---------
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.userInteractionEnabled = YES;
    }
    return _imageView;
}

-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [[UIButton alloc]init];
        [_playBtn setImage:[UIImage imageNamed:@"playBtn"] forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"pauseBtn"] forState:UIControlStateSelected];
        _playBtn.size = CGSizeMake(100, 100);
        [_playBtn addTarget:self action:@selector(playBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
 
    }
    return _playBtn;
}

-(UIActivityIndicatorView *)activityIndicator{
    if(!_activityIndicator){
        _activityIndicator = [[UIActivityIndicatorView alloc]init];
        _activityIndicator.centerX = _imageView.centerX;
        _activityIndicator.centerY = _imageView.centerY;
        [_activityIndicator hidesWhenStopped];
        [self addSubview:_activityIndicator];
        
    }
    return _activityIndicator;
}



@end
