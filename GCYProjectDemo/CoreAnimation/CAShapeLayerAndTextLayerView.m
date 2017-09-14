//
//  CAShapeLayerAndTextLayerView.m
//  
//
//  Created by gewara on 17/6/30.
//
//

#import "CAShapeLayerAndTextLayerView.h"

@implementation CAShapeLayerAndTextLayerView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
       // [self testCAShapeLayer];
       // [self testCirle];
    }
    return self;
}
#pragma mark - CATextLayer

#pragma mark - CAShapeLayer
// 绘制镂空的圆形
- (void)testCirle {
    CGRect rect = CGRectMake(0, 0, 100, 100);
    UIBezierPath *rectP = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5];
    UIBezierPath *circleP = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 80, 80)];
    [rectP appendPath:circleP];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = self.center;
    layer.path = rectP.CGPath;
    layer.fillColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    
   // kCAFillRuleNonZero
   // 从该点向任意方向画一条射线，若顺时针穿过该射线的条数与逆时针穿过该射线的条数不相等，则表示该点在区域内部，否则在外部。
   // kCAFillRuleEvenOdd
   // 从该点向任意方向画一条射线，如果该射线穿过奇数条路径则该点在区域内部，否则在外部。
    layer.fillRule = kCAFillRuleEvenOdd;
    [self.layer addSublayer:layer];
}
// 绘制圆形
- (void)testCAShapeLayer {
    CAShapeLayer *circle = [CAShapeLayer layer];
    circle.bounds = CGRectMake(0, 0, 100, 100);
    circle.position = self.center;
    [self.layer addSublayer:circle];
    
    circle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)].CGPath;
    circle.strokeColor = [UIColor redColor].CGColor;
    circle.fillColor = [UIColor yellowColor].CGColor;
    circle.lineWidth = 10;
    circle.lineCap = @"round";
  // 这个属性是默认支持隐式动画的
    circle.strokeEnd = 0.75;
    circle.lineWidth = 2;
    // 这个属性是告诉系统从多少开始计算这个距离。比如上图中第一段实现的距离明显小于5，其实他是2，因为我们从3开始计算，5 - 3就剩2了。
    circle.lineDashPhase = 3;
    // 这个属性指的是实线与虚线长度交替的数组。注意奇数位为实线，偶数位为虚线，单位像素
    circle.lineDashPattern = @[@5, @5, @15, @5];
    
}
@end

