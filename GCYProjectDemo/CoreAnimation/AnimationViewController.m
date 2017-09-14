//
//  AnimationViewController.m
//  GCYDemo
//
//  Created by gewara on 17/6/27.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "AnimationViewController.h"
#import "Quartz2DView.h"
#import "RunloopViewController.h"
#import "CAShapeLayerAndTextLayerView.h"
#import "LyricLabel.h"

@interface AnimationViewController ()
@property (nonatomic, strong) UIImageView *imgV;
@property (nonatomic) CADisplayLink *timerInC;
@property (nonatomic) NSTimer *timerInN;
@property (nonatomic) dispatch_source_t timerInG;
@property (nonatomic, assign) BOOL nsTimerResume;
@property (nonatomic, assign) BOOL gcdTimerResume;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) Quartz2DView *quartView;
@property (nonatomic, strong) CAShapeLayerAndTextLayerView *shapeLayerView;

@end

@implementation AnimationViewController

- (void)viewWillAppear:(BOOL)animated {
    //  [self initTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testCABasicAnimation];
//    [self testCAKeyframeAnimation];
//    [self testCAAnimationGroup];
//    [self testCATransition];
//    [self testCADisplayLink];
//    [self testQuartz2DView];
//    [self testNSTimer];
//    [self testCAShapeLayerAndTextLayer];
    //[self testLyricLabel];
    [self testCATransform3D];
}
#pragma markCATransform3D
- (void)testCATransform3D {
    CALayer *staticLayerA = [CALayer layer];
    staticLayerA.bounds = CGRectMake(0, 0, 100, 100);
    staticLayerA.position = CGPointMake(self.view.centerX - 75, self.view.centerY - 100);
    staticLayerA.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:staticLayerA];
    
    CATransform3D transA = CATransform3DIdentity;
    transA.m34 = -1.0 / 500;
    transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
    staticLayerA.transform = transA;
    
}
#pragma mark - LyricLabel
- (void)testLyricLabel {

    LyricLabel *lyric = [[LyricLabel alloc] initWithString:@"哟啊呀呦，啊呀呦 啊哟啊呀呦，啊呀呦 啊哟" font:[UIFont fontWithName:@"PingFangSC-Semibold" size:10] widthLimit:0 heightLimit:100];
    lyric.backgroundColor = [UIColor yellowColor];
    lyric.tintColor = [UIColor redColor];
    lyric.trackTintColor = [UIColor greenColor];
    lyric.center = self.view.center;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [lyric updateLocation:10 duration:3];
    });
    
    [self.view addSubview:lyric];
}

#pragma mark - CAShapeLayerAndTextLayer
- (void)testCAShapeLayerAndTextLayer {
    [self.view addSubview:self.shapeLayerView];
}
- (CAShapeLayerAndTextLayerView *)shapeLayerView {
    if (!_shapeLayerView) {
        _shapeLayerView = [[CAShapeLayerAndTextLayerView alloc] initWithFrame:self.view.bounds];
        _shapeLayerView.backgroundColor = [UIColor whiteColor];
    }
    return _shapeLayerView;
}
#pragma  mark - Quartz2D 
- (void)testQuartz2DView {
    [self.view addSubview:self.quartView];
}
- (Quartz2DView *)quartView {
    if (!_quartView) {
        _quartView = [[Quartz2DView alloc] initWithFrame:self.view.bounds];
        _quartView.backgroundColor = [UIColor whiteColor];
    }
    return _quartView;
}
#pragma mark - NSTimer 
- (void)initTimer {
    ///target selector 模式初始化一个实例
    self.timerInC = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeImg)];
    ///暂停
    self.timerInC.paused = YES;
    ///selector触发间隔
    self.timerInC.frameInterval = 2;
    ///加入一个runLoop
    [self.timerInC addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    self.timerInN = [NSTimer timerWithTimeInterval:0.032 target:self selector:@selector(changeImg) userInfo:nil repeats:YES];
    self.timerInN.fireDate = [NSDate distantFuture];
    self.nsTimerResume = YES;
    [[NSRunLoop currentRunLoop] addTimer:self.timerInN forMode:NSDefaultRunLoopMode];
    self.gcdTimerResume = YES;

}
- (void)testNSTimer {
    self.view.backgroundColor = [UIColor grayColor];
    
    self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imgV.contentMode = UIViewContentModeScaleAspectFill;
    self.imgV.centerX = self.view.centerX;
    [self.view addSubview:self.imgV];

    NSArray *titleArr = @[@"CADisplayLink", @"NSTimer", @"GCDTimer", @"看看Runloop"];
    for (NSInteger i = 0; i < titleArr.count; i++) {
        UIButton *btn = [self createBtnTitle:titleArr[i]];
        
        btn.frame = CGRectMake(0, self.imgV.bottom + 50 * (i+1) , KScreenWidth, 50);
        btn.tag = i;
        [self.view addSubview:btn];
    }
}

