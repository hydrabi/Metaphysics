//
//  SolarTermsFirstCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/19.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SolarTermsFirstCell.h"
#import "UIConstantParameter.h"
@implementation SolarTermsFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_40];
    self.backgroundColor = [UIColor whiteColor];
}

@end
