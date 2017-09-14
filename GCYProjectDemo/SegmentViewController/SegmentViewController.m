//
//  SegmentViewController.m
//  GCYDemo
//
//  Created by gewara on 17/7/5.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "SegmentViewController.h"
#import "SegmentTitleView.h"
#import "PageContentViewController.h"
#import "STViewController.h"

@interface SegmentViewController () <SegmentTitleViewDelegate>

@property (nonatomic, strong) SegmentTitleView *titleView;

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titArr = @[@"进入上下联动",@"tableView手势冲突",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"];
    for (NSInteger i = 0; i < 4; i++) {
        SegmentTitleView *titleView = [[SegmentTitleView alloc]initWithFrame:CGRectMake(0, (i+2)*64, KScreenWidth, 50) titles:titArr delegate:nil indicatorType:i];
        [self.view addSubview:titleView];
        titleView.backgroundColor = [UIColor lightGrayColor];
    }

    for (NSInteger i = 0; i < 2; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, i*40, KScreenWidth, 30)];
        [btn setTitle:titArr[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor cyanColor]];
        btn.tag = i + 1234;
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }

}
- (void)btnClick:(UIButton *)btn {
    NSInteger index = btn.tag - 1234;
    if (index == 0) {
        PageContentViewController *vc = [[PageContentViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        STViewController *vc = [[STViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
@end
