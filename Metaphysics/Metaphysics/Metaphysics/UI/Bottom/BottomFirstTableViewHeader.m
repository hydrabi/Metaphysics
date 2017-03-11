//
//  BottomFirstTableViewHeader.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomFirstTableViewHeader.h"
#import "UIConstantParameter.h"
@implementation BottomFirstTableViewHeader

+(instancetype)instanceBottomFirstTableViewHeader{
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:nil
                                                    options:nil];
    return nibViews[0];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.mainTitleLabel.font = [UIFont systemFontOfSize:titleFontSize_50];
    self.mainTitleLabel.text = @"";
}

@end
