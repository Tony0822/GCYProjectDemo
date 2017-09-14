//
//  UserConterCell.m
//  GCYDemo
//
//  Created by gewara on 17/6/26.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "UserCenterCell.h"
#import "UserCenterItemModel.h"

@interface UserCenterCell ()
@property (nonatomic, strong) UILabel *funcNameLabel;
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UIImageView *indicatorView;
@property (nonatomic, strong) UISwitch *aswitch;

@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *detailImageView;


@end

@implementation UserCenterCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
- (void)setItem:(UserCenterItemModel *)item {
    _item = item;
    [self updateUI];
}

- (void)updateUI {
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
   // 有图片
    if (self.item.img) {
        [self.contentView addSubview:self.imgView];
    }
    // 有名称
    if (self.item.funcName) {
        [self.contentView addSubview:self.funcNameLabel];
    }
    // 类型
    if (self.item.accessoryType) {
        [self setupAccessoryType];
    }
    // 描述信息
    if (self.item.detailText) {
        [self setupDetailText];
    }
    // 描述图片
    if (self.item.detailImage) {
        [self setupDetailImage];
    }
    
    // bottomLine
//    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 0.5, KScreenWidth, 0.5)];
//    bottomLine.backgroundColor = [UIColor redColor];
//    [self.contentView addSubview:bottomLine];
    
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}

-(void)setupDetailImage
{
    self.detailImageView = [[UIImageView alloc]initWithImage:self.item.detailImage];
    self.detailImageView.centerY = self.contentView.centerY;
    switch (self.item.accessoryType) {
        case UserCenterAccessoryTypeNone:
            self.detailImageView.left = KScreenWidth - self.detailImageView.width - KDetailViewToIndicatorGap - 2;
            break;
        case UserCenterAccessoryTypeIndicator:
            self.detailImageView.left = self.indicatorView.left - self.detailImageView.width - KDetailViewToIndicatorGap;
            break;
        case UserCenterAccessoryTypeSwitch:
            self.detailImageView.left = self.aswitch.left - self.detailImageView.width - KDetailViewToIndicatorGap;
            break;
        default:
            break;
    }
    [self.contentView addSubview:self.detailImageView];
}

- (void)setupDetailText
{
    self.detailLabel = [[UILabel alloc]init];
    self.detailLabel.text = self.item.detailText;
    self.detailLabel.textColor = KMakeColorWithRGB(142, 142, 142, 1);
    self.detailLabel.font = [UIFont systemFontOfSize:KDetailLabelFont];
    self.detailLabel.size = [self sizeForTitle:self.item.detailText withFont:self.detailLabel.font];
    self.detailLabel.centerY = self.contentView.centerY;
    
    switch (self.item.accessoryType) {
        case UserCenterAccessoryTypeNone:
            self.detailLabel.left = KScreenWidth - self.detailLabel.width - KDetailViewToIndicatorGap - 2;
            break;
        case UserCenterAccessoryTypeIndicator:
            self.detailLabel.left = self.indicatorView.left - self.detailLabel.width - KDetailViewToIndicatorGap;
            break;
        case UserCenterAccessoryTypeSwitch:
            self.detailLabel.left = self.aswitch.left - self.detailLabel.width - KDetailViewToIndicatorGap;
            break;
        default:
            break;
    }
    
    [self.contentView addSubview:self.detailLabel];
}

- (void)setupAccessoryType
{
    switch (self.item.accessoryType) {
        case UserCenterAccessoryTypeNone:
            break;
        case UserCenterAccessoryTypeIndicator:
            [self.contentView addSubview:self.indicatorView];
            break;
        case UserCenterAccessoryTypeSwitch:
            [self.contentView addSubview:self.aswitch];
            break;
        default:
            break;
    }
}
- (void)switchTouched:(UISwitch *)sw
{
    __weak typeof(self) weakSelf = self;
    self.item.switchValueChanged(weakSelf.aswitch.isOn);
}
- (UIImageView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-arrow1"]];
        _indicatorView.centerY = self.contentView.centerY;
        _indicatorView.left = KScreenWidth - _indicatorView.width - KIndicatorToRightGap;
    }
    return _indicatorView;
}
- (UISwitch *)aswitch
{
    if (!_aswitch) {
        _aswitch = [[UISwitch alloc]init];
        _aswitch.centerY = self.contentView.centerY;
        _aswitch.left = KScreenWidth - _aswitch.width - KIndicatorToRightGap;
        [_aswitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
    }
    return _aswitch;
}
- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithImage:self.item.img];
        _imgView.left = KFuncImgToLeftGap;
        _imgView.centerY = self.contentView.centerY;
    }
    return _imgView;
}
- (UILabel *)funcNameLabel {
    if (!_funcNameLabel) {
        _funcNameLabel = [[UILabel alloc]init];
        _funcNameLabel.text = self.item.funcName;
        _funcNameLabel.textColor = KMakeColorWithRGB(51, 51, 51, 1);
        _funcNameLabel.font = [UIFont systemFontOfSize:KFuncLabelFont];
        _funcNameLabel.size = [self sizeForTitle:self.item.funcName withFont:self.funcNameLabel.font];
        _funcNameLabel.centerY = self.contentView.centerY;
        _funcNameLabel.left = CGRectGetMaxX(self.imgView.frame) + KFuncLabelToFuncImgGap;

    }
    return _funcNameLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
