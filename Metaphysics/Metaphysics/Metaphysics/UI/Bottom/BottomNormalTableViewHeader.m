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
    if(main.fifteenYunSelectedNumber == self.tableViewTag){
        [self.mainTitleButton.titleLabel setBoldFont];
    }
    else{
        [self.mainTitleButton.titleLabel setOriginalFont];
    }
    
    [self resetDaYun];
    [self resetLiuQin];
}

-(void)resetLiuQin{
    if(self.mainTitleButton.titleLabel.text.length>0){
        MainViewModel *mainViewModel = [MainViewModel sharedInstance];
        MiddleViewData *middleData = mainViewModel.middleData;
        LiuQinData *liuQinData = middleData.liuQinData;
        CurrentSelectDate *selectData = mainViewModel.selectedDate;
        self.topTitleLabel.text = [liuQinData getLiuQinValueWithRiGanZhi:selectData.ganZhiDay
                                                             otherGanZhi:self.mainTitleButton.titleLabel.text];
    }
    
}

//重置大运
-(void)resetDaYun{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    MiddleViewData *middleData = mainViewModel.middleData;
    CurrentSelectDate *selectData = mainViewModel.selectedDate;
    BottomViewData *bottomData = mainViewModel.bottomData;
    NSArray *jiaZiArr = [MainViewModel sharedInstance].jiaZiArr;
    if(jiaZiArr.count>0){
        NSString *ganZhiMonth = selectData.ganZhiMonth;
        NSString *ganZhiYear = selectData.ganZhiYear;
        UniverseType type = middleData.universeType;
        if(ganZhiMonth.length>0){
            //月柱在60甲子中的位置
            NSInteger index = [jiaZiArr indexOfObject:ganZhiMonth];
            
            if(type == UniverseTypeQian){
                //男 阳顺阴逆
                if([[ganZhiYear getBranches] isBranchesYang]){
                    [self positiveOrderWithCurrentIndex:index];
                }
                else{
                    [self reversedOrderWithCurrentIndex:index];
                }
            }
            else{
                //女 阳逆阴顺
                if([[ganZhiYear getBranches] isBranchesYang]){
                    [self reversedOrderWithCurrentIndex:index];
                }
                else{
                    [self positiveOrderWithCurrentIndex:index];
                }
            }
        }
    }
    
    if(bottomData.qiYunShu >= 0){
        self.bottomNumberTitleLabel.text = [NSString stringWithFormat:@"%ld",(self.tableViewTag - 1) * 10 + bottomData.qiYunShu] ;
    }
    
}

//逆序
-(void)reversedOrderWithCurrentIndex:(NSInteger)index{
    NSInteger realIndex = index - self.tableViewTag;
    NSArray *jiaZiArr = [MainViewModel sharedInstance].jiaZiArr;
    if(realIndex < 0){
        realIndex = jiaZiArr.count + realIndex;
    }
    [self.mainTitleButton setTitle:[jiaZiArr objectAtIndex:realIndex]
                          forState:UIControlStateNormal];
}

//顺序
-(void)positiveOrderWithCurrentIndex:(NSInteger)index{
    NSInteger realIndex = self.tableViewTag + index;
    NSArray *jiaZiArr = [MainViewModel sharedInstance].jiaZiArr;
    if(realIndex >= jiaZiArr.count){
        realIndex = realIndex - jiaZiArr.count;
    }
    [self.mainTitleButton setTitle:[jiaZiArr objectAtIndex:realIndex]
                          forState:UIControlStateNormal];
}

@end
