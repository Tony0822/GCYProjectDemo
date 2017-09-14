//
//  ConstHeader.h
//  GCYDemo
//
//  Created by gewara on 17/6/26.
//  Copyright © 2017年 gewara. All rights reserved.
//

#ifndef ConstHeader_h
#define ConstHeader_h

#define KMakeColorWithRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
//获取屏幕尺寸
#define KScreenWidth      [UIScreen mainScreen].bounds.size.width
#define KScreenHeight     [UIScreen mainScreen].bounds.size.height
#define KScreenBounds     [UIScreen mainScreen].bounds

/**
 * 随机数据
 */
#define RandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

// 获取系统版本号
#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

//功能图片到左边界的距离
#define KFuncImgToLeftGap 15

//功能名称字体
#define KFuncLabelFont 14

//功能名称到功能图片的距离,当功能图片funcImg不存在时,等于到左边界的距离
#define KFuncLabelToFuncImgGap 15

//指示箭头或开关到右边界的距离
#define KIndicatorToRightGap 15

//详情文字字体
#define KDetailLabelFont 12

//详情到指示箭头或开关的距离
#define KDetailViewToIndicatorGap 13

#endif /* ConstHeader_h */
