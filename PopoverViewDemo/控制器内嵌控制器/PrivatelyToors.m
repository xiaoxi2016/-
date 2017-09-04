//
//  LYTPrivatelyToors.m
//  addProject
//
//  Created by 云盛科技 on 2017/7/26.
//  Copyright © 2017年 神廷. All rights reserved.
//

#import "PrivatelyToors.h"



@implementation PrivatelyToors


+(void)animationWithView:(UIView *)view startCenter:(CGPoint)start finishCenter:(CGPoint)finish{
    
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, start.x, start.y);//移动到起始点
    CGPathAddQuadCurveToPoint(path, NULL, finish.x, start.y, finish.x, finish.y);
    keyframeAnimation.path = path;
    CGPathRelease(path);

//    NSLog(@"两个点坐标1----%@ \n  2-----%@  \n   3------%@",NSStringFromCGPoint(start),NSStringFromCGPoint(CGPointMake(finish.x, start.y)),NSStringFromCGPoint(finish));
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:1.0f];
    anima2.byValue = [NSNumber numberWithFloat:2.0f];
    anima2.toValue = [NSNumber numberWithFloat:1.0f];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*8];
    //组动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:keyframeAnimation,anima2,anima3, nil];
    groupAnimation.duration = 1.0f;
    [view.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

+(void)addMarqueeAnimationWithView:(UIView *)view{
    
    UIView *animationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    animationView.backgroundColor = [UIColor  yellowColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    label.text = @">>";
    label.textAlignment = NSTextAlignmentCenter;
    [animationView addSubview:label];
    
    [view addSubview:animationView];
    //创建动画对象
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置value
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(0, 0)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(view.frame.size.width - 0, 0)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(view.frame.size.width , view.frame.size.height )];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(0, view.frame.size.height )];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(0, 0)];
    
    animation.values=@[value1,value2,value3,value4,value5];
    
    //重复次数 默认为1
    animation.repeatCount=MAXFLOAT;
    
    //设置是否原路返回默认为不
//    animation.autoreverses = YES;
    
    //设置移动速度，越小越快
    animation.duration = 5.0f;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    NSLog(@"keyTimes---%@",animation.values);
    //给这个view加上动画效果
    [animationView.layer addAnimation:animation forKey:nil];
    
    
    [UIView animateWithDuration:5/4 animations:^{
        [UIView setAnimationRepeatCount:MAXFLOAT];
        //旋转动画
        CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation2.toValue = [NSNumber numberWithFloat:M_PI/2];
        [animationView.layer addAnimation:animation2 forKey:@"a"];
    } completion:^(BOOL finished) {
        
    }];
    
    
//
//    //组动画
//    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
//    groupAnimation.animations = [NSArray arrayWithObjects:animation,animation2, nil];
//    groupAnimation.duration = 5.0f;
//    [animationView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
}

@end
