//
//  UserCenterSectionModel.h
//  GCYDemo
//
//  Created by gewara on 17/6/26.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserCenterSectionModel : NSObject

/**
 传空表示分组无名称
 */
@property (nonatomic, copy) NSString *sectionHeaderName;

/**
 分组header的高度
 */
@property (nonatomic, assign) CGFloat sectionHeaderHeight;

/**
 背景色
 */
@property (nonatomic, strong) UIColor *sectionHeaderBGColor;

/**
 item数组
 */
@property (nonatomic, strong) NSArray *itemArray;

@end

@interface UserCenterSectionModel (Extension)

+ (UserCenterSectionModel *)createSectionHeaderName:(NSString *)headerName
                                       headerHeight:(CGFloat)height;

@end
