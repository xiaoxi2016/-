//
//  BezierPathView.m
//  PopoverViewDemo
//
//  Created by YDHL on 2017/4/6.
//  Copyright © 2017年 guojiang. All rights reserved.
//

#import "BezierPathView.h"


#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
@implementation BezierPathView


- (void)drawRect:(CGRect)rect {
    // Drawing code

 //五边形
    UIColor *color = [UIColor redColor];
    [color set];   //设置线条颜色
    UIBezierPath *aPath =[UIBezierPath bezierPath];
    aPath.lineWidth = 5.0f;
    aPath.lineCapStyle = kCGLineCapSquare;//线条拐角
    aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
    
    [aPath moveToPoint:CGPointMake(100.0, 250.0)];  //设置线条的起始点
    [aPath addLineToPoint:CGPointMake(200.0, 290)];
    [aPath addLineToPoint:CGPointMake(160., 390.0)];
    [aPath addLineToPoint:CGPointMake(40.0, 390)];
    [aPath addLineToPoint:CGPointMake(0.0, 290)];
    [aPath closePath];  //第五条线通过调用closePath 方法得到的
//    [aPath stroke]; //根据坐标点连线
    [aPath fill];  //  实心的填充

//    创建矩形
    UIColor *color1 = [UIColor redColor];
    [color1 set];//设置线条颜色
    UIBezierPath *apath = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 100, 50)];
    apath.lineWidth = 5.0f;
    apath.lineJoinStyle = kCGLineCapRound;//终点处理
    apath.lineCapStyle = kCGLineCapRound;//线条拐角
    [apath fill];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 165) radius:75 startAngle:0 endAngle:DEGREES_TO_RADIANS(360) clockwise:YES];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;//线条拐角
    path.lineJoinStyle = kCGLineJoinRound;//终点处理
    [path stroke];
//创建类似抛物线
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    bPath.lineWidth = 5.0;
    bPath.lineCapStyle = kCGLineCapRound;
    bPath.lineJoinStyle = kCGLineJoinRound;
    [bPath moveToPoint:CGPointMake(0, 450)];
    [bPath addQuadCurveToPoint:CGPointMake(140, 450) controlPoint:CGPointMake(70, 350)];
    [bPath stroke];
 //创建蛇形tuxing
    UIBezierPath *cPath = [UIBezierPath bezierPath];
    cPath.lineWidth = 5.0f;
    cPath.lineJoinStyle = kCGLineJoinRound;
    cPath.lineCapStyle = kCGLineJoinRound;
    [cPath moveToPoint:CGPointMake(150, 80)];
    
    [cPath addCurveToPoint:CGPointMake(300, 80) controlPoint1:CGPointMake(225, 30) controlPoint2:CGPointMake(225, 130)];
    [cPath stroke];
    UIBezierPath *dPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 70, 200, 100)];
    [[UIColor blueColor] setFill];
    CGContextRef aref = UIGraphicsGetCurrentContext();
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    
    //相对原始位置的坐标
    CGContextTranslateCTM(aref, 50, 50);
    dPath.lineWidth = 5;
    [dPath fill];
    
    
    
    
}


@end
