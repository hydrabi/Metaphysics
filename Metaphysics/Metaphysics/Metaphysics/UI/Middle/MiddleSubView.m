//
//  MiddleSubView.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/29.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "MiddleSubView.h"
#import "UIConstantParameter.h"
#import "NSString+Addition.h"
#import "MainViewModel.h"
#import "MiddleTableViewDataSource.h"
@interface MiddleSubView()
@property (nonatomic,weak)IBOutlet UIView *innerView;
@property (nonatomic,strong)MiddleTableViewDataSource *tableViewDataSource;
@end

@implementation MiddleSubView

+(instancetype)instanceMiddleSubViewWithType:(MiddleSubViewType)type{
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                   owner:nil
                                                 options:nil];
    UIView *temp = nibView[0];
    if([temp isKindOfClass:[MiddleSubView class]]){
        MiddleSubView *subview = (MiddleSubView*)temp;
        subview.type = type;
        [subview UIConfig];
    }
    return nibView[0];
}

-(MiddleTableViewDataSource*)tableViewDataSource{
    if(_tableViewDataSource == nil){
        _tableViewDataSource = [[MiddleTableViewDataSource alloc] initWithTableView:self.tableView
                                                                        subViewType:self.type];
    }
    return _tableViewDataSource;
}

-(void)UIConfig{
    
    self.horLine1Label.font = [UIFont systemFontOfSize:titleFontSize_50];
    self.horLine2Label.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.horLine3Label.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.verLineLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    
    self.topLeftLabel.font = [UIFont systemFontOfSize:titleFontSize_26];
    self.topRightLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.bottomLeftLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.bottomRightLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    
    self.topLeftLabel.textAlignment = NSTextAlignmentCenter;
//    self.topLeftLabel.layer.borderWidth = 1.0f;
//    self.topLeftLabel.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.innerView.layer.borderWidth = 1.0f;
    self.innerView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.showFormButton setTitleColor:[UIColor blackColor]
                              forState:UIControlStateNormal];
    self.showFormButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
    [self.showFormButton setTitle:@"●"
                         forState:UIControlStateNormal];
    self.showFormButton.hidden = YES;
    
    self.tableView.delegate = self.tableViewDataSource;
    self.tableView.dataSource = self.tableViewDataSource;
    
    self.verLineLabel.useTheSameColor = YES;
    
    [self clearData];
}

-(IBAction)showFormButtonAction:(id)sender{
    [MainViewModel sharedInstance].hadShowSolarTermsCollectionView = ![MainViewModel sharedInstance].hadShowSolarTermsCollectionView;
}

-(void)clearData{
    switch (self.type) {
        case MiddleSubViewTypeYear:
        {
            self.horLine1Label.text = @"";
            self.horLine2Label.text = @"";
            self.horLine3Label.text = @"";
            self.verLineLabel.text = @"";
            self.topLeftLabel.text = @"";
            self.topRightLabel.text = @"";
            self.bottomLeftLabel.text = @"";
            self.bottomRightLabel.text = @"";
        }
            break;
        case MiddleSubViewTypeMonth:
        {
            self.horLine1Label.text = @"";
            self.horLine2Label.text = @"";
            self.horLine3Label.text = @"";
            self.verLineLabel.text = @"";
            self.topLeftLabel.text = @"";
            self.topRightLabel.text = @"";
            self.bottomLeftLabel.text = @"";
            self.bottomRightLabel.text = @"";
        }
            break;
        case MiddleSubViewTypeDay:
        {
            self.horLine1Label.text = @"";
            self.horLine2Label.text = @"";
            self.horLine3Label.text = @"";
            self.verLineLabel.text = @"";
            self.topLeftLabel.text = @"";
            self.topRightLabel.text = @"";
            self.bottomLeftLabel.text = @"";
            self.bottomRightLabel.text = @"";
            self.showFormButton.hidden = NO;
        }
            break;
        case MiddleSubViewTypeHour:
        {
            self.horLine1Label.text = @"";
            self.horLine2Label.text = @"";
            self.horLine3Label.text = @"";
            self.verLineLabel.text = @"";
            self.topLeftLabel.text = @"";
            self.topRightLabel.text = @"";
            self.bottomLeftLabel.text = @"";
            self.bottomRightLabel.text = @"";
        }
            break;
            
        default:
            break;
    }
}

