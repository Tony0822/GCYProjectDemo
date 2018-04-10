//
//  GCYAlertController.h
//  GCYProjectDemo
//
//  Created by TonyYang on 2017/10/15.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GCYAlertController;
/**
 <#Description#>

 @param title 标题
 @return <#return value description#>
 */
typedef GCYAlertController * _Nonnull (^GCYAlertActionTitle)(NSString *title);

/**
 <#Description#>

 @param buttonIndex 按钮index（根基添加action的顺序）
 @param action UIAlertAction对象
 @param alertSelf 本类对象
 */
typedef void (^GCYAlertActionBlock)(NSInteger buttonIndex, UIAlertAction *action, GCYAlertController *alertSelf);

@interface GCYAlertController : UIAlertController
- (void)alertAnimateDisabled;

/**
 alert 弹出后，配置回调
 */
@property (nonatomic, copy, nullable) void (^alertDidShow)();

/**
 alert 消失后，配置回调
 */
@property (nonatomic, copy, nullable) void (^alertDidDismiss)();
@property (nonatomic, assign) NSTimeInterval toastStyleDuration;
@end


NS_ASSUME_NONNULL_END
