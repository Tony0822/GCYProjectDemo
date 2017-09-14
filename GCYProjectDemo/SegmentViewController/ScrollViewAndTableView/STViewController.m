//
//  STViewController.m
//  GCYDemo
//
//  Created by gewara on 17/7/6.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "STViewController.h"
#import "ScrollViewTableView.h"
#import "TopTableViewCell.h"
#import "LineTableViewCell.h"
#import "BottomTableViewCell.h"

#import "SegmentTitleView.h"
#import "STContentViewController.h"
#import "PageContentView.h"


@interface STViewController ()<UITableViewDelegate,UITableViewDataSource,SegmentTitleViewDelegate, PageContentViewDelegate>
@property (nonatomic, strong) ScrollViewTableView *tableView;
@property (nonatomic, strong) BottomTableViewCell *contentCell;
@property (nonatomic, strong) SegmentTitleView *titleView;
@property (nonatomic, assign) BOOL canScroll;

@end

@implementation STViewController

- (void)dealloc {

}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
    
    [self setupSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupSubViews {
    self.canScroll = YES;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
}
#pragma mark notify
- (void)changeScrollStatus//改变主视图的状态
{
    self.canScroll = YES;
    self.contentCell.cellCanScroll = NO;
}

#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 1;
    }
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 200;
        }
        return 50;
    }
    return self.view.height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.titleView = [[SegmentTitleView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 50) titles:@[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电"] delegate:self indicatorType:IndicatorTypeEqualTitle];
    self.titleView.backgroundColor = [UIColor whiteColor];
    return self.titleView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *FSBaseTopTableViewCellIdentifier = @"FSBaseTopTableViewCellIdentifier";
    static NSString *FSBaselineTableViewCellIdentifier = @"FSBaselineTableViewCellIdentifier";
    if (indexPath.section == 1) {
        _contentCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!_contentCell) {
            _contentCell = [[BottomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            NSArray *titles = @[@"全部",@"服饰穿搭",@"生活百货",@"美食吃货",@"美容护理",@"母婴儿童",@"数码家电"];
            NSMutableArray *contentVCs = [NSMutableArray array];
            for (NSString *title in titles) {
                STContentViewController *vc = [[STContentViewController alloc]init];
                vc.title = title;
                vc.str = title;
                [contentVCs addObject:vc];
            }
            _contentCell.viewControllers = contentVCs;
            _contentCell.pageContentView = [[PageContentView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) childVCs:contentVCs parentVC:self delegate:self];
            [_contentCell.contentView addSubview:_contentCell.pageContentView];
        }
        return _contentCell;
    }
    if (indexPath.row == 0) {
        TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FSBaseTopTableViewCellIdentifier];
        if (!cell) {
            cell = [[TopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FSBaseTopTableViewCellIdentifier];
        }
        return cell;
    }else{
        LineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FSBaselineTableViewCellIdentifier];
        if (!cell) {
            cell = [[LineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FSBaselineTableViewCellIdentifier];
        }
        return cell;
    }
    return nil;
}
- (void)SegmentTitleView:(SegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.contentCell.pageContentView.contentViewCurrentIndex = endIndex;
}

- (void)ContenViewDidEndDecelerating:(PageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.titleView.selectIndex = endIndex;
    _tableView.scrollEnabled = YES;//此处其实是监测scrollview滚动，pageView滚动结束主tableview可以滑动，或者通过手势监听或者kvo，这里只是提供一种实现方式
}
- (void)ContentViewDidScroll:(PageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress {
    _tableView.scrollEnabled = NO; //pageView开始滚动主tableview禁止滑动

}
#pragma mark UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat bottomCellOffset = [_tableView rectForSection:1].origin.y;
    if (scrollView.contentOffset.y >= bottomCellOffset) {
        scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        if (self.canScroll) {
            self.canScroll = NO;
            self.contentCell.cellCanScroll = YES;
        }
    }else{
        if (!self.canScroll) {//子视图没到顶部
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        }
    }
    self.tableView.showsVerticalScrollIndicator = _canScroll?YES:NO;
}

#pragma mark LazyLoad
- (ScrollViewTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[ScrollViewTableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
