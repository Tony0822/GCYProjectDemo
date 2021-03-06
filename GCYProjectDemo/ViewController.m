//
//  ViewController.m
//  GCYProjectDemo
//
//  Created by TonyYang on 2017/9/12.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

#import "ViewController.h"
#import "UserCenterViewController.h"
#import "GCYDevice.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.button];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:nil];
}

- (void)OnClick {
    NSString *ssid = [GCYDevice getSSID];
    NSString *bssid = [GCYDevice getbSSID];
    NSString *carr = [GCYDevice getCarrier];
    NSLog(@"%@, %@, %@", ssid, bssid, carr);
    UserCenterViewController *userVC = [[UserCenterViewController alloc] init];
    [self.navigationController pushViewController:userVC animated:YES];
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 100)];
        _button.backgroundColor = [UIColor redColor];
        [_button setTitle:@"开始你的表演" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [_button.titleLabel setFont:[UIFont systemFontOfSize:18]];
        _button.center = self.view.center;
        [_button addTarget:self action:@selector(OnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
@end
