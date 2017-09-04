//
//  ContainChildViewController.h
//  PopoverViewDemo
//
//  Created by Xi on 2017/9/1.
//  Copyright © 2017年 guojiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainChildViewController : UIViewController

@property (nonatomic,assign) NSInteger index;

@property(nonatomic,copy)void(^addBtnClick)(CGRect rect,UIButton *sender);

@end
