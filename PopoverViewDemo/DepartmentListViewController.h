//
//  DepartmentListViewController.h
//  PopoverViewDemo
//
//  Created by Sissi on 2017/4/6.
//  Copyright © 2017年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepartmentListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *leftTable;

@property (nonatomic,strong) UITableView *rightTable;

@end
