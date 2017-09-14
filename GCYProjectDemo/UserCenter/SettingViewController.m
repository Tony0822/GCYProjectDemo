//
//  SettingViewController.m
//  GCYDemo
//
//  Created by gewara on 17/6/27.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "SettingViewController.h"
#import "UserCenterCell.h"
#import "UserCenterItemModel.h"
#import "UserCenterSectionModel.h"

@interface SettingViewController ()

@property (nonatomic, strong) NSArray *sectionArray;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self setupAllControl];
}

- (void)setupAllControl {
    
    UserCenterItemModel *item1 = [UserCenterItemModel createfuncName:@"我的余额"
                                                               image:nil
                                                          detailText:@"做任务赢大奖"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    UserCenterItemModel *item2 = [UserCenterItemModel createfuncName:@"修改密码"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    UserCenterSectionModel *section1 = [UserCenterSectionModel createSectionHeaderName:nil
                                                                          headerHeight:30];
    section1.itemArray = @[item1, item2];
    
    
    UserCenterItemModel *item3 = [UserCenterItemModel createfuncName:@"推送提醒"
                                                       accessoryType:UserCenterAccessoryTypeSwitch];
    item3.switchValueChanged = ^(BOOL isOn) {
        D_Log(@"推送提醒开关状态===%@",isOn?@"open":@"close");
    };
    UserCenterItemModel *item4 = [UserCenterItemModel createfuncName:@"给我打分"
                                                               image:nil
                                                          detailText:nil
                                                         detailImage:@"icon-new"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
   
    UserCenterItemModel *item5 = [UserCenterItemModel createfuncName:@"意见反馈"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
   
    UserCenterSectionModel *section2 = [UserCenterSectionModel createSectionHeaderName:nil
                                                                          headerHeight:30];
    section2.itemArray = @[item3,item4,item5];
    
    
    UserCenterItemModel *item6 = [UserCenterItemModel createfuncName:@"关于我们"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    UserCenterItemModel *item7 = [UserCenterItemModel createfuncName:@"帮助中心"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    UserCenterItemModel *item8 = [UserCenterItemModel createfuncName:@"清除缓存"
                                                       accessoryType:UserCenterAccessoryTypeIndicator];
    UserCenterSectionModel *section3 = [UserCenterSectionModel createSectionHeaderName:nil headerHeight:30];
    section3.itemArray = @[item6,item7,item8];
    
    self.sectionArray = @[section1,section2,section3];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    UserCenterSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.itemArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"setting";
    UserCenterSectionModel *sectionModel = self.sectionArray[indexPath.section];
    UserCenterItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    
    UserCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UserCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.item = itemModel;
    return cell;
}

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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
