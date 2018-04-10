////
////  GSAlertView.m
////  GCYProjectDemo
////
////  Created by TonyYang on 2017/10/29.
////  Copyright © 2017年 TonyYang. All rights reserved.
////
//
//#import "GSAlertView.h"
//// 取消按钮默认标题
//static NSString *const GSCancelButtonDefault = @"确定";
//// toast 默认展示时间，当设置为0，显示该值
//static NSTimeInterval const GSToastShowDurationDefault = 1.0f;
//// setVlaue 的key
//static NSString *const GSAlertViewAccessoryViewKey = @"accessoryView";
//
//void gsShowAlertTwoButton(NSString *title, NSString *message, NSString *cancelButtonTitle, gsAlertClickBlock cancelBolck, NSString * otherButtonTitle, gsAlertClickBlock otherBlock) {
//    gs_getSafeMainQueue(^{
//        [GSAlertView showAlertViewWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitle:otherButtonTitle cancelButtonBlock:cancelBolck otherButtonBlock:otherBlock];
//
//    });
//}
////void gsShowAlertOneButton(NSString *title, NSString *message, NSString *cancelButtonTitle, gsAlertClickBlock cancelBlock) {
////
////    gsShowAlertTwoButton(title, message, cancelButtonTitle, cancelBlock, nil, NULL);
////
////}
//#pragma mark - define
//typedef NS_ENUM(NSInteger, GSAlertType) {
//    GSAlertType_Normal,
//    GSAlertType_Toast,
//    GSAlertType_HUD
//};
//
//typedef NS_ENUM(NSInteger, GSAlertHUDType) {
//    GSAlertHUDType_Text,
//    GSAlertHUDType_Loading,
//    GSAlertHUDType_Progress
//};
//
//@interface GSAlertView () <UIAlertViewDelegate>
//// block
//@property (nonatomic, copy) gsAlertClickBlock buttonClickBlock;
//@property (nonatomic, copy) gsAlertClickBlock completionBlock;
//// type
//@property (nonatomic, assign) GSAlertType alertType;
//@property (nonatomic, assign) GSAlertHUDType alertHUDType;
////
//@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
//@property (nonatomic, strong) UIProgressView *progressView;
//
//- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;
//
//@end
//
//
//@implementation GSAlertView
//
//#pragma mark - init
//- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
//    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
//    if (self) {
//        return self;
//    }
//}
//#pragma mark -shared
//static GSAlertView *gs_commonHUD = nil;
//
//+ (instancetype)shareCommonHUDWithHUDType:(GSAlertHUDType)HUDType {
//    if (gs_commonHUD == nil) {
//        gs_commonHUD = [[GSAlertView alloc] initWithTitle:nil message:nil cancelButtonTitle:nil otherButtonTitles:nil];
//        // 可以定制
//        gs_commonHUD.alertType = GSAlertType_HUD;
//        gs_commonHUD.alertHUDType = HUDType;
//
//        switch (HUDType) {
//            case GSAlertHUDType_Text:
//                break;
//            case GSAlertHUDType_Loading:
//            {
//                UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//                indicatorView.color = [UIColor blackColor];
//                [indicatorView startAnimating];
//                gs_commonHUD.indicatorView = indicatorView;
//                if (floor(NSFoundationVersionNumber_iOS_6_0)) {
//                    [gs_commonHUD setValue:indicatorView forKey:GSAlertViewAccessoryViewKey];
//                } else {
//                    [gs_commonHUD addSubview:indicatorView];
//                }
//                break;
//            }
//            case GSAlertHUDType_Progress:
//            {
//                UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
//                progressView.progressTintColor = [UIColor blackColor];
//                progressView.progress = 0.0;
//                if (floor(NSFoundationVersionNumber_iOS_6_0)) {
//                    [gs_commonHUD setValue:progressView forKey:GSAlertViewAccessoryViewKey];
//                } else {
//                    [gs_commonHUD addSubview:progressView];
//                }
//                break;
//            }
//            default:
//                break;
//        }
//    }
//    return gs_commonHUD;
//
//}
//+ (GSAlertView *)sharedCommentHUD {
//    return gs_commonHUD;
//}
//+ (void)clearCommonHUD {
//    gs_commonHUD = nil;
//}
//// 重写setvalue 处理不存在的key防止崩溃
//- (void)setValue:(id)value forKey:(NSString *)key {
//    NSLog(@"key===%@ is null ", key);
//}
//- (id)valueForUndefinedKey:(NSString *)key {
//    NSLog(@"value===%@ is null", key);
//    return nil;
//}
//#pragma mark - methods
//// 两个button
//+ (void)showAlertViewWithTitle:(NSString *)title
//                       message:(NSString *)message
//             cancelButtonTitle:(NSString *)cancelButtonTitle
//              otherButtonTitle:(NSString *)otherButtonTitle
//             cancelButtonBlock:(gsAlertClickBlock)cancleBlock
//              otherButtonBlock:(gsAlertClickBlock)otherBlock {
//    if (!(title.length > 0) && message.length > 0) {
//        title = @"";
//    }
//    GSAlertView *alertView = [[GSAlertView alloc] initWithTitle:title
//                                                        message:message
//                                              cancelButtonTitle:cancelButtonTitle
//                                              otherButtonTitles:otherButtonTitle, nil];
//    alertView.alertType = GSAlertType_Normal;
//    alertView.buttonClickBlock = ^(NSInteger buttonIndex) {
//        if (buttonIndex == 0) {
//            if (cancleBlock) {
//                cancleBlock(buttonIndex);
//            }
//        } else if (buttonIndex == 1) {
//            if (otherBlock) {
//                otherBlock(buttonIndex);
//            }
//        }
//    };
//    [alertView show];
//}
//// 不定的button
//+ (void)showAlertViewWithTitle:(NSString *)title
//                       message:(NSString *)message
//             cancelButtonTitle:(NSString *)cancelButtonTitle
//              buttonIndexBlock:(gsAlertClickBlock)buttonIndexBlock
//              otherButtonTitle:(NSString *)otherButtonTitles, ...{
//    if (!(title.length > 0) && message.length > 0) {
//        title = @"";
//    }
//    GSAlertView *alertView = [[GSAlertView alloc] initWithTitle:title
//                                                        message:message
//                                              cancelButtonTitle:cancelButtonTitle
//                                              otherButtonTitles:nil];
//    alertView.alertType = GSAlertType_Normal;
//    alertView.buttonClickBlock = buttonIndexBlock;
//    if (otherButtonTitles) {
//        va_list args; // 定义一个指向个数可变的参数列表指针
//        va_start(args, otherButtonTitles); // 得到第一个颗变参数地址
//        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString *)) {
//            [alertView addButtonWithTitle:arg];
//        }
//        va_end(args); // 置空指针
//    }
//    [alertView show];
//}
//// 无按钮toast
//+ (void)showToastViewWithTitle:(NSString *)title
//                       message:(NSString *)message
//                      duration:(NSTimeInterval)duration
//             dismissCompletion:(gsAlertClickBlock)dismissComoletion {
//    if (!(title.length > 0) && message.length > 0) {
//        title = @"";
//    }
//    GSAlertView *toastView = [[GSAlertView alloc] initWithTitle:title
//                                                        message:message
//                                              cancelButtonTitle:nil
//                                              otherButtonTitles:nil];
//    toastView.alertViewStyle = GSAlertType_Toast;
//    toastView.completionBlock = ^(NSInteger buttonIndex) {
//        if (buttonIndex == 0) {
//            if (dismissComoletion) {
//                dismissComoletion(buttonIndex);
//            }
//        }
//    };
//    [toastView show];
//
//    duration = duration > 0 ? duration : GSToastShowDurationDefault;
//    [toastView performSelector:@selector(dismissToastView:) withObject:toastView afterDelay:duration];
//}
//- (void)dismissToastView:(UIAlertView *)toastView {
//    [toastView dismissWithClickedButtonIndex:0 animated:YES];
//}
////// 文字HUD
////+ (void)showTextHUDWithTitle:(NSString *)title message:(NSString *)message {
////    if (!(title.length > 0) && message.length > 0) {
////        title = @"";
////    }
////
////    GSAlertView *textHUD = [GSAlertView shareCommonHUDWithHUDType:GSAlertHUDType_Text];
////    textHUD.title = title;
////    textHUD.message = message;
////    [textHUD show];
////}
////// loading
////+ (void)showLoadingHUDWithTitle:(NSString *)title message:(NSString *)message {
////    if (!(title.length > 0) && message.length > 0) {
////        title = @"";
////    }
////    GSAlertView *loadingHUD = [GSAlertView shareCommonHUDWithHUDType:GSAlertHUDType_Loading];
////    loadingHUD.title = title;
////    loadingHUD.message = message;
////    [loadingHUD show];
////}
////// progress
////+ (void)showProgressHUDWithTitle:(NSString *)title message:(NSString *)message {
////    if (!(title.length > 0) && message.length > 0) {
////        title = @"";
////    }
////    GSAlertView *progressHUD = [GSAlertView shareCommonHUDWithHUDType:GSAlertHUDType_Progress];
////    progressHUD.title = title;
////    progressHUD.message = message;
////    [progressHUD show];
////}
////+ (void)setHUDProgress:(float)progress {
////    GSAlertView *alertHUD = [GSAlertView sharedCommentHUD];
////    [alertHUD.progressView setProgress:progress animated:YES];
////    if (progress >= 1.0) {
////        [alertHUD.progressView setProgress:1];
////    }
////}
////// HUD公用
////+ (void)setHUDSuccessStateWithTitle:(NSString *)title message:(NSString *)message {
////    GSAlertView *alertHUD = [GSAlertView sharedCommentHUD];
////    alertHUD.title = title;
////    alertHUD.message = message;
////    switch (alertHUD.alertHUDType) {
////        case GSAlertHUDType_Text:
////            break;
////        case GSAlertHUDType_Loading:
////        {
////            [alertHUD.indicatorView stopAnimating];
////            if (floor(NSFoundationVersionNumber_iOS_6_1)) {
////                [alertHUD setValue:nil forKey:GSAlertViewAccessoryViewKey];
////            } else {
////                [alertHUD.indicatorView removeFromSuperview];
////            }
////            alertHUD.indicatorView = nil;
////            break;
////        }
////        case GSAlertHUDType_Progress:
////        {
////            [alertHUD.progressView setProgress:1 animated:YES];
////            break;
////        }
////        default:
////            break;
////    }
////}
////+ (void)setHUDFailStateWithTitle:(NSString *)title message:(NSString *)message {
////    GSAlertView *alertHUD = [GSAlertView sharedCommentHUD];
////    alertHUD.title = title;
////    alertHUD.message = message;
////    switch (alertHUD.alertHUDType) {
////        case GSAlertHUDType_Text:
////            break;
////        case GSAlertHUDType_Loading:
////        {
////            [alertHUD.indicatorView stopAnimating];
////            if (floor(NSFoundationVersionNumber_iOS_6_1)) {
////                [alertHUD setValue:nil forKey:GSAlertViewAccessoryViewKey];
////            } else {
////                [alertHUD.indicatorView removeFromSuperview];
////            }
////            alertHUD.indicatorView = nil;
////            break;
////        }
////        case GSAlertHUDType_Progress:
////        {
////            [alertHUD.progressView setProgress:0 animated:YES];
////            break;
////        }
////        default:
////            break;
////    }
////}
////+ (void)dismissHUD {
////    GSAlertView *alertHUD = [GSAlertView sharedCommentHUD];
////    switch (alertHUD.alertHUDType) {
////        case GSAlertHUDType_Text:
////            break;
////         case GSAlertHUDType_Loading:
////        {
////            [alertHUD.indicatorView stopAnimating];
////            alertHUD.indicatorView = nil;
////            break;
////        }
////            case GSAlertHUDType_Progress:
////            break;
////        default:
////            break;
////    }
////    [alertHUD dismissWithClickedButtonIndex:0 animated:YES];
////}
//#pragma mark - delegate
//
//@end
//
