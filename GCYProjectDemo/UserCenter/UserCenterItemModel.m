//
//  UserCenterItemModel.m
//  GCYDemo
//
//  Created by gewara on 17/6/26.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "UserCenterItemModel.h"

@implementation UserCenterItemModel

@end

@implementation UserCenterItemModel (Extension)


+ (UserCenterItemModel *)createfuncName:(NSString *)funcName
                          accessoryType:(UserCenterAccessoryType)accessoryType {
   return [self createfuncName:funcName image:nil detailText:nil detailImage:nil accessoryType:accessoryType];
}

+ (UserCenterItemModel *)createfuncName:(NSString *)funcName
                                  image:(NSString *)image
                          accessoryType:(UserCenterAccessoryType)accessoryType {
    return [self createfuncName:funcName image:image detailText:nil detailImage:nil accessoryType:accessoryType];
    
}

+ (UserCenterItemModel *)createfuncName:(NSString *)funcName
                                  image:(NSString *)image
                             detailText:(NSString *)detailText
                          accessoryType:(UserCenterAccessoryType)accessoryType {
    return [self createfuncName:funcName image:image detailText:detailText detailImage:nil accessoryType:accessoryType];
    
}

+ (UserCenterItemModel *)createfuncName:(NSString *)funcName
                                  image:(NSString *)image
                             detailText:(NSString *)detailText
                            detailImage:(NSString *)detailImage
                          accessoryType:(UserCenterAccessoryType)accessoryType {
    UserCenterItemModel *item = [[UserCenterItemModel alloc]init];
    item.funcName = funcName;
    item.img = [UIImage imageNamed:image];
    item.detailText = detailText;
    item.detailImage = [UIImage imageNamed:detailImage];
    item.accessoryType = accessoryType;
    return item;
}
@end
