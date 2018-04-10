//
//  UIView+PlaceholderView.m
//  GCYProjectDemo
//
//  Created by TonyYang on 2017/11/7.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

#import "UIView+PlaceholderView.h"
#import <objc/runtime.h>

@interface UIView ()

/**
 记录UIscrollview的最初的scrollEnable
 */
@property (nonatomic, assign) BOOL originalScrollEnable;
@end


@implementation UIView (PlaceholderView)
static void *placeholderViewKey = &placeholderViewKey;
static void *originalScrollEnableKey = &originalScrollEnableKey;

- (UIView *)plachholderView {
    return objc_getAssociatedObject(self, &placeholderViewKey);
}
- (void)setPlachholderView:(UIView *)plachholderView {
    objc_setAssociatedObject(self, &placeholderViewKey, plachholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)originalScrollEnable {
    return objc_getAssociatedObject(self, &originalScrollEnableKey);
}
- (void)setOriginalScrollEnable:(BOOL)originalScrollEnable {
    objc_setAssociatedObject(self, &originalScrollEnableKey, @(originalScrollEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showPlaceholderViewWithType:(GCYPlaceholderViewType)type reloadBlock:(void (^)())reloadBlock {
    // 如果是scrollview及其子类，占位图展示期间禁止scroll
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        // 1.记录原本的
        self.originalScrollEnable = scrollView.scrollEnabled;
        // 2.再将scrollenable 设置NO
        scrollView.scrollEnabled = NO;
    }
    
    if (self.plachholderView) {
        [self.plachholderView removeFromSuperview];
        self.plachholderView = nil;
    }
    self.plachholderView = [[UIView alloc] init];
    [self addSubview:self.plachholderView];
    self.plachholderView.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
    self.center = self.center;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.plachholderView addSubview:imageView];
    imageView.frame = CGRectMake(0, 80, 80, 80);
    imageView.centerX = self.bounds.size.width/2;
    
    UILabel *descLabel = [[UILabel alloc] init];
    [self.plachholderView addSubview:descLabel];
    
    UIButton *reloadButton = [[UIButton alloc] init];
    [self.plachholderView addSubview:reloadButton];
    [reloadButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
    reloadButton.layer.borderWidth = 1;
    reloadButton.layer.borderColor = [UIColor blackColor].CGColor;
//    [reloadButton addTarget:self action:@selector(reloadBlockHandler) forControlEvents:UIControlEventTouchUpInside];
    
    switch (type) {
        case GCYPlaceholderViewType_NoNetwork: // 网络不好
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"无网" ofType:@"png"];
            imageView.image = [UIImage imageWithContentsOfFile:path];
            descLabel.text = @"网络异常";
        }
            break;
        case GCYPlaceholderViewType_NoContent: // 没内容
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"" ofType:@"png"];
            imageView.image = [UIImage imageWithContentsOfFile:path];
            descLabel.text = @"";
        }
            break;
            
        default:
            break;
    }
}
//- (void)reloadBlockHandler() {
////    if (reloadBlock) {
////        reloadBlock();
////    }
//    [self.plachholderView removeFromSuperview];
//    self.plachholderView = nil;
//    if ([self isKindOfClass:[UIScrollView class]]) {
//        UIScrollView *scrollView = (UIScrollView *)self;
//        scrollView.scrollEnabled = self.plachholderView;
//    }
//}
- (void)removePlaceholderView {
    if (self.plachholderView) {
        [self.plachholderView removeFromSuperview];
        self.plachholderView = nil;
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        scrollView.scrollEnabled = self.plachholderView;
    }
}
@end
