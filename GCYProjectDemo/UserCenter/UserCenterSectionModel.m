//
//  UserCenterSectionModel.m
//  GCYDemo
//
//  Created by gewara on 17/6/26.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "UserCenterSectionModel.h"

@implementation UserCenterSectionModel

@end

@implementation UserCenterSectionModel (Extension)

+ (UserCenterSectionModel *)createSectionHeaderName:(NSString *)headerName
                                       headerHeight:(CGFloat)height {
    UserCenterSectionModel *section = [[UserCenterSectionModel alloc]init];
    section.sectionHeaderName = headerName;
    section.sectionHeaderHeight = height;
    return section;
}

@end
