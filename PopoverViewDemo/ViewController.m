//
//  ViewController.m
//  PopoverViewDemo
//
//  Created by guojiang on 4/9/14.
//  Copyright (c) 2014年 guojiang. All rights reserved.
//

#import "ViewController.h"
#import "PopoverView.h"


#import "BezierPathViewController.h"

#import "DepartmentListViewController.h"

#import "ContainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(40, 100,100 , 60)];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitle:@"有图标pop" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(180, 100,100 , 60)];
    [button2 setBackgroundColor:[UIColor orangeColor]];
    [button2 setTitle:@"无图标pop" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button2.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake((kScreenWidth - 100)/2, 200, 100, 40);
    [button3 setTitle:@"BezierPath" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(bezierPath:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button3];
    
    
    UIButton *button4 = [UIButton buttonWithType:0];
    button4.frame = CGRectMake((kScreenWidth - 150)/2, 250, 150, 40);
    [button4 setTitle:@"进入科室列表" forState:0];
    [button4 setTitleColor:[UIColor blueColor] forState:0];
    [button4 addTarget:self action:@selector(enterDepartment:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:0];
    button5.frame = CGRectMake((kScreenWidth - 150)/2, 300, 150, 40);
    [button5 setTitle:@"ViewController嵌套 " forState:0];
    [button5 setTitleColor:[UIColor blueColor] forState:0];
    [button5 addTarget:self action:@selector(ViewControllerContain) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    
    
    
}

- (void)enterDepartment:(UIButton *)sender{
    
    DepartmentListViewController *departListVC = [[DepartmentListViewController alloc] init];
    [self.navigationController pushViewController:departListVC animated:YES];
}
- (void)bezierPath:(UIButton *)sender{
    BezierPathViewController *bezierPathVC = [[BezierPathViewController alloc] init];
    [self.navigationController pushViewController:bezierPathVC animated:YES];
}

-(void)button1Clicked:(UIButton *)sender
{
    CGPoint point = CGPointMake(sender.frame.origin.x + sender.frame.size.width/2, sender.frame.origin.y + sender.frame.size.height);
    NSArray *titles = @[@"item1", @"选项2", @"选项3"];
    NSArray *images = @[@"28b.png", @"28b.png", @"28b.png"];
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:images];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%ld", index);
    };
    [pop show];
}

-(void)button2Clicked:(UIButton *)sender
{
    CGPoint point = CGPointMake(sender.frame.origin.x + sender.frame.size.width/2, sender.frame.origin.y + sender.frame.size.height);
    NSArray *titles = @[@"item1", @"选项2", @"选项3"];
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:nil];
    pop.selectRowAtIndex = ^(NSInteger index){
     
    };
    [pop show];
}


- (void)ViewControllerContain{
    ContainViewController *vcContainer = [[ContainViewController alloc] init];
    [self.navigationController pushViewController:vcContainer animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
