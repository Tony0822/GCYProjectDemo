////
////  GSAlertView.h
////  GCYProjectDemo
////
////  Created by TonyYang on 2017/10/29.
////  Copyright © 2017年 TonyYang. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//
//#define gs_dispatch_main_async_safe(block)\
//    if ([NSThread isMainThread]) {\
//        block();\
//    } else {\
//        dispatch_async(dispatch_get_main_queue(), block);\
//    }
///**
// 回调主线程（显示alert必须在主线程执行）
//
// @param block 执行块
// */
//static inline void gs_getSafeMainQueue( dispatch_block_t block)
//{
//    gs_dispatch_main_async_safe(block);
//}
///**
// alert 按钮执行回调
//
// @param buttonIndex 选中的index
// */
//typedef void (^gsAlertClickBlock)(NSInteger buttonIndex);
//
//void gsShowAlertTwoButton(NSString *title, NSString *message, NSString *cancelButtonTitle, gsAlertClickBlock cancelBolck, NSString * otherButtonTitle, gsAlertClickBlock otherBlock);
//void gsShowAlertOneButton(NSString *title, NSString *message, NSString *cancelButtonTitle, gsAlertClickBlock cancelBlock);
//void gsShowAlertTitle(NSString *title);
//void gsShowAlertMessage(NSString *message);
//void gsShowAlertTitleMessage(NSString *title, NSString *message);
//
//void gsShowToastTitleMessageDismiss(NSString *title, NSString *message, NSTimeInterval duration, gsAlertClickBlock dismissCompletion);
//void gsShowToastTitleDismiss(NSString *title, NSTimeInterval duration, gsAlertClickBlock dismissCompletion);
//void gsShowToastMessageDismiss(NSString *message, NSTimeInterval duration, gsAlertClickBlock dismissCompletion);
//void gsShowToastTitle(NSString *title, NSTimeInterval duration);
//void gsShowToastMessage(NSString *message, NSTimeInterval duration);
//
////void gsShowTextHUDTitleMessage(NSString *title, NSString *message);
////void gsShowTextHUDTitle(NSString *title);
////void gsShowTextHUDMessage(NSString *message);
////
////void gsShowLoadingHUDTitleMessage(NSString *title, NSString *message);
////void gsShowLoadingHUDTitlt(NSString *title);
////void gsShowLoadingHUDMessage(NSString *message);
////
////void gsShowProgressHUDTitleMessage(NSString *title, NSString *message);
////void gsShowProgressHUDTitle(NSString *title);
////void gsShowProgressHUDMessage(NSString *message);
////void gsShowHUDProgress(float progress);
////
////void gsShowHUDSuccessTitleMessage(NSString *title, NSString *message);
////void gsShowHUDSuccessTitle(NSString *title);
////void gsShowHUDSuccessMessage(NSString *message);
////
////void gsShowHUDFailTitleMessage(NSString *title, NSString *message);
////void gsShowHUDFailTitle(NSString *title);
////void gsShowHUDFailMessage(NSString *message);
////void gsDismissHUD();
//
//@interface GSAlertView : UIAlertView
//
///**
// 最多支持两个button
// */
//+ (void)showAlertViewWithTitle:(NSString *)title
//                       message:(NSString *)message
//             cancelButtonTitle:(NSString *)cancelButtonTitle
//              otherButtonTitle:(NSString *)otherButtonTitle
//             cancelButtonBlock:(gsAlertClickBlock)cancleBlock
//              otherButtonBlock:(gsAlertClickBlock)otherBlock;
//
///**
// 不定数量的Alert
// @param otherButtonTitle 其他按钮标题的列表
// */
//+ (void)showAlertViewWithTitle:(NSString *)title
//                       message:(NSString *)message
//             cancelButtonTitle:(NSString *)cancelButtonTitle
//              buttonIndexBlock:(gsAlertClickBlock)buttonIndexBlock
//              otherButtonTitle:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
//
///**
// 不带按钮自动消失的Toast
// @param duration 显示时间
// @param dismissComoletion 关闭后回调
// */
//+ (void)showToastViewWithTitle:(NSString *)title
//                       message:(NSString *)message
//                      duration:(NSTimeInterval)duration
//             dismissCompletion:(gsAlertClickBlock)dismissComoletion;
//
/////**
//// 文字HUD
//// */
////+ (void)showTextHUDWithTitle:(NSString *)title
////                     message:(NSString *)message;
////
/////**
//// 显示loading
////
//// */
////+ (void)showLoadingHUDWithTitle:(NSString *)title
////                        message:(NSString *)message;
////
/////**
//// progressHUD
////
//// */
////+ (void)showProgressHUDWithTitle:(NSString *)title
////                         message:(NSString *)message;
//
///**
// progressHUD,进度条进度值
//
// @param progress 进度值
// */
////+ (void)setHUDProgress:(float)progress;
////
/////**
//// HUD共有方法，设置成功状态
////
//// */
////+ (void)setHUDSuccessStateWithTitle:(NSString *)title
////                            message:(NSString *)message;
////
/////**
//// HUD共有方法，设置失败状态
////
//// */
////+ (void)setHUDFailStateWithTitle:(NSString *)title
////                         message:(NSString *)message;
////
/////**
//// HUD共有方法，关闭HUD
//// */
////+ (void)dismissHUD;
////
//
//
//
//@end
//
