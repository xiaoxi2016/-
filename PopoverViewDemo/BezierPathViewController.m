//
//  BezierPathViewController.m
//  PopoverViewDemo
//
//  Created by YDHL on 2017/4/6.
//  Copyright © 2017年 guojiang. All rights reserved.
//

#import "BezierPathViewController.h"

#import "BezierPathView.h"

@interface BezierPathViewController ()

@end

@implementation BezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    BezierPathView *bezierPathView = [[BezierPathView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64)];
    bezierPathView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bezierPathView];
    
    
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
