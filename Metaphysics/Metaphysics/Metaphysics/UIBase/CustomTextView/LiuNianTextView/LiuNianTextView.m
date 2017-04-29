//
//  LiuNianTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "LiuNianTextView.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
#import "BottomLocation.h"
@implementation LiuNianTextView

+(instancetype)instanceLiuNianTextView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    LiuNianTextView *view = [nibView objectAtIndex:0];
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textView.scrollEnabled = NO;
    self.textView.font = [UIFont systemFontOfSize:titleFontSize_24];
}

@end
