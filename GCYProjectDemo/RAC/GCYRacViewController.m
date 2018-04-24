//
//  GCYRacViewController.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/23.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "GCYRacViewController.h"
//#import <RACSignal.h>
//#import <RACSubscriber.h>
//#import <RACDisposable.h>
//#import <RACSubject.h>
//#import <RACReplaySubject.h>
#import <ReactiveCocoa.h>

@interface YellowView ()
- (void)btnClick;

@end

@implementation YellowView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        btn.backgroundColor = [UIColor orangeColor];
        [btn setTitle:@"click" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)btnClick {
    NSLog(@"点击了button");
}

@end

@interface GCYRacViewController ()

@property (nonatomic, strong) YellowView *yellowView;

@end

@implementation GCYRacViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createRACSignal];
//    [self createRACDisposable];
//    [self createRACSubject];
    [self createButton];
}
#pragma mark -- 基本用法
- (void)createButton {
    self.yellowView = [[YellowView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:self.yellowView];
    [[self.yellowView rac_signalForSelector:@selector(btnClick)] subscribeNext:^(id x) {
        NSLog(@"我响应了");
        NSLog(@"%@",x);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.yellowView.frame = CGRectMake(50, 50, 200, 200);
}


#pragma mark -- RACSubject/RACReplaySubject
- (void)createRACSubject {
//    1.创建信号，
    RACSubject *subject = [RACSubject subject];
    
    // 先订阅，才能发送
    [subject sendNext:@"我是不会发送出去的"];
    
//    2.订阅信号
    [subject subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
//    3.发送数据
    [subject sendNext:@"发送数据"];
    
    
    RACReplaySubject *replaySubject = [RACReplaySubject subject];
    [replaySubject sendNext:@"我不订阅也能发送啊"];
    [replaySubject subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    
}

#pragma mark -- RACDisposable
- (void)createRACDisposable {
    // 1.创建信号量
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"创建信号量");
        
        //3.发布信息
        [subscriber sendNext:@"我发布了一条消息"];
        NSLog(@"那我啥时间运行呢");
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"disposalbe");
        }];
    }];
//    2.订阅信号量
   RACDisposable *disposable = [signal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    
    //主动触发取消订阅
    [disposable dispose];
}
#pragma mark -- RACSignal
/**
 创建RACSignal三部曲
 1.创建信号
 2.订阅信号
 3.发送信息
 */
- (void)createRACSignal {
//    1.创建信号量
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"创建信号量");
        
//        3.发布信息
        [subscriber sendNext:@"i am send next data"];
        NSLog(@"那我啥时间运行");
        return nil;
        
    }];
    
//    2.订阅信号量
    [signal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}





















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
