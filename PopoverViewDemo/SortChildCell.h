//
//  LYTSortChildCell.h
//  addProject
//
//  Created by 云盛科技 on 2017/7/26.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortChildCell : UITableViewCell
@property(nonatomic,retain)UIImageView *img;

@property(nonatomic,retain)UILabel *titleLabel;         //标题
@property(nonatomic,retain)UILabel *contentLabel;       //内容
@property(nonatomic,retain)UILabel *soldLabel;          //已售
@property(nonatomic,retain)UILabel *moneyLabel;         //金额

@property(nonatomic,retain)UIButton *addBtn;            //添加


@property (nonatomic , copy)void(^BtnClick)(UIButton *sender);

@end
