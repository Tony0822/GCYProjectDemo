//
//  TimerViewController.m
//  GCYDemo
//
//  Created by gewara on 17/7/3.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "TimerViewController.h"
#import "LoopScrollView.h"

@interface TimerViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        LoopScrollView *loopView = [LoopScrollView loopImageViewWithFrame:CGRectMake(10, 20, CGRectGetWidth(self.view.bounds)-20, 200) isHorizontal:NO];
        loopView.imgResourceArr = @[@"car1.jpg",@"car2.jpg",@"car3.jpg",@"car4.jpg",@"car5.jpg"];
        
        loopView.tapClickBlock = ^(LoopScrollView *loopView){
            NSString *message = [NSString stringWithFormat:@"老%ld被点啦",(long)loopView.currentIndex+1];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"大顺啊" message:message delegate:self cancelButtonTitle:@"love you" otherButtonTitles:nil, nil];
            [alert show];
        };
        [self.view addSubview:loopView];
    }
    {
        LoopScrollView *loopView = [LoopScrollView loopImageViewWithFrame:CGRectMake(10, 300, CGRectGetWidth(self.view.bounds)-20, 200) isHorizontal:YES];
        loopView.imgResourceArr = @[@"http://img05.tooopen.com/images/20150202/sy_80219211654.jpg",
                                    @"http://img06.tooopen.com/images/20161123/tooopen_sy_187628854311.jpg",
                                    @"http://img07.tooopen.com/images/20170306/tooopen_sy_200775896618.jpg",
                                    @"http://img06.tooopen.com/images/20170224/tooopen_sy_199503612842.jpg",
                                    @"http://img02.tooopen.com/images/20160316/tooopen_sy_156105468631.jpg"];
        loopView.tapClickBlock = ^(LoopScrollView *loopView){
            NSString *message = [NSString stringWithFormat:@"老%ld被点啦",(long)loopView.currentIndex+1];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"大顺啊" message:message delegate:self cancelButtonTitle:@"love you" otherButtonTitles:nil, nil];
            [alert show];
        };
        [self.view addSubview:loopView];
    }
    {
        LoopScrollView *loopView = [LoopScrollView loopTitleViewWithFrame:CGRectMake(10, 550, CGRectGetWidth(self.view.bounds)-20, 50) isTitleView:YES titleImgArr:@[@"home_ic_new",@"home_ic_hot",@"home_ic_new",@"home_ic_new",@"home_ic_hot"]];
        loopView.titlesArr = @[@"这是一个简易的文字轮播",
                               @"This is a simple text rotation",
                               @"นี่คือการหมุนข้อความที่เรียบง่าย",
                               @"Это простое вращение текста",
                               @"이것은 간단한 텍스트 회전 인"];
        loopView.tapClickBlock = ^(LoopScrollView *loopView){
            NSString *message = [NSString stringWithFormat:@"老%ld被点啦",(long)loopView.currentIndex+1];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"大顺啊" message:message delegate:self cancelButtonTitle:@"love you" otherButtonTitles:nil, nil];
            [alert show];
        };
        [self.view addSubview:loopView];
    }

}

/*
- (instancetype)init {
    self = [super init];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(testTimer:) userInfo:nil repeats:YES];
    }
    return self;
    
}
- (void)testTimer:(NSTimer *)timer {
    D_Log(@"---haha---");
}
- (void)dealloc {
        // 自欺欺人的写法，永远都不会执行到，除非你在外部手动invalidate这个timer
    [_timer invalidate];

}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
