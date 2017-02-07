//
//  BottomNormalTableViewHeader.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomNormalTableViewHeader.h"
#import "UIConstantParameter.h"
#import "NSString+Addition.h"
#import "MainViewModel.h"
#import "UILabel+Addition.h"
@implementation BottomNormalTableViewHeader

+(instancetype)instanceBottomNormalTableViewHeader{
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:nil
                                                    options:nil];
    return nibViews[0];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.mainTitleButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_50];
    self.topTitleLabel.font = [UIFont systemFontOfSize:titleFontSize_28];
    self.bottomNumberTitleLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    
    [self.hideTableViewButton setTitleColor:[UIColor blackColor]
                              forState:UIControlStateNormal];
    self.hideTableViewButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
    [self.hideTableViewButton setTitle:@"●"
                         forState:UIControlStateNormal];
}

-(IBAction)hiddenAction{
    [[MainViewModel sharedInstance] hiddenTableViewWithTag:self.tableViewTag];
}

-(IBAction)selectHeader{
    [[MainViewModel sharedInstance] selectTableViewHeaderWithTag:self.tableViewTag];
}

-(void)reloadData{
    MainViewModel *main = [MainViewModel sharedInstance];
    if(main.fifteenYunSelectedNumber == self.tableViewTag){
        [self.mainTitleButton.titleLabel setBoldFont];
    }
    else{
        [self.mainTitleButton.titleLabel setOriginalFont];
    }
}

@end
