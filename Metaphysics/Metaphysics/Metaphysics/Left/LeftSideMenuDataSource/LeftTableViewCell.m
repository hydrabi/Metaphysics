//
//  LeftTableViewCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "LeftTableViewCell.h"
#import "UIConstantParameter.h"
#import "UILabel+Addition.h"
@implementation LeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.menuLabel.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.menuLabel.textColor = [UIColor blackColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)resetValueWithType:(LeftSideMenuType)type{
    MainViewModel *main = [MainViewModel sharedInstance];
    self.menuLabel.text = [main getSpecificMenuTitleWithType:type];
    if(main.currentBottomSectionMenuType == type ||
       main.currentTopSectionMenuType == type){
        [self.menuLabel setBoldFont];
    }
    else{
        [self.menuLabel setOriginalFont];
    }
}

@end
