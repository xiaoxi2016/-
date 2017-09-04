//
//  ContainChildViewController.m
//  PopoverViewDemo
//
//  Created by Xi on 2017/9/1.
//  Copyright © 2017年 guojiang. All rights reserved.
//

#import "ContainChildViewController.h"

#import "SortChildCell.h"

#define iDentify @"SortChildCell"

#define FooterViewHight         50

@interface ContainChildViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ContainChildViewController

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - FooterViewHight-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.index+3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SortChildCell *sortChildCell = [tableView dequeueReusableCellWithIdentifier:iDentify];
    if (sortChildCell == nil) {
        sortChildCell = [[SortChildCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDentify];
        
    }
    sortChildCell.BtnClick=^(UIButton *btn){
        CGRect rect = [tableView rectForRowAtIndexPath:indexPath];
        //获取当前cell 相对于self.view 当前的坐标
        CGRect btnRect = btn.frame;
        btnRect.origin.y = rect.origin.y+btnRect.origin.y;
        _addBtnClick(btnRect,btn);
        
    };
    return sortChildCell;
}


@end
