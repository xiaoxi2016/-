//
//  LYTSortChildCell.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/26.
//  Copyright © 2017年 神廷. All rights reserved.
//
#define kScreenWidth1       ([UIScreen mainScreen].bounds.size.width / 375)     //适配宽度
#define kScreenHeight1      ([UIScreen mainScreen].bounds.size.height / 667)    //适配高度

#import "SortChildCell.h"

@implementation SortChildCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.img];
        [self addSubview:self.titleLabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.soldLabel];
        [self addSubview:self.addBtn];
    }
    return self;
}

- (UIImageView *)img
{
    if (!_img) {
        CGRect frame = CGRectMake(10 * kScreenWidth1, 10* kScreenHeight1, 80 * kScreenWidth1, 80* kScreenHeight1);
        self.img = [[UIImageView alloc] init];
        _img.frame = frame;
        _img.backgroundColor = [UIColor blackColor];
    }
    return _img;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        CGRect frame = CGRectMake(100 * kScreenWidth1, 10* kScreenHeight1, 175 * kScreenWidth1, 20* kScreenHeight1);
        _titleLabel = [[UILabel alloc]initWithFrame:frame];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _titleLabel.text = @"小魔仙服装有限公司";
    }
    return _titleLabel;
}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        CGRect frame = CGRectMake(100 * kScreenWidth1, 30* kScreenHeight1, 175 * kScreenWidth1, 20* kScreenHeight1);
        _contentLabel = [[UILabel alloc]initWithFrame:frame];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _contentLabel.text = @"小魔仙服装有限公司内容";
    }
    return _contentLabel;
}
- (UILabel *)soldLabel {
    if (!_soldLabel) {
        CGRect frame = CGRectMake(100 * kScreenWidth1, 50* kScreenHeight1, 175 * kScreenWidth1, 20* kScreenHeight1);
        _soldLabel = [[UILabel alloc]initWithFrame:frame];
        _soldLabel.font = [UIFont systemFontOfSize:12];
        _soldLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
//        _soldLabel.textAlignment = NSTextAlignmentRight;
        _soldLabel.text = @"已售200";
    }
    return _soldLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        CGRect frame = CGRectMake(100 * kScreenWidth1, 70* kScreenHeight1, 175 * kScreenWidth1, 30* kScreenHeight1);
        _moneyLabel = [[UILabel alloc]initWithFrame:frame];
        _moneyLabel.font = [UIFont systemFontOfSize:18];
        _moneyLabel.textColor = [UIColor colorWithRed:78 / 255.0 green:78 / 255.0 blue:78 / 255.0 alpha:1];
        _moneyLabel.text = @"¥98";
    }
    return _moneyLabel;
}


-(UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.frame = CGRectMake(255, 60, 30, 30);
        _addBtn.backgroundColor = [UIColor redColor];
        [_addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}
-(void)addBtnClick:(UIButton *)sender{
    self.BtnClick(sender);
}

@end
