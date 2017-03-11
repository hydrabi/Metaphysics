//
//  JiaZiCollectionViewCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/12.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "JiaZiCollectionViewCell.h"
#import "UIConstantParameter.h"
@implementation JiaZiCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
}

@end
