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
    
    self.mainTitleLabel.font = [UIFont systemFontOfSize:titleFontSize_40];
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
    MainViewModel *main = [MainViewModel sharedInstance];
    if(main.hadHiddenBottomTableView){
        //不是隐藏的部分才可以点击数字显示底部大运窗口
        if(self.tableViewTag < main.hiddenBottomTableViewTag){
            [[MainViewModel sharedInstance] selectTableViewHeaderWithTag:self.tableViewTag];
        }
    }
    else{
        [[MainViewModel sharedInstance] selectTableViewHeaderWithTag:self.tableViewTag];
    }
    
}

-(void)reloadData{
    MainViewModel *main = [MainViewModel sharedInstance];
    if(main.fifteenYunData.fifteenYunSelectedNumber == self.tableViewTag){
        [self.bottomNumberTitleLabel setBoldFont];
    }
    else{
        [self.bottomNumberTitleLabel setOriginalFont];
    }
    //是否隐藏了整一列
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
    if(self.mainTitleLabel.text.length>0 &&
       bottomData.canStart){
        LiuQinData *liuQinData = middleData.liuQinData;
        CurrentSelectDate *selectData = mainViewModel.selectedDate;
        self.topTitleLabel.text = [liuQinData getLiuQinValueWithRiGanZhi:selectData.ganZhiDay
                                                             otherGanZhi:self.mainTitleLabel.text];
    }
    
}

//重置大运
-(void)resetDaYun{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    BottomViewData *bottomData = mainViewModel.bottomData;
    FifteenYunData *fifteenData = mainViewModel.fifteenYunData;
    if(bottomData.canStart){
        self.mainTitleLabel.text = [bottomData getDaYunWithTableIndex:self.tableViewTag];
        
        //设置选中颜色
        if(fifteenData.selectLocationArr.count>self.tableViewTag){
            DaYunTitleSelectLocation *location = fifteenData.selectLocationArr[self.tableViewTag];
            if(self.mainTitleLabel.text.length>0){
                NSMutableAttributedString *attributeString = nil;
                if(self.mainTitleLabel.attributedText.length>0){
                    attributeString = self.mainTitleLabel.attributedText.mutableCopy;
                }
                else{
                    attributeString = [[NSMutableAttributedString alloc] initWithString:self.mainTitleLabel.text];
                }
                
                if(location.selectedGan){
                    
                    [attributeString addAttribute:NSBackgroundColorAttributeName
                                            value:[UIColor grayColor]
                                            range:NSMakeRange(0, 1)];
                    self.mainTitleLabel.attributedText = attributeString;
                }
                
                if(location.selectedBranch){
                    [attributeString addAttribute:NSBackgroundColorAttributeName
                                            value:[UIColor grayColor]
                                            range:NSMakeRange(1, 1)];
                    self.mainTitleLabel.attributedText = attributeString;
                }
            }
            
        }
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

#pragma mark - 干支按钮点击
-(IBAction)ganButtonClick:(id)sender{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    FifteenYunData *fifteenData = mainViewModel.fifteenYunData;
    if(fifteenData.selectLocationArr.count>self.tableViewTag){
        DaYunTitleSelectLocation *location = fifteenData.selectLocationArr[self.tableViewTag];
        location.selectedGan = !location.selectedGan;
        [(RACSubject*)mainViewModel.reloadBottomTablesSig sendNext:nil];
    }
}

-(IBAction)zhiButtonClick:(id)sender{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    FifteenYunData *fifteenData = mainViewModel.fifteenYunData;
    if(fifteenData.selectLocationArr.count>self.tableViewTag){
        DaYunTitleSelectLocation *location = fifteenData.selectLocationArr[self.tableViewTag];
        location.selectedBranch = !location.selectedBranch;
        [(RACSubject*)mainViewModel.reloadBottomTablesSig sendNext:nil];
    }
    
}

@end
