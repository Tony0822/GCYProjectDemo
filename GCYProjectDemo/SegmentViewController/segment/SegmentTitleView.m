//
//  SegmentTitleView.m
//  GCYDemo
//
//  Created by gewara on 17/7/5.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "SegmentTitleView.h"

@interface SegmentTitleView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray<UIButton *> *itemBtnArr;

@property (nonatomic, strong) UIView *indicatorView;

@property (nonatomic, assign) IndicatorType indicatorType;

@property (nonatomic, strong) NSArray *titlesArr;

@end

@implementation SegmentTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titlesArr delegate:(id<SegmentTitleViewDelegate>)delegate indicatorType:(IndicatorType)indicatorType {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initWithProperty];
        self.titlesArr = titlesArr;
        self.delegate = delegate;
        self.indicatorType = indicatorType;
    }
    return self;
}

//初始化默认属性值
- (void)initWithProperty {
    self.itemMargin = 20;
    self.selectIndex = 0;
    self.titleFont = [UIFont systemFontOfSize:15];
    self.titleSelectFont = self.titleFont;
    self.titleSelectColor = [UIColor redColor];
    self.titleNormalColor = [UIColor blackColor];
    self.indicatorColor = self.titleSelectColor;
    self.indicatorExtension = 5.0f;
}

//重新布局frame
- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    if (self.itemBtnArr.count == 0) {
        return;
    }
    
    CGFloat totalBtnWidth = 0;
    UIFont *titleFont = _titleFont;
    
    if (_titleFont != _titleSelectFont) {
        for (NSInteger i = 0; i < self.titlesArr.count; i++) {
            UIButton *btn = self.itemBtnArr[i];
            titleFont = btn.isSelected ?_titleSelectFont : _titleFont;
            CGFloat itemBtnWidth = [NSString getWidthWithString:self.titlesArr[i] font:titleFont] + self.itemMargin;
            totalBtnWidth += itemBtnWidth;
        }
    } else {
        for (NSString *title in self.titlesArr) {
            CGFloat itemBtnWidth = [NSString getWidthWithString:title font:titleFont] + self.itemMargin;
            totalBtnWidth += itemBtnWidth;
        }
    }
    
    // 不能滑动
    if (totalBtnWidth <= CGRectGetWidth(self.bounds)) {
        CGFloat itemBtnWidth = CGRectGetWidth(self.bounds) / self.itemBtnArr.count;
        CGFloat itemBtnHeight = CGRectGetHeight(self.bounds);
        [self.itemBtnArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.frame = CGRectMake(idx * itemBtnWidth, 0, itemBtnWidth, itemBtnHeight);
        }];
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.scrollView.bounds));
    } else { // 超出屏幕，可以滑动
        CGFloat currentX = 0;
        for (NSInteger i = 0; i < self.titlesArr.count; i++) {
            UIButton *btn = self.itemBtnArr[i];
            titleFont = btn.isSelected ? _titleSelectFont : _titleFont;
            CGFloat itemBtnWidth = [NSString getWidthWithString:self.titlesArr[i] font:titleFont] + self.itemMargin;
            CGFloat itemBtnHeight = CGRectGetHeight(self.bounds);
            btn.frame = CGRectMake(currentX, 0, itemBtnWidth, itemBtnHeight);
            currentX += itemBtnWidth;
        }
        self.scrollView.contentSize = CGSizeMake(currentX, CGRectGetHeight(self.scrollView.bounds));
    }
    [self moveIndicatorView:YES];
    
}

