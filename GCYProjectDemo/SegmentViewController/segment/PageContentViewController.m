//
//  PageContentViewController.m
//  GCYDemo
//
//  Created by gewara on 17/7/6.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "PageContentViewController.h"
#import "SegmentTitleView.h"
#import "PageContentView.h"
#import "ChildViewController.h"

@interface PageContentViewController ()<SegmentTitleViewDelegate, PageContentViewDelegate>

@property (nonatomic, strong) SegmentTitleView *titleView;
@property (nonatomic, strong) PageContentView *pageContentView;

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArr = @[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电",@"其他"];
    self.titleView = [[SegmentTitleView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 50) titles:titleArr delegate:self indicatorType:IndicatorTypeDefault];
    [self.view addSubview:self.titleView];
    
    NSMutableArray *child = [NSMutableArray array];
    for (NSString *title in titleArr) {
        ChildViewController *vc = [[ChildViewController alloc] init];
        vc.title = title;
        [child addObject:vc];
    }
    
    self.pageContentView = [[PageContentView alloc] initWithFrame:CGRectMake(0, self.titleView.bottom, KScreenWidth, KScreenHeight - self.titleView.height) childVCs:child parentVC:self delegate:self];
    [self.view addSubview:self.pageContentView];
    
}

- (void)SegmentTitleView:(SegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.pageContentView.contentViewCurrentIndex = endIndex;
}
- (void)ContenViewDidEndDecelerating:(PageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.titleView.selectIndex = endIndex;
}
@end
