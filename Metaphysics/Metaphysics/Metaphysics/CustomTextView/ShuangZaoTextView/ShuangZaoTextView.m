//
//  ShuangZaoTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "ShuangZaoTextView.h"

@implementation ShuangZaoTextView

+(instancetype)instanceShuangZaoTextView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:nil
                                                    options:nil];
    return [nibView objectAtIndex:0];
}

@end
