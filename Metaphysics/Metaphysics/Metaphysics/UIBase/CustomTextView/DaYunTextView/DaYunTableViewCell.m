//
//  DaYunTableViewCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/2.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DaYunTableViewCell.h"
#import "UIConstantParameter.h"
@implementation DaYunTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.daYunLabel.font  = [UIFont systemFontOfSize:titleFontSize_24];
    self.qiYunLabel.font = [UIFont systemFontOfSize:titleFontSize_18];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
