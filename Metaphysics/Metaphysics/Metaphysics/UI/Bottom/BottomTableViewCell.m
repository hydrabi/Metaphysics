//
//  BottomTableViewCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomTableViewCell.h"
#import "UILabel+Addition.h"
#import "UIConstantParameter.h"

static CGFloat alphaNumber = 0.3;

@implementation BottomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.yearLabel.font = [UIFont systemFontOfSize:titleFontSize_18];
    self.liuNianLabel.font = [UIFont systemFontOfSize:titleFontSize_26];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)hideContent{
    self.yearLabel.alpha = alphaNumber;
    self.liuNianLabel.alpha = alphaNumber;
    
}

-(void)showContent{
    self.yearLabel.alpha = 1;
    self.liuNianLabel.alpha = 1;
    
}

-(void)selectCell:(BOOL)select{
    if(select){
        self.liuNianLabel.backgroundColor = [UIColor grayColor];
    }
    else{
        self.liuNianLabel.backgroundColor = [UIColor clearColor];
    }
}

@end
