//
//  ViewControllerContain.m
//  PopoverViewDemo
//
//  Created by Xi on 2017/9/1.
//  Copyright © 2017年 guojiang. All rights reserved.
//

#import "ContainViewController.h"

#import "ContainChildViewController.h"

#import "PrivatelyToors.h"

#define TableWidth              80                              //tableView的宽
#define TableCellHight          30                              //tableViewCell的高

#define FooterViewHight         50                              //顶部子视图高度

#define  Identify  @"SortTableCell"

@interface SortTableCell : UITableViewCell
@property(nonatomic,retain)UILabel *label;
@end
@implementation SortTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.label];
    }
    return self;
}
-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, TableWidth, TableCellHight)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
    }
    return _label;
}
@end


@interface ContainViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *sortTable;

@property(nonatomic,strong)NSArray          *sortArr;           //控制器分类项目
@property(nonatomic,strong)UIViewController *currentVC;         //当前显示的子视图

@property(nonatomic,retain)NSMutableArray   *BtnArr;            //存储动画按钮的数组

@property (nonatomic,strong) UIView *footView;
@end

@implementation ContainViewController


- (NSMutableArray *)BtnArr{
    if (_BtnArr == nil) {
        _BtnArr = [NSMutableArray array];
    }
    return _BtnArr;
}
- (UITableView *)sortTable{
    if (_sortTable == nil) {
        _sortTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, TableWidth, kScreenHeight-FooterViewHight)];
        _sortTable.delegate = self;
        _sortTable.dataSource = self;
        [_sortTable registerClass:[SortTableCell class] forCellReuseIdentifier:Identify];
        _sortTable.tableFooterView = [[UIView alloc] init];
    }
    return _sortTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.sortTable];
    self.sortArr = @[@"套餐一",@"套餐二",@"套餐三",@"套餐四",@"套餐五"];
    [self configChildVC];
    [self configFootView];
}


- (void)configChildVC{
    for (int i = 0; i < self.sortArr.count; i++) {
        ContainChildViewController *vc= [[ContainChildViewController alloc] init];
        [vc.view setFrame:CGRectMake(TableWidth, 64, kScreenWidth - TableWidth, kScreenHeight-64- FooterViewHight)];
        [self addChildViewController:vc];
        vc.addBtnClick = ^(CGRect rect, UIButton *sender){
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(TableWidth + rect.origin.x, 64 + rect.origin.y, 30, 30);
            btn.backgroundColor = [UIColor redColor];
            [self.view addSubview:btn];
            [self.BtnArr addObject:btn];
            //                [sender sendSubviewToBack:btn];
            [UIView animateWithDuration:1 animations:^{
                [PrivatelyToors animationWithView:btn startCenter:CGPointMake(TableWidth + rect.origin.x + 15, 64 + rect.origin.y + 15) finishCenter:CGPointMake(40, 617)];
            } completion:^(BOOL finished) {
                [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0f];
            }];
        };
        vc.index = i;
        if (i == 0) {
            self.currentVC = vc;
            [self.view addSubview:vc.view];
        }
    }
}

-(void)configFootView{
    _footView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - FooterViewHight, kScreenWidth, FooterViewHight)];
    _footView.backgroundColor = [UIColor redColor];
    [self.view bringSubviewToFront:_footView];
    [self.view addSubview:_footView];
    
    //购物车按钮
    UIButton *shopCartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopCartBtn.frame = CGRectMake(20, -20, 40,  40);
    shopCartBtn.backgroundColor = [UIColor greenColor];
    shopCartBtn.layer.cornerRadius = 20;
    shopCartBtn.layer.masksToBounds = YES;
    [_footView addSubview:shopCartBtn];
    [shopCartBtn addTarget:self action:@selector(shopCartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //金额
    UILabel *moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 200, 30)];
    moneyLabel.text = @"¥ 98.00";
    moneyLabel.font = [UIFont systemFontOfSize:25];
    [_footView addSubview:moneyLabel];
    
    
    //结算
    UIButton *settlementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    settlementBtn.frame = CGRectMake(275, 0, 100,  50);
    settlementBtn.backgroundColor = [UIColor greenColor];
    [_footView addSubview:settlementBtn];
    [settlementBtn addTarget:self action:@selector(settlementBtnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)delayMethod{
    for (UIView *view in self.BtnArr) {
        [view removeFromSuperview];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return TableCellHight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sortArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SortTableCell *sortTableCell = [tableView dequeueReusableCellWithIdentifier:Identify];
    sortTableCell.label.text = self.sortArr[indexPath.row];
    if (indexPath.row == 0) {
        sortTableCell.selected = YES;
    }
    return sortTableCell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ContainChildViewController *vc = self.childViewControllers[indexPath.row];
    [vc.view setFrame:CGRectMake(TableWidth, 64, kScreenWidth - TableWidth,  kScreenHeight-64- FooterViewHight)];
    vc.view.backgroundColor = [UIColor yellowColor];
    [self replaceController:self.currentVC newController:vc];
    
}

#pragma mark - 切换viewController

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
{
    /**
     *            着重介绍一下它
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     *  animations              转换过程中得动画
     *  completion              转换完成
     */
    
    //    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:1.0 options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
        if (finished) {
            [oldController willMoveToParentViewController:nil];
            [newController didMoveToParentViewController:self];
            [self.view addSubview:newController.view];
           
            //            [oldController removeFromParentViewController];
            self.currentVC = newController;
            
        }else{
            
            self.currentVC = oldController;
            
        }
    }];
}


-  (void)shopCartBtnClick:(UIButton *)sender{
    
}

- (void)settlementBtnBtnClick:(UIButton *)sender{
    
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
