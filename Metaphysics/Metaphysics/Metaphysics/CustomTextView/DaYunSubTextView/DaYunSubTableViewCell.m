//
//  DaYunSubTableViewCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/5.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DaYunSubTableViewCell.h"
#import "UIConstantParameter.h"
@implementation DaYunSubTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.yearLabel.font  = [UIFont systemFontOfSize:titleFontSize_20];
    self.daYunLabel.font  = [UIFont systemFontOfSize:titleFontSize_30];
    self.xiaoYunLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)resetValueWithIndexPath:(NSIndexPath*)indexPath{
    
}

@end
