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

static CGFloat alphaNumber = 0.3;

@implementation BottomNormalTableViewHeader

+(instancetype)instanceBottomNormalTableViewHeader{
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:nil
                                                    options:nil];
    return nibViews[0];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.mainTitleButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_40];
    self.topTitleLabel.font = [UIFont systemFontOfSize:titleFontSize_24];
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
    if(main.fifteenYunData.fifteenYunSelectedNumber == self.tableViewTag){
        [self.mainTitleButton.titleLabel setBoldFont];
    }
    else{
        [self.mainTitleButton.titleLabel setOriginalFont];
    }
    
    if(main.hadHiddenBottomTableView){
        if(self.tableViewTag >= main.hiddenBottomTableViewTag){
            [self hideContent];
        }
        else{
            [self showContent];
        }
    }
    //展示
    else{
        [self showContent];
    }
    
    
    [self resetDaYun];
    [self resetLiuQin];
    [self resetQinYunNumber];
}

//重置六亲
-(void)resetLiuQin{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    MiddleViewData *middleData = mainViewModel.middleData;
    BottomViewData *bottomData = mainViewModel.bottomData;
    if(self.mainTitleButton.titleLabel.text.length>0 &&
       bottomData.canStart){
        LiuQinData *liuQinData = middleData.liuQinData;
        CurrentSelectDate *selectData = mainViewModel.selectedDate;
        self.topTitleLabel.text = [liuQinData getLiuQinValueWithRiGanZhi:selectData.ganZhiDay
                                                             otherGanZhi:self.mainTitleButton.titleLabel.text];
    }
    
}

//重置大运
-(void)resetDaYun{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    BottomViewData *bottomData = mainViewModel.bottomData;
    if(bottomData.canStart){
        [self.mainTitleButton setTitle:[bottomData getDaYunWithTableIndex:self.tableViewTag]
                              forState:UIControlStateNormal];
    }
}

//重置起运数目
-(void)resetQinYunNumber{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    BottomViewData *bottomData = mainViewModel.bottomData;
    if(bottomData.canStart){
        self.bottomNumberTitleLabel.text = [NSString stringWithFormat:@"%ld",(self.tableViewTag - 1) * 10 + bottomData.qiYunShu] ;
    }
}

#pragma mark - 隐藏
-(void)hideContent{
    self.alpha = alphaNumber;
}

-(void)showContent{
    self.alpha = 1;
}

@end
