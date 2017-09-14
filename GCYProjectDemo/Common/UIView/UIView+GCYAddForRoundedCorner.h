//
//  UIView+GCYAddForRoundedCorner.h
//  GCYDemo
//
//  Created by gewara on 17/6/23.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GCYAddForRoundedCorner)

/**
 设置一个圆角

 @param radius 圆角半径
 @param color 圆角背景色
 */
- (void)roundedCornerWithRadius:(CGFloat)radius
                  conrnerClolor:(UIColor *)color;

/**
 设置一个普通圆角

 @param radius 圆角半径
 @param color 圆角背景色
 @param corners 圆角位置
 */
- (void)roundedCornerWithRadius:(CGFloat)radius
                  conrnerClolor:(UIColor *)color
                        corners:(UIRectCorner)corners;

/**
 设置一个带边框圆角

 @param radius 圆角半径
 @param color 圆角背景色
 @param corners 圆角位置
 @param borderColor 圆角边框颜色
 @param borderWidth 圆角边框宽度
 */
- (void)roundedCornerWithRadius:(CGFloat)radius
                  conrnerClolor:(UIColor *)color
                        corners:(UIRectCorner)corners
                    borderColor:(UIColor *)borderColor
                    borderWidth:(CGFloat)borderWidth;

@end

@interface CALayer (GCYAddForRoundedCorner)

@property (nonatomic, strong) UIImage *contentImage; // content的便捷设置

/**如下分别对应UIView的相应API*/
- (void)roundedCornerWithRadius:(CGFloat)radius
                  conrnerClolor:(UIColor *)color;

- (void)roundedCornerWithRadius:(CGFloat)radius
                  conrnerClolor:(UIColor *)color
                        corners:(UIRectCorner)corners;

- (void)roundedCornerWithRadius:(CGFloat)radius
                  conrnerClolor:(UIColor *)color
                        corners:(UIRectCorner)corners
                    borderColor:(UIColor *)borderColor
                    borderWidth:(CGFloat)borderWidth;

@end
