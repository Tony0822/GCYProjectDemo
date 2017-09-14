//
//  BottomTableViewCell.h
//  GCYDemo
//
//  Created by gewara on 17/7/6.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageContentView;

@interface BottomTableViewCell : UITableViewCell

@property (nonatomic, strong) PageContentView *pageContentView;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, assign) BOOL cellCanScroll;
@property (nonatomic, assign) BOOL isRefresh;

@property (nonatomic, strong) NSString *currentTagStr;

@end
