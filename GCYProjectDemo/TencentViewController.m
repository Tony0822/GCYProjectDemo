//
//  TencentViewController.m
//  GCYProjectDemo
//
//  Created by TonyYang on 2017/9/12.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

#import "TencentViewController.h"
#import <QMapKit/QMapKit.h>
#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
@interface TencentViewController ()
@property (nonatomic, strong) QMapView *mapView;
@end

@implementation TencentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView = [[QMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.mapView];
    [self.mapView setZoomLevel:11.5];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
