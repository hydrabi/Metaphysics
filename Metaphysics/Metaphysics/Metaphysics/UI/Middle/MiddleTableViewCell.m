//
//  MiddleTableViewCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/4/3.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "MiddleTableViewCell.h"
#import "UIConstantParameter.h"

@implementation MiddleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.shenShaLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
