//
//  BaseContentView.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/29.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BaseContentView.h"

@implementation BaseContentView

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder{
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *xibName = NSStringFromClass([self class]);
    
    
    NSArray *viewArray = [mainBundle loadNibNamed:xibName      owner:nil options:nil];
    
    
    
    UIView *view =[viewArray firstObject];      //从xib加载view
    view.translatesAutoresizingMaskIntoConstraints = NO;                                                            //禁止将view的边距转换为约束
    return view;            //使用新的view替换本来的view
}

@end
