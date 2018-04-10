//
//  UserCenterViewController.m
//  GCYDemo
//
//  Created by gewara on 17/6/26.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "UserCenterViewController.h"
#import "UserCenterItemModel.h"
#import "UserCenterSectionModel.h"
#import "UserCenterCell.h"
#import "SettingViewController.h"
#import "AnimationViewController.h"
#import "CommonViewController.h"
#import "TimerViewController.h"
#import "CustomButtonViewController.h"
#import "SegmentViewController.h"
#import "FMDBViewController.h"
#import "WebSocketViewController.h"
#import "TencentViewController.h"
#import "GCYAlertViewController.h"
#import "GCYInstrumentViewController.h"
#import "RuntimeViewController.h"
#import "NetWorkingViewController.h"


@interface UserCenterViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *sectionArray;

@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTableView];
    [self setupSections];
    
}
- (void)setupSections {
    
    __weak typeof(self) bself = self;
    
//    section1 ******************************************************************************************
    UserCenterItemModel *item1 = [UserCenterItemModel createfuncName:@"动画VC"
                                                               image:@"icon-list01"
                                                          detailText:@"AnimationDemo"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    item1.executeCode = ^{
        AnimationViewController *vc = [[AnimationViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    
    UserCenterItemModel *item2 = [UserCenterItemModel createfuncName:@"测试VC"
                                                               image:@"icon-list01"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    item2.executeCode = ^{
        CommonViewController *VC = [[CommonViewController alloc] init];
        [bself.navigationController pushViewController:VC animated:YES];
    };
    
    UserCenterItemModel *item3 = [UserCenterItemModel createfuncName:@"轮播大发"
                                                               image:@"icon-list01"
                                                        accessoryType:UserCenterAccessoryTypeIndicator];
    
    item3.executeCode = ^ {
        TimerViewController *vc = [[TimerViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    
    UserCenterItemModel *item4 = [UserCenterItemModel createfuncName:@"自定义button"
                                                               image:@"icon-list01"
                                                          detailText:@"做任务赢大奖"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    item4.executeCode = ^ {
        CustomButtonViewController *vc = [[CustomButtonViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };

    UserCenterItemModel *item5 = [UserCenterItemModel createfuncName:@"AlertController" accessoryType:UserCenterAccessoryTypeNone];
    item5.executeCode = ^{
        GCYAlertViewController *vc = [[GCYAlertViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    UserCenterSectionModel *section1 = [UserCenterSectionModel createSectionHeaderName:nil
                                                                          headerHeight:30];
    
    UserCenterItemModel *runtime = [UserCenterItemModel createfuncName:@"RunTime" accessoryType:UserCenterAccessoryTypeNone];
    runtime.executeCode = ^{
        RuntimeViewController *vc = [[RuntimeViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    section1.itemArray = @[item1,item2,item3,item4,item5,runtime];
    
    // 分组二 ******************************************************************************************
    UserCenterItemModel *item7 = [UserCenterItemModel createfuncName:@"自定义SegmentView"
                                                               image:@"icon-list01"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
      item7.executeCode = ^{
          SegmentViewController *VC = [[SegmentViewController alloc] init];
          [bself.navigationController pushViewController:VC animated:YES];
      };
    
    UserCenterItemModel *item6 = [UserCenterItemModel createfuncName:@"设置"
                                                               image:@"icon-list01"
                                                          detailText:@"测试--"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    item6.executeCode = ^{
        SettingViewController *setVC = [[SettingViewController alloc] init];
        [bself.navigationController pushViewController:setVC animated:YES];
    };
    // 测试FMDB
    UserCenterItemModel *fmdb = [UserCenterItemModel createfuncName:@"FMDB" accessoryType:UserCenterAccessoryTypeIndicator];
    fmdb.executeCode = ^{
        FMDBViewController *vc = [[FMDBViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    // 测试 WebSocket
    UserCenterItemModel *websocket = [UserCenterItemModel createfuncName:@"WebSocket" accessoryType:UserCenterAccessoryTypeIndicator];
    websocket.executeCode = ^{
        WebSocketViewController *vc = [[WebSocketViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    
    // asyncSocket
    UserCenterItemModel *asyncsocket = [UserCenterItemModel createfuncName:@"AsyncSocket" accessoryType:UserCenterAccessoryTypeIndicator];
    asyncsocket.executeCode = ^{
        
    };
    UserCenterItemModel *tencentMap = [UserCenterItemModel createfuncName:@"TencentMap" accessoryType:UserCenterAccessoryTypeIndicator];
    tencentMap.executeCode = ^{
        TencentViewController *vc = [[TencentViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    
    UserCenterItemModel *instrumentVC = [UserCenterItemModel createfuncName:@"instrument的使用" accessoryType:UserCenterAccessoryTypeIndicator];
    instrumentVC.executeCode = ^{
        GCYInstrumentViewController *vc = [[GCYInstrumentViewController alloc] init];
        [bself.navigationController pushViewController:vc animated:YES];
    };
    
    
//section3 ********************************************************************************************************
    
    UserCenterItemModel *afNetWorking = [UserCenterItemModel createfuncName:@"AFNetWorking" accessoryType:UserCenterAccessoryTypeIndicator];
    afNetWorking.executeCode = ^{
        NetWorkingViewController *VC = [[NetWorkingViewController alloc] init];
        [bself.navigationController pushViewController:VC animated:YES];
    };
    UserCenterItemModel *SDWebImage = [UserCenterItemModel createfuncName:@"SDWebImage" accessoryType:UserCenterAccessoryTypeIndicator];
    SDWebImage.executeCode = ^{
        
        
    };
    
    
    UserCenterSectionModel *section2 = [UserCenterSectionModel createSectionHeaderName:@"我是分组二"
                                                                          headerHeight:30];
    section2.itemArray = @[item7,item6,fmdb, websocket, asyncsocket,tencentMap,instrumentVC,afNetWorking, SDWebImage];
    UserCenterSectionModel *section3 = [UserCenterSectionModel createSectionHeaderName:@"第三方源码之庖丁解牛" headerHeight:50];
    section3.itemArray = @[afNetWorking, SDWebImage];
    
    self.sectionArray = @[section1, section2, section3];
    
}

- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    UserCenterSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"setting";
    UserCenterSectionModel *sectionModel = self.sectionArray[indexPath.section];
    UserCenterItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    
    UserCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UserCenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.item = itemModel;
    return cell;
}

#pragma mark - Table view delegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    UserCenterSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.sectionHeaderName;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    UserCenterSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.sectionHeaderHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UserCenterSectionModel *sectionModel = self.sectionArray[indexPath.section];
    UserCenterItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    if (itemModel.executeCode) {
        itemModel.executeCode();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
