//
//  UIView+PlaceholderView.h
//  GCYProjectDemo
//
//  Created by TonyYang on 2017/11/7.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 UIview的占位图类型
 */
typedef NS_ENUM(NSInteger, GCYPlaceholderViewType) {
    
    GCYPlaceholderViewType_NoNetwork, //无网络
    GCYPlaceholderViewType_NoContent  // 无内容
};
@interface UIView (PlaceholderView)

/**
 占位图
 */
@property (nonatomic, strong, readonly) UIView *plachholderView;

/**
 展示占位图

 @param type 类型
 @param reloadBlock 回调函数
 */
- (void)showPlaceholderViewWithType:(GCYPlaceholderViewType)type reloadBlock:(void(^)())reloadBlock;

/**
 手动移除占位图，点击回调自动移除
 */
- (void)removePlaceholderView;
@end
