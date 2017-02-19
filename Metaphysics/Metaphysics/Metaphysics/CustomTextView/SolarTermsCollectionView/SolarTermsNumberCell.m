//
//  SolarTermsNumberCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/19.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SolarTermsNumberCell.h"
#import "UIConstantParameter.h"
@implementation SolarTermsNumberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.backgroundColor = [UIColor whiteColor];
}

@end