-(void)reloadData{
    [self clearData];
    
    CurrentSelectDate *current = [MainViewModel sharedInstance].selectedDate;
    LiuQinData *liuQinData = [MainViewModel sharedInstance].middleData.liuQinData;
    CangGanData *cangGanData = [MainViewModel sharedInstance].middleData.cangGanData;
    NaYinData *naYinData = [MainViewModel sharedInstance].middleData.naYinData;
    ShenShaData *shenShaData = [MainViewModel sharedInstance].middleData.shenShaData;
    switch (self.type) {
        case MiddleSubViewTypeYear:
        {
            self.horLine1Label.text = current.ganZhiYear;
            self.horLine2Label.text = cangGanData.yearCangGan;
            self.horLine3Label.text = liuQinData.yearBottomLiuQin;
            self.verLineLabel.text  = naYinData.yearNaYin;
            self.topLeftLabel.text  = liuQinData.yearTopLiuQin;
        }
            break;
        case MiddleSubViewTypeMonth:
        {
            self.horLine1Label.text = current.ganZhiMonth;
            self.horLine2Label.text = cangGanData.monthCangGan;
            self.horLine3Label.text = liuQinData.monthBottomLiuQin;
            self.verLineLabel.text  = naYinData.monthNaYin;
            self.topLeftLabel.text = liuQinData.monthTopLiuQin;
            
            if(shenShaData.bottomMonthShenShaArr.count>0){
                self.bottomRightLabel.text = shenShaData.bottomMonthShenShaArr[0];
            }
            
            if(shenShaData.bottomMonthShenShaArr.count>1){
                self.bottomLeftLabel.text = shenShaData.bottomMonthShenShaArr[1];
            }
        }
            break;
        case MiddleSubViewTypeDay:
        {
            self.horLine1Label.text = current.ganZhiDay;
            self.horLine2Label.text = cangGanData.dayCangGan;
            self.horLine3Label.text = liuQinData.dayBottomLiuQin;
            self.verLineLabel.text  = naYinData.dayNaYin;
            self.topLeftLabel.text = liuQinData.dayTopLiuQin;
            
            if(shenShaData.bottomDayShenShaArr.count>0){
                self.bottomRightLabel.text = shenShaData.bottomDayShenShaArr[0];
            }
            
            if(shenShaData.bottomDayShenShaArr.count>1){
                self.bottomLeftLabel.text = shenShaData.bottomDayShenShaArr[1];
            }
        }
            break;
        case MiddleSubViewTypeHour:
        {
            self.horLine1Label.text = current.ganZhiHour;
            self.horLine2Label.text = cangGanData.hourCangGan;
            self.horLine3Label.text = liuQinData.hourBottomLiuQin;
            self.verLineLabel.text  = naYinData.hourNaYin;
            self.topLeftLabel.text = liuQinData.hourTopLiuQin;
            if(shenShaData.topHourShenShaArr.count>0){
                self.topRightLabel.text = shenShaData.topHourShenShaArr[0];
            }
            
            if(shenShaData.bottomHourShenShaArr.count>0){
                self.bottomRightLabel.text = shenShaData.bottomHourShenShaArr[0];
            }
            
            if(shenShaData.bottomHourShenShaArr.count>1){
                self.bottomLeftLabel.text = shenShaData.bottomHourShenShaArr[1];
            }
        }
            break;
            
        default:
            break;
    }
    
    [self.tableView reloadData];
}

@end
