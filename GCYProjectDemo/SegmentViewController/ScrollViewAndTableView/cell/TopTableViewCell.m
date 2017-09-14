//
//  TopTableViewCell.m
//  GCYDemo
//
//  Created by gewara on 17/7/6.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "TopTableViewCell.h"
#import "LoopScrollView.h"

@implementation TopTableViewCell

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
    LoopScrollView *loopView = [LoopScrollView loopImageViewWithFrame:CGRectMake(0, 0, KScreenWidth, 200) isHorizontal:YES];
    loopView.imgResourceArr = @[@"car1.jpg",@"car2.jpg",@"car3.jpg",@"car4.jpg",@"car5.jpg"];
    
    [self.contentView addSubview:loopView];
}
-(void)layoutSubviews {
    [super layoutSubviews];
}
@end
