//
//  LyricLabel.h
//  GCYDemo
//
//  Created by gewara on 17/6/30.
//  Copyright © 2017年 gewara. All rights reserved.
//
// 歌词显示
#import <UIKit/UIKit.h>

@interface LyricLabel : UIView

@property (nonatomic ,assign) NSInteger location;
@property (nonatomic) UIColor * trackTintColor;

-(instancetype)initWithString:(NSString *)lyric
                         font:(UIFont *)font
                   widthLimit:(CGFloat)widthLimit
                  heightLimit:(CGFloat)heightLimit;

-(void)updateWithDuration:(CGFloat)duartion;

-(void)updateLocation:(NSInteger)location
             duration:(CGFloat)duration;

-(void)updateProgress:(CGFloat)progress
             duration:(CGFloat)duration;

@end
