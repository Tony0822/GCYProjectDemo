//
//  NetWorkingViewController.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/10.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "NetWorkingViewController.h"

static NSString *const bigPic = @"http://image.baidu.com/search/detail?ct=503316480&z=undefined&tn=baiduimagedetail&ipn=d&word=%E4%BA%BA%E4%BD%93%E6%A8%A1%E7%89%B9&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=undefined&cs=2042862249,3783832730&os=3601947425,3304158120&simid=0,0&pn=2&rn=1&di=42033631440&ln=1302&fr=&fmq=1523339801248_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&is=0,0&istype=0&ist=&jit=&bdtype=13&spn=0&pi=0&gsm=0&hs=2&objurl=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F5366d0160924ab18778421c43ffae6cd7a890bb7.jpg&rpstart=0&rpnum=0&adpicid=0";
static NSString *const smallPic = @"http://small.png";


@interface NetWorkingViewController ()<NSURLSessionDelegate, NSURLSessionDataDelegate, NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSMutableData *data;



@end

@implementation NetWorkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *customBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    customBtn.backgroundColor = [UIColor redColor];
    [customBtn setTitle:@"click me" forState:UIControlStateNormal];
    [customBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [customBtn addTarget:self action:@selector(customBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:customBtn];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, customBtn.bottom + 20, self.view.width - 20, self.view.height - 150)];
    self.imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.imageView];
    
    
//    1.发送一个网络请求，需要创建一个NSURLSession
//    新建一个NSURLSession又要创建一个NSURLSessionConfiguration， 并且还需要一些代理方法
//    同时还要一个NSURLSessionDataTask 
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"www.github.com/Tony0822/"]];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];


}

- (void)customBtnClick:(UIButton *)sender {
    [self requestDataTask];
}
- (void)clear {
    self.imageView.image = nil;
}
- (void)requestDataTask {
    [self clear];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:bigPic]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    
    
    [dataTask resume];
}

- (void)requestDownloadTest {
    [self clear];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:bigPic]];
    NSURLSessionDownloadTask *dataTask = [session downloadTaskWithRequest:request];
    
    [dataTask resume];
}

/**
 Block的NSURLSession的使用
 */
- (void)requestBlockTaskTest {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@""]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *image = [[UIImage alloc] initWithData:data];
        self.imageView.image = image;
    }];
    [dataTask resume];
}

#pragma mark =====NSURLSessionDelegate====

//当一个session遇到系统错误或者未检测到的错误的时候，就会调用这个方法。
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error {
    NSLog(@"%@", error);
}
//当请求需要认证、或者https证书认证的时候，我们就需要在这个方法里面处理。
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
    NSLog(@"%@", completionHandler);
}
//如果应用进入后台、这个方法会被调用。我们在这里可以对session发起的请求做各种操作比如请求完成的回调等。
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    NSLog(@"%@", session);
}

#pragma mark =====NSURLSessionDelegate====
#pragma mark =====NSURLSessionDelegate====
#pragma mark =====NSURLSessionDelegate====























































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
