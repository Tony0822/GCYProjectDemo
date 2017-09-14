//
//  PageContentView.m
//  GCYDemo
//
//  Created by gewara on 17/7/6.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "PageContentView.h"

static NSString *collectionCellIdentifier = @"collectionCellIdentifier";

@interface PageContentView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIViewController *parentVC;//父视图
@property (nonatomic, strong) NSArray *childsVCs;//子视图数组
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, assign) CGFloat startOffsetX;
@property (nonatomic, assign) BOOL isSelectBtn;//是否是滑动

@end

@implementation PageContentView

- (instancetype)initWithFrame:(CGRect)frame childVCs:(NSArray *)childVCs parentVC:(UIViewController *)parentVC delegate:(id<PageContentViewDelegate>)delegate {
    self = [super initWithFrame:frame];
    if (self) {
        self.parentVC = parentVC;
        self.childsVCs = childVCs;
        self.delegate = delegate;
        [self setupSubViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setupSubViews {
    _startOffsetX = 0;
    _isSelectBtn = NO;
    _contentViewCanScroll = YES;
    for (UIViewController *childVC in self.childsVCs) {
        [self.parentVC addChildViewController:childVC];
    }
    [self.collectionView reloadData];
}
#pragma mark - UICollectionViewDelegate/DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.childsVCs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellIdentifier forIndexPath:indexPath];
    if (IOS_VERSION < 8.0) {
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UIViewController *childVC = self.childsVCs[indexPath.item];
        childVC.view.frame = cell.contentView.bounds;
        [cell.contentView addSubview:childVC.view];
    }
    return cell;
}
#ifdef __IPHONE_8_0 
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
 
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIViewController *childVC = self.childsVCs[indexPath.item];
    childVC.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:childVC.view];

}
#endif

#pragma mark -UIScrollView
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _isSelectBtn = NO;
    _startOffsetX = scrollView.contentOffset.x;
    if (self.delegate && [self.delegate respondsToSelector:@selector(ContentViewWillBeginDragging:)]) {
        [self.delegate ContentViewWillBeginDragging:self];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_isSelectBtn) {
        return;
    }
    
    CGFloat scrollView_w = scrollView.width;
    CGFloat currentOffSetX = scrollView.contentOffset.x;
    NSInteger startIndex = floor(currentOffSetX/scrollView_w);
    NSInteger endIndex;
    CGFloat progress;
    if (currentOffSetX > _startOffsetX) { // 左滑
        progress = (currentOffSetX - _startOffsetX) / scrollView_w;
        endIndex = startIndex + 1;
        if (endIndex > self.childsVCs.count - 1) {
            endIndex = self.childsVCs.count - 1;
        }
    } else if (currentOffSetX == _startOffsetX) {// 没有滑过去
        progress = 0;
        endIndex = startIndex;
    } else { // 右滑
        progress = (_startOffsetX - currentOffSetX) / scrollView_w;
        endIndex = startIndex - 1;
        endIndex = endIndex < 0 ? 0 : endIndex;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ContentViewDidScroll:startIndex:endIndex:progress:)]) {
        [self.delegate ContentViewDidScroll:self startIndex:startIndex endIndex:endIndex progress:progress];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  
    CGFloat scrollView_W = scrollView.width;
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    NSInteger startIndex = floor(_startOffsetX/scrollView_W);
    NSInteger endIndex = floor(currentOffsetX/scrollView_W);

    if (self.delegate && [self.delegate respondsToSelector:@selector(ContenViewDidEndDecelerating:startIndex:endIndex:)]) {
        [self.delegate ContenViewDidEndDecelerating:self startIndex:startIndex endIndex:endIndex];
    }
}
#pragma mark - lazy
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = self.bounds.size;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.pagingEnabled = YES;
        collectionView.bounces = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:collectionCellIdentifier];
        [self addSubview:collectionView];
        self.collectionView = collectionView;
    }
    return _collectionView;
}

#pragma mark - setter
- (void)setContentViewCurrentIndex:(NSInteger)contentViewCurrentIndex {
    if (_contentViewCurrentIndex < 0 || _contentViewCurrentIndex > self.childsVCs.count - 1) {
        return;
    }
    _isSelectBtn = YES;
    _contentViewCurrentIndex = contentViewCurrentIndex;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:contentViewCurrentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (void)setContentViewCanScroll:(BOOL)contentViewCanScroll {
    _contentViewCanScroll = contentViewCanScroll;
    _collectionView.scrollEnabled = _contentViewCanScroll;
}

@end
