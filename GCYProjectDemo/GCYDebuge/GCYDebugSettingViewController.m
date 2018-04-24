//
//  GCYDebugSettingViewController.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "GCYDebugSettingViewController.h"

@interface GCYDebugSettingViewController ()

@property (nonatomic, strong) NSArray* titleArray;

@end

@implementation GCYDebugSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"调试设置";
    
    self.titleArray = @[@"App环境设置", @"主窗口最小化", @"隐藏FPS调试", @"模拟内存警告", @"切换服务器", @"查看耗时及URL", @"本地通知列表", @"接口测试", @"本地日志", @"设备id", @"查看浏览器UA",@"JS测试", @"DTCoreText",@"AsyncDisplayKit",@"YYText", @"设置图片加载策略",@"获取URL",@"删除SecurityCode",@"网页测试",@"CommunityAnimation",@"开发测试页面",@"复制push token"];
    
    [self createTableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
}

-(void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.autoresizingMask=UIViewAutoresizingFlexibleWidth| UIViewAutoresizingFlexibleHeight;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_titleArray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    }
    
    cell.textLabel.text = _titleArray[indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (indexPath.row == 0) {
////        [self.navigationController pushViewController:[[WPSwitchEnvironmentViewController alloc] init] animated:YES];
//        return;
//    }
//    NSInteger row = indexPath.row - 1;
//    switch (row)
//    {
//        case 0:
//        {
//            [GWDebugManager shareInstance].debugSettingInfo.debugMainBarMinimize = ![GWDebugManager shareInstance].debugSettingInfo.debugMainBarMinimize;
//            [[GWDebugManager shareInstance] mainBarSizeChangedIfNeed];
//        }break;
//        case 1:
//        {
//            [GWDebugManager shareInstance].debugSettingInfo.fpsBarHidden = ![GWDebugManager shareInstance].debugSettingInfo.fpsBarHidden;
//        }break;
//        case 2:
//        {
//            //[[UIApplication sharedApplication] performSelector:@selector(_performMemoryWarning)];
//        }break;
//        case 3:
//        {
//            [self alert:@"请使用第一项 App环境设置 "];
//        }break;
//        case 4:
//        {
//            [self.navigationController pushViewController:[[GWWatchRequestTimeListViewController alloc] init] animated:YES];
//        }break;
//        case 5:
//        {
//            [self.navigationController pushViewController:[[GWDebugLocalNotificationViewController alloc] init] animated:YES];
//        }break;
//        case 6:
//        {
//            GWWPAPITestViewController * vc = [[GWWPAPITestViewController alloc] init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }break;
//        case 7:
//        {
//            [self.navigationController pushViewController:[[GWDebugLoggerViewController alloc] init] animated:YES];
//        }break;
//        case 8:
//        {
//
//        }break;
//        case 9:
//        {
//            GWBaseViewController* controller = [[GWBaseViewController alloc] init];
//            WKWebView* webView = [[WKWebView alloc] initWithFrame:controller.view.bounds];
//            [controller.view addSubview:webView];
//            webView.autoresizingMask = controller.view.autoresizingMask;
//            [self.navigationController pushViewController:controller animated:YES];
//
//            NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.sunchateau.com/free/UA.htm"]];
//            [webView loadRequest:request];
//        }break;
//        case 10:
//        {
//            [self.navigationController pushViewController:[[GWDebugUrlViewController alloc] init] animated:YES];
//        }break;
//        case 11:
//        {
//            [self.navigationController pushViewController:[[GWDTCoreTextDebugViewController alloc] init] animated:YES];
//        }break;
//        case 12:
//        {
//            [self.navigationController pushViewController:[GWAsyncDisplayKitViewController new] animated:YES];
//        }break;
//        case 14:
//        {
//            [self.navigationController pushViewController:[[GWDebugImagePolicySettingViewController alloc] init] animated:YES];
//        }break;
//        case 16:
//            [SSKeychain deletePasswordForService:GWKeychainServiceKey account:kAppKeyChainTokenKey];
//            [self showAutoHideToastWithString:@"删除成功"];
//            break;
//        case 17:
//            [self.navigationController pushViewController:[[GWWebTestViewController alloc] init] animated:YES];
//            break;
//        case 18:
//            [self.navigationController pushViewController:[GWDebugCommunityAnimationViewController new] animated:YES];
//            break;
//        case 19:
//            [self.navigationController pushViewController:[GWDevelopTestViewController new] animated:YES];
//            break;
//        case 20:
//            if ([GWMovieAppContext appContext].theDeviceToken) {
//                NSString *text = [GWMovieAppContext appContext].theDeviceToken;
//                [[UIPasteboard generalPasteboard] setString:text];
//            }
//
//            break;
//        default:
//            break;
//    }
    
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
