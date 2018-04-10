//
//  CommonViewController.m
//  GCYDemo
//
//  Created by gewara on 17/6/29.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "CommonViewController.h"

#define STAR_AMOUNT_NUMBER 5

@interface CommonViewController ()

@property (nonatomic, strong) UIView *starView;
@property (nonatomic, assign) CGFloat level;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
#pragma mark -setter.getter

- (void)test1 {
    //     测试星星View
    [self.view addSubview:self.starView];
    self.level = 3.8;
    self.name = @"asc";
    NSArray *a = @[@"1",@"2"];
    self.array = [NSMutableArray arrayWithArray:a];
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}
//- (NSString *)name {
//    return _name;
//}
//
//-(void)setName:(NSString *)name {
//
//}
#pragma mark - 创建✨视图
- (void)setLevel:(CGFloat)level {
    _level = level;
    
    NSInteger fullStarNumber = (NSInteger)level;
    for (NSInteger i = 0; i < fullStarNumber; i++) {
        [self createStarViewWithImageName:@"star_1" withStarPosition:i];
    }
    
    if ((level - fullStarNumber) > 0) {
        [self createStarViewWithImageName:@"star_2" withStarPosition:fullStarNumber];
        fullStarNumber++;
    }
    
    for (NSInteger i = fullStarNumber; i < STAR_AMOUNT_NUMBER; i++) {
        [self createStarViewWithImageName:@"star_3" withStarPosition:i];
    }
}

- (void)createStarViewWithImageName:(NSString *)imageName withStarPosition:(NSInteger)starPosition {
    UIImageView *imageView = nil;
    if (self.starView.subviews.count == STAR_AMOUNT_NUMBER) {
        imageView = self.starView.subviews[starPosition];
        imageView.image = [UIImage imageNamed:imageName];
        
        return ;
    }
    imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    [imageView sizeToFit];
    imageView.frame = CGRectOffset(imageView.bounds, starPosition * imageView.width, 0);
    [self.starView addSubview:imageView];
    
}
- (UIView *)starView {
    if (!_starView) {
        _starView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 100)];
        _starView.backgroundColor = [UIColor blueColor];
        
    }
    return _starView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
