//
//  DrawLayerLabel.m
//  Metaphysics
//
//  Created by Hydra on 2017/4/29.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DrawLayerView.h"

@implementation DrawLayerView


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //箭头和填充白色
    CGPoint leftBottomPoint = CGPointMake(rect.origin.x, rect.origin.y+rect.size.height);
    CGPoint topLeftPoint = CGPointMake(rect.origin.x, rect.origin.y);
    CGPoint topRightPoint = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y);
    CGPoint rightBottomPoint = CGPointMake(rect.origin.x + rect.size.width, rect.origin.y+rect.size.height);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, leftBottomPoint.x, leftBottomPoint.y);
    CGContextAddLineToPoint(context, topLeftPoint.x, topLeftPoint.y);

    CGContextAddLineToPoint(context, topRightPoint.x, topRightPoint.y);

    CGContextAddLineToPoint(context, rightBottomPoint.x, rightBottomPoint.y);
    CGContextStrokePath(context);
}


@end
