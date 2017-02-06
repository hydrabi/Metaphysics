//
//  DaYunSubTitleView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/6.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DaYunSubTitleView.h"
#import "UIConstantParameter.h"
@implementation DaYunSubTitleView

+(instancetype)instanceDaYunSubTitleView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:titleFontSize_30];
}

@end
