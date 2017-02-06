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
    self.numberLabel.font  = [UIFont systemFontOfSize:titleFontSize_30];
    self.daYunLabel.font  = [UIFont systemFontOfSize:titleFontSize_30];
    self.yearLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)resetValueWithIndexPath:(NSIndexPath*)indexPath{
    NSInteger index = 5*indexPath.section + indexPath.row + 1;
    NSString *result = @"";
    switch (index) {
        case 1:
            result = @"一";
            break;
        case 2:
            result = @"二";
            break;
        case 3:
            result = @"三";
            break;
        case 4:
            result = @"四";
            break;
        case 5:
            result = @"五";
            break;
        case 6:
            result = @"六";
            break;
        case 7:
            result = @"七";
            break;
        case 8:
            result = @"八";
            break;
        case 9:
            result = @"九";
            break;
        case 10:
            result = @"十";
            break;
        default:
            break;
    }
    self.numberLabel.text = result;
}

@end
