//
//  LYTPrivatelyToors.h
//  addProject
//
//  Created by 云盛科技 on 2017/7/26.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PrivatelyToors : NSObject<CAAnimationDelegate>

//加入购物车动画
+(void)animationWithView:(UIView *)view startCenter:(CGPoint)start finishCenter:(CGPoint)finish;

//跑马灯动画
+(void)addMarqueeAnimationWithView:(UIView *)view;
@end
