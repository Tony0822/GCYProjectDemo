//
//  LineTableViewCell.m
//  GCYDemo
//
//  Created by gewara on 17/7/6.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "LineTableViewCell.h"
#import "LoopScrollView.h"

@implementation LineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    NSArray *imageArr = @[@"home_ic_new",@"home_ic_hot",@"home_ic_new",@"home_ic_new",@"home_ic_hot"];
    LoopScrollView *loopView = [LoopScrollView loopTitleViewWithFrame:CGRectMake(0, 0, KScreenWidth, 50) isTitleView:YES titleImgArr:imageArr];
    loopView.titlesArr = @[@"这是一个简易的文字轮播",
                           @"This is a simple text rotation",
                           @"นี่คือการหมุนข้อความที่เรียบง่าย",
                           @"Это простое вращение текста",
                           @"이것은 간단한 텍스트 회전 인"];
    
    [self.contentView addSubview:loopView];
}
-(void)layoutSubviews {
    [super layoutSubviews];
}

@end
