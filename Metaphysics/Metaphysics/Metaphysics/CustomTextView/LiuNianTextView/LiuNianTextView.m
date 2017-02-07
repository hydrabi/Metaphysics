//
//  LiuNianTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "LiuNianTextView.h"
#import "UIConstantParameter.h"
@implementation LiuNianTextView

+(instancetype)instanceLiuNianTextView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.yearLabel.font  = [UIFont systemFontOfSize:titleFontSize_20];
    self.daYunLabel.font  = [UIFont systemFontOfSize:titleFontSize_30];
    self.xiaoYunLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.textView.scrollEnabled = NO;
    self.textView.font = [UIFont systemFontOfSize:titleFontSize_24];
}


-(void)reloadData{
    
}
@end
