//
//  SolarTermsMulLineCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/19.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SolarTermsMulLineCell.h"
#import "UIConstantParameter.h"
@implementation SolarTermsMulLineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_30];
    self.backgroundColor = [UIColor whiteColor];
}

@end