- (UIButton *)createBtnTitle:(NSString *)title {
    UIButton * button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
   
    [button addTarget:self action:@selector(CADisplayLinkAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return button;
}

- (void)CADisplayLinkAction:(UIButton *)sender {
    UIButton *btn = sender;
    if (btn.tag == 0) {
        self.nsTimerResume = YES;
        self.timerInN.fireDate = [NSDate distantFuture];
        if (self.timerInG && !self.gcdTimerResume) {
            dispatch_suspend(self.timerInG);
            self.gcdTimerResume = YES;
        }
        self.timerInC.paused = !self.timerInC.paused;
    } else if (btn.tag == 1) {
        self.timerInC.paused = YES;
        
        if (self.timerInG && !self.gcdTimerResume) {
            dispatch_suspend(self.timerInG);
            self.gcdTimerResume = YES;
        }
        self.timerInN.fireDate = self.nsTimerResume?
        [NSDate distantPast]:[NSDate distantFuture];
        self.nsTimerResume = !self.nsTimerResume;
    } else if (btn.tag == 2) {
        if (self.gcdTimerResume) {
            self.timerInC.paused = YES;
            self.nsTimerResume = YES;
            self.timerInN.fireDate = [NSDate distantFuture];
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                self.timerInG = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
                dispatch_source_set_timer(self.timerInG,  dispatch_walltime(NULL,0 * NSEC_PER_SEC), 0.032 * NSEC_PER_SEC, 0);
                dispatch_source_set_event_handler(self.timerInG, ^{
                    [self changeImg];
                });
            });
            dispatch_resume(self.timerInG);
        }
        else
        {
            dispatch_suspend(self.timerInG);
        }
        self.gcdTimerResume = !self.gcdTimerResume;

    } else if (btn.tag == 3) {
        [self.timerInC invalidate];
        self.timerInC = nil;
        [self.timerInN invalidate];
        self.timerInN = nil;
        if (self.timerInG) {
            if (self.gcdTimerResume) {
                dispatch_resume(self.timerInG);
            }
            dispatch_source_cancel(self.timerInG);
            self.timerInG = nil;
        }
        RunloopViewController * vc = [[RunloopViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];

    }
}
#pragma mark - CADisplayLink
- (void)testCADisplayLink {
    self.view.backgroundColor = [UIColor grayColor];
    ///target selector 模式初始化一个实例
    self.timerInC = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeImg)];
    ///暂停
    self.timerInC.paused = YES;
    ///selector触发间隔
    self.timerInC.frameInterval = 2;
    
    self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imgV.contentMode = UIViewContentModeScaleAspectFill;
    self.imgV.center = self.view.center;
    [self.view addSubview:self.imgV];
    
    ///加入一个runLoop
    [self.timerInC addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    UIButton * button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [button setFrame:CGRectMake(0, 0, 100, 30)];
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 200);
    [self.view addSubview:button];
    [button setTitle:@"开始播放" forState:(UIControlStateNormal)];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button addTarget:self action:@selector(gifAction) forControlEvents:(UIControlEventTouchUpInside)];
}
-(void)changeImg
{
    self.currentIndex ++;
    if (self.currentIndex > 75) {
        self.currentIndex = 1;
    }
    self.imgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",self.currentIndex]];

}

-(void)gifAction
{
    self.timerInC.paused = !self.timerInC.paused;
}

#pragma mark - CATransition
- (void)testCATransition {
    UIButton * bu = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [bu setBackgroundColor:[UIColor yellowColor]];
    [bu setFrame:CGRectMake(200, 200, 100, 100)];
    [self.view addSubview:bu];
    [bu addTarget:self action:@selector(a:) forControlEvents:(UIControlEventTouchUpInside)];
   
    self.view.backgroundColor = [UIColor grayColor];
    UIImageView * redView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    redView.image = [UIImage imageNamed:@"clock"];
    [self.view addSubview:redView];
    self.imgV = redView;
}

-(void)a:(UIButton *)btn
{
    CATransition *animation = [CATransition animation];
    animation.duration = 5;
    animation.fillMode = kCAFillModeForwards;
    //@"cube" @"moveIn" @"reveal" @"fade"(default) @"pageCurl" @"pageUnCurl" @"suckEffect" @"rippleEffect" @"oglFlip"
    animation.type = @"rippleEffect";
    animation.subtype = kCATransitionFromTop;
    [self.imgV.layer addAnimation:animation forKey:@"ripple"];
    self.imgV.image = [UIImage imageNamed:@"testdemo.jpg"];
}
#pragma mark - CAAnimationGroup
- (void)testCAAnimationGroup {
    UIView * redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(0, 0)],
                         [NSValue valueWithCGPoint:CGPointMake(200, 200)],
                         [NSValue valueWithCGPoint:CGPointMake(0, 400)]];
    animation.duration = 2;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.keyTimes = @[@0,@0.25,@0.5,@0.75,@1];
    animation.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)].CGPath;
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation2.toValue = @50;
    animation2.duration = 2;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.duration = 2;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.animations = @[animation,animation2];
    
    [redView.layer addAnimation:group forKey:@"group"];
}
#pragma mark - CAKeyframeAnimation 
- (void)testCAKeyframeAnimation{
    
    UIView * redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(325, 50)],
                         [NSValue valueWithCGPoint:CGPointMake(200, 200)],
                         [NSValue valueWithCGPoint:CGPointMake(375, 400)]];
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.beginTime = CACurrentMediaTime() + 1;
    animation.repeatCount = MAXFLOAT;
    // 用来改变补间动画的计算模式的
    // animation.calculationMode = kCAAnimationCubicPaced;
    // keyTimes属性指定的是当前状态节点到初始状态节点的时间占动画总时长的比例。不设置keyTimes则匀速播放
  //  animation.keyTimes = @[@1,@0.5,@0.5,@0.75,@1];
    // 指定了path属性，所以这时values属性将被忽略，按照指定的path运动
    animation.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 100, 100, 100)].CGPath;
    [redView.layer addAnimation:animation forKey:@"keyframe"];

}
#pragma mark - CABasicAnimation
- (void)testCABasicAnimation {
    UIView * redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.removedOnCompletion = NO; // 不移除
    animation.fillMode = kCAFillModeForwards; // 保持结束状态
    animation.duration = 2;
    animation.beginTime = CACurrentMediaTime() + 1; // 延迟1秒
    animation.repeatCount = MAXFLOAT; // 重复
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(375, 400)];// 相对于锚点来说的
    [redView.layer addAnimation:animation forKey:nil];

}

@end
