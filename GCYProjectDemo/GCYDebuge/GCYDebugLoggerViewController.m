//
//  GCYDebugLoggerViewController.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "GCYDebugLoggerViewController.h"

@interface GCYDebugLoggerViewController ()
{
    NSMutableArray* _loggerList;
}
@end

@implementation GCYDebugLoggerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"日志列表";
    
    [self refreshLoggerList];
    
}

- (void)refreshLoggerList
{
//    _loggerList = [NSMutableArray arrayWithArray:[[NSFileManager defaultManager] allFilesAtPath:[NSString debugLogFilePath]]];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


@end
