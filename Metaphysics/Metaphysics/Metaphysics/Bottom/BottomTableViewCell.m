//
//  BottomTableViewCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomTableViewCell.h"

@implementation BottomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)hideContent{
    self.yearLabel.hidden = YES;
    self.daYunLabel.hidden = YES;
}

-(void)showContent{
    self.yearLabel.hidden = NO;
    self.daYunLabel.hidden = NO;
}

-(void)selectCell:(BOOL)select{
    if(select){
        self.backgroundColor = [UIColor lightGrayColor];
    }
    else{
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
