//
//  UserCenterItemModel.h
//  GCYDemo
//
//  Created by gewara on 17/6/26.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UserCenterAccessoryType) {
    UserCenterAccessoryTypeNone,
    UserCenterAccessoryTypeSwitch,
    UserCenterAccessoryTypeIndicator,
};

@interface UserCenterItemModel : NSObject

/**
 功能名称
 */
@property (nonatomic, copy) NSString *funcName;

/**
 描述信息
 */
@property (nonatomic, copy) NSString *detailText;

/**
 功能图片
 */
@property (nonatomic, strong) UIImage *img;

/**
 描述信息图片
 */
@property (nonatomic, strong) UIImage *detailImage;

/**
 类型
 */
@property (nonatomic, assign) UserCenterAccessoryType accessoryType;

/**
 点击item执行代码
 */
@property (nonatomic, copy) void (^executeCode)();

/**
 UserConterAccessoryTypeSwitch开关
 */
@property (nonatomic, copy) void (^switchValueChanged)(BOOL isOn);
@end

@interface UserCenterItemModel (Extension)

+ (UserCenterItemModel *)createfuncName:(NSString *)funcName
                          accessoryType:(UserCenterAccessoryType)accessoryType;

+ (UserCenterItemModel *)createfuncName:(NSString *)funcName
                                  image:(NSString *)image
                          accessoryType:(UserCenterAccessoryType)accessoryType;

+ (UserCenterItemModel *)createfuncName:(NSString *)funcName
                                  image:(NSString *)image
                             detailText:(NSString *)detailText
                          accessoryType:(UserCenterAccessoryType)accessoryType;

+ (UserCenterItemModel *)createfuncName:(NSString *)funcName
                                  image:(NSString *)image
                             detailText:(NSString *)detailText
                            detailImage:(NSString *)detailImage
                          accessoryType:(UserCenterAccessoryType)accessoryType;

@end


