//
//  DepartmentListViewController.m
//  PopoverViewDemo
//
//  Created by YDHL on 2017/4/6.
//  Copyright © 2017年 guojiang. All rights reserved.
//

#import "DepartmentListViewController.h"

@interface DepartmentListViewController ()

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) NSArray *leftArr;

@property (nonatomic,strong) NSArray *rightArr;

@end

@implementation DepartmentListViewController

- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = @[@{@"病种":@[@"666",@"777",@"888"],@"记录":@[@"999",@"000"],@"常见":@[@"111",@"222",@"333",@"444",@"555"]}];
    }
    return _dataArr;
}

- (UITableView *)leftTable{
    if (_leftTable == nil) {
        _leftTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/3, kScreenHeight)];
        _leftTable.delegate = self;
        _leftTable.dataSource = self;
        
        UIView *view = [UIView new];
        _leftTable.tableFooterView = view;
    }
    return _leftTable;
}

- (UITableView *)rightTable{
    if (_rightTable == nil) {
        _rightTable = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth/3, 64, kScreenWidth*2/3, kScreenHeight)];
        _rightTable.delegate = self;
        _rightTable.dataSource=self;
        _rightTable.tableFooterView = [UIView new];
    }
    return _rightTable;
}
- (NSArray *)leftArr{
    if (_leftArr == nil) {
        _leftArr = [self.dataArr[0] allKeys];
    }
    return _leftArr;
}

- (void) setupRightDataArrWithLeftRows:(NSInteger) leftRow{
    NSString *key = self.leftArr[leftRow];
    NSArray *arr = self.dataArr[0][key];
    self.rightArr = arr;
    [self.rightTable reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.leftTable];
    [self.view addSubview:self.rightTable];
    [self setupRightDataArrWithLeftRows:0];
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTable) {
        return self.leftArr.count;
    }
    return self.rightArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString  *identifier = @"DepartmentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    if (tableView == self.leftTable) {
        cell.textLabel.text = self.leftArr[indexPath.row];
        cell.textLabel.textColor = [UIColor blueColor];
    }
    else{
        cell.textLabel.text =self.rightArr[indexPath.row];
    }
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTable) {
        [self setupRightDataArrWithLeftRows:indexPath.row];
    }
    else{
        NSLog(@"######点击了第%ld行",(long)indexPath.row);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
