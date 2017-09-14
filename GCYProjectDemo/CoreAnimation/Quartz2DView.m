//
//  Quartz2DView.m
//  GCYDemo
//
//  Created by gewara on 17/6/29.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "Quartz2DView.h"

@implementation Quartz2DView
#if 0
// 绘制直线
- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文对象
    CGContextRef contexRef = UIGraphicsGetCurrentContext();
    // 2.创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    // 设置起点
    CGPathMoveToPoint(path, NULL, 50, 50);
    // 加线
    CGPathAddLineToPoint(path, NULL, 200, 200);
    // 把路径添加到上下文中
    CGContextAddPath(contexRef, path);
    // 3. 渲染
    CGContextStrokePath(contexRef);
    // 4.释放内存
    CFRelease(path);
}
#elif 0
// 绘制三角形
- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文对象
    CGContextRef contexRef = UIGraphicsGetCurrentContext();
  
    // 设置起点
    CGContextMoveToPoint(contexRef, 50, 50);
    // 加线
    CGContextAddLineToPoint(contexRef, 150, 50);
    CGContextAddLineToPoint(contexRef, 100, 100);
   
    // 闭合path，自动回到原点
    CGContextClosePath(contexRef);
    
    // 渲染
    CGContextStrokePath(contexRef);
}
#elif 0
// 绘制四边形
- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文对象
    CGContextRef contexRef = UIGraphicsGetCurrentContext();
    
    // 设置路径
    CGContextAddRect(contexRef, CGRectMake(50, 50, 50, 50));
    // 渲染
    CGContextStrokePath(contexRef);
}
#elif 0
// 绘制椭圆
- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文对象
    CGContextRef contexRef = UIGraphicsGetCurrentContext();
    
    //  添加椭圆，通过矩形的方式。给出矩形的起点坐标，长宽，绘制一个内切椭圆
    CGContextAddEllipseInRect(contexRef, CGRectMake(50, 50, 80, 50));
    // 渲染
    CGContextStrokePath(contexRef);
}
#elif 0
// 绘制圆弧
- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文对象
    CGContextRef contexRef = UIGraphicsGetCurrentContext();
    
//    参数：1+2，圆点坐标。参数3+4，起点和终点的弧度。参数5:0表示顺时针，1表示逆时针。
    CGContextAddArc(contexRef, 50, 50, 20, M_PI_4, M_PI, 1);
    
    // 渲染
    CGContextStrokePath(contexRef);
}
#elif 0
// 绘制扇形
- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文对象
    CGContextRef contexRef = UIGraphicsGetCurrentContext();
    
    //    参数：1+2，圆点坐标。参数3+4，起点和终点的弧度。参数5:0表示顺时针，1表示逆时针。
    CGContextAddArc(contexRef, 50, 50, 20, M_PI_4, M_PI, 1);
    
    CGContextClosePath(contexRef);
    // 渲染
    CGContextStrokePath(contexRef);
}
#elif 1
// 绘制线段
- (void)drawRect:(CGRect)rect {
    // 1.获取图形上下文对象
    CGContextRef contexRef = UIGraphicsGetCurrentContext();

    CGContextMoveToPoint(contexRef, 50, 50);
    CGContextAddLineToPoint(contexRef, 100, 100);
    // 渲染
    CGContextStrokePath(contexRef);
}

#endif
@end