- (void)moveIndicatorView:(BOOL)animated {
    UIFont *titleFont = _titleFont;
    UIButton *selectBtn = self.itemBtnArr[self.selectIndex];
    titleFont = selectBtn.isSelected?_titleSelectFont:_titleFont;
    CGFloat indicatorWidth = [NSString getWidthWithString:self.titlesArr[self.selectIndex] font:titleFont];
    
    [UIView animateWithDuration:(animated ? 0.05 : 0)
                     animations:^{
                         switch (_indicatorType) {
                             case IndicatorTypeNone:
                                 self.indicatorView.frame = CGRectZero;
                                 break;
                             case IndicatorTypeCustom:
                                 self.indicatorView.center = CGPointMake(selectBtn.centerX, self.scrollView.bottom - 1);
                                 self.indicatorView.bounds = CGRectMake(0, 0, indicatorWidth + _indicatorExtension * 2, 2);
                                 break;
                             case IndicatorTypeDefault:
                                 self.indicatorView.frame = CGRectMake(selectBtn.left, self.scrollView.bottom - 2, selectBtn.width, 2);
                                 break;
                             case IndicatorTypeEqualTitle:
                                 self.indicatorView.center = CGPointMake(selectBtn.centerX, self.scrollView.bottom - 1);
                                 self.indicatorView.bounds = CGRectMake(0, 0, indicatorWidth, 2);                                 break;
                             default:
                                 break;
                         }
    } completion:^(BOOL finished) {
        [self scrollSelectBtnCenter:animated];
    }];
}
- (void)scrollSelectBtnCenter:(BOOL)animated {
    UIButton *selectBtn = self.itemBtnArr[self.selectIndex];
    CGRect centerRect = CGRectMake(selectBtn.centerX - self.scrollView.width / 2, 0, self.scrollView.width, self.scrollView.height);
    [self.scrollView scrollRectToVisible:centerRect animated:animated];
}

#pragma mark - btn
- (void)btnClick:(UIButton *)btn {
    NSInteger index = btn.tag - 1234;
    if (index == self.selectIndex) {
        return;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(SegmentTitleView:startIndex:endIndex:)]) {
        [self.delegate SegmentTitleView:self startIndex:self.selectIndex endIndex:index];
    }
    self.selectIndex = index;
}

#pragma mark -Setter

- (void)setSelectIndex:(NSInteger)selectIndex {
    if (_selectIndex == selectIndex || _selectIndex < 0 || _selectIndex > self.itemBtnArr.count - 1) {
        return;
    }
    // 选中之前的Btn
    UIButton *lastBtn = [self.scrollView viewWithTag:_selectIndex + 1234];
    lastBtn.selected = NO;
    lastBtn.titleLabel.font = _titleFont;
    
    _selectIndex = selectIndex;
    
    // 当前选中的Btn
    UIButton *currentBtn = [self.scrollView viewWithTag:_selectIndex + 1234];
    currentBtn.selected = YES;
    currentBtn.titleLabel.font = _titleSelectFont;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setTitlesArr:(NSArray *)titlesArr {
    _titlesArr = titlesArr;
    [self.itemBtnArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemBtnArr = nil;
    for (NSString *title in titlesArr) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = self.itemBtnArr.count + 1234;
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:_titleNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:_titleSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = _titleFont;
        [self.scrollView addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (self.itemBtnArr.count == self.selectIndex) {
            btn.selected = YES;
        }
        [self.itemBtnArr addObject:btn];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setItemMargin:(CGFloat)itemMargin {
    _itemMargin = itemMargin;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setIndicatorColor:(UIColor *)indicatorColor {
    _indicatorColor = indicatorColor;
    self.indicatorView.backgroundColor = indicatorColor;
}

- (void)setIndicatorExtension:(CGFloat)indicatorExtension {
    _indicatorExtension = indicatorExtension;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setTitleNormalColor:(UIColor *)titleNormalColor {
    _titleNormalColor = titleNormalColor;
    for (UIButton *btn in self.itemBtnArr) {
        [btn setTitleColor:titleNormalColor forState:UIControlStateNormal];
    }
}

- (void)setTitleSelectColor:(UIColor *)titleSelectColor {
    _titleSelectColor = titleSelectColor;
    for (UIButton *btn in self.itemBtnArr) {
        [btn setTitleColor:titleSelectColor forState:UIControlStateSelected];
    }
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    for (UIButton *btn in self.itemBtnArr) {
        btn.titleLabel.font = titleFont;
    }
}

- (void)setTitleSelectFont:(UIFont *)titleSelectFont {
    if (_titleFont == titleSelectFont) {
        _titleSelectFont = titleSelectFont;
        return;
    }
    _titleSelectFont = titleSelectFont;
    for (UIButton *btn in self.itemBtnArr) {
        btn.titleLabel.font = btn.isSelected ? titleSelectFont : _titleFont;
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
#pragma mark laayLoad
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (NSMutableArray<UIButton *> *)itemBtnArr {
    if (!_itemBtnArr) {
        _itemBtnArr = [[NSMutableArray alloc]init];
    }
    return _itemBtnArr;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc]init];
        [self.scrollView addSubview:_indicatorView];
    }
    return _indicatorView;
}

@end
