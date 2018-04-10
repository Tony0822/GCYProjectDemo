////
////  GSAlertController.h
////  GCYProjectDemo
////
////  Created by TonyYang on 2017/10/29.
////  Copyright © 2017年 TonyYang. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//
//@class GSAlertController;
//
///**
// 配置标题
// */
//typedef GSAlertController * (^gsAlertActionTitle)(NSString *title);
//
///**
// 配置回调
//
// @param buttonIndex 按钮index
// @param action UIaction
// @param alertSelf 本类对象
// */
//typedef void (^gsAlertActionBlock)(NSInteger buttonIndex, UIAlertAction *action, GSAlertController *alertSelf);
//@interface GSAlertController : UIAlertController
//
///**
// alert弹出后，可以配置的回调
// */
//@property (nonatomic, copy) void (^alertDidShown)();
//
///**
// alert关闭后，配置的回调
// */
//@property (nonatomic, copy) void (^alertDidDismiss)();
//
///**
// 设置toast模式展开时间，如果alert没有添加任何按钮，将会以toast展示，时间为1s
// */
//@property (nonatomic, assign) NSTimeInterval toastStyleDuration;
///**
// 禁用alert弹出动画，默认执行系统的弹出动画
// */
//- (void)alertAnimationDisabled;
//
///**
// 添加一个alertacton按钮，默认样式，参数为标题
//
// */
//- (gsAlertActionTitle)addActionDefaultTitle;
//
///**
// 添加取消按钮，参数为标题
//
// */
//- (gsAlertActionTitle)addActonCancelTitle;
//
///**
// 添加一个警告按钮，参数为标题
//
// */
//- (gsAlertActionTitle)addActionDestructiveTitle;
//@end
//
//typedef void (^gsAlertAppearanceProcess)(GSAlertController *alertMaker);
//
//@interface UIViewController (GSAlertController)
//
//- (void)gsShowAlertWithTitle:(NSString *)title
//                     message:(NSString *)message
//                    process:(gsAlertAppearanceProcess)process
//                actionsBlock:(gsAlertActionBlock)actionBlock;
//
//- (void)gsShowActionSheetWithTitle:(NSString *)title
//                           message:(NSString *)message
//                           process:(gsAlertAppearanceProcess)process
//                      actionsBlock:(gsAlertActionBlock)actionBlock;
//
//@end
//
//
//
//
//
//
//
//
