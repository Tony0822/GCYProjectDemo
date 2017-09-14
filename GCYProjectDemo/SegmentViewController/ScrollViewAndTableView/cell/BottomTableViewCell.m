//
//  BottomTableViewCell.m
//  GCYDemo
//
//  Created by gewara on 17/7/6.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "BottomTableViewCell.h"
#import "PageContentView.h"
#import "STContentViewController.h"

@implementation BottomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

#pragma mark Setter
- (void)setViewControllers:(NSMutableArray *)viewControllers
{
    _viewControllers = viewControllers;
}

- (void)setCellCanScroll:(BOOL)cellCanScroll {
    _cellCanScroll = cellCanScroll;
    for (STContentViewController *vc in _viewControllers) {
        vc.vcCanScroll = cellCanScroll;
        if (!cellCanScroll) { //如果cell不能滑动，代表到了顶部，修改所有子vc的状态回到顶部
            vc.tableView.contentOffset = CGPointZero;
        }
    }
}
@end
