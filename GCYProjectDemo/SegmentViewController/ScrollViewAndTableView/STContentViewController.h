//
//  STContentViewController.h
//  GCYDemo
//
//  Created by gewara on 17/7/6.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "BaseViewController.h"

@interface STContentViewController : BaseViewController

@property (nonatomic, assign) BOOL vcCanScroll;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isRefresh;
@property (nonatomic, strong) NSString *str;

@end
