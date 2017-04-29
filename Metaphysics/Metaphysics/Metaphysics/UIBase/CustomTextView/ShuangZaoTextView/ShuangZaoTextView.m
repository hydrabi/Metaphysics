//
//  ShuangZaoTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "ShuangZaoTextView.h"
#import "UIConstantParameter.h"
#import "JiaZiCollectionViewController.h"
#import "MainViewModel.h"
@implementation ShuangZaoTextView

+(instancetype)instanceShuangZaoTextView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:nil
                                                    options:nil];
    ShuangZaoTextView *view = [nibView objectAtIndex:0];
    [view bindViewModel];
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.mainButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_50];
    self.yearLabel.font = [UIFont systemFontOfSize:titleFontSize_40];
    self.monthLabel.font = [UIFont systemFontOfSize:titleFontSize_40];
    self.dayLabel.font = [UIFont systemFontOfSize:titleFontSize_40];
    self.hourLabel.font = [UIFont systemFontOfSize:titleFontSize_40];
    self.selectYearButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
    self.selectYearButton.tag = MiddleSubViewTypeYear;
    self.selectMonthButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
    self.selectMonthButton.tag = MiddleSubViewTypeMonth;
    self.selectDayButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
    self.selectDayButton.tag = MiddleSubViewTypeDay;
    self.selectHourButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
    self.selectHourButton.tag = MiddleSubViewTypeHour;
    self.daYunLabel1.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.daYunLabel2.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.daYunLabel3.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.daYunLabel4.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.daYunLabel5.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.daYunLabel6.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.daYunLabel7.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.textField1.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.textField2.font = [UIFont systemFontOfSize:titleFontSize_24];
    
    self.yearLabel.layer.borderWidth = 1.0f;
    self.yearLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.monthLabel.layer.borderWidth = 1.0f;
    self.monthLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.dayLabel.layer.borderWidth = 1.0f;
    self.dayLabel.layer.borderColor = [UIColor blackColor].CGColor;
    self.hourLabel.layer.borderWidth = 1.0f;
    self.hourLabel.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
}


-(IBAction)selectButtonAction:(UIButton*)sender{
    [JiaZiCollectionViewController presentViewControllerWithRect:sender.frame
                                                            view:self
                                                            type:sender.tag];
}

-(void)bindViewModel{
    MainViewModel *main = [MainViewModel sharedInstance];
    
    @weakify(self)
    [[[RACSignal combineLatest:@[RACObserve(main.shuangZaoData, year),
                               RACObserve(main.shuangZaoData, month),
                               RACObserve(main.shuangZaoData, day),
                               RACObserve(main.shuangZaoData, hour),]
                      reduce:^id(NSString *year,
                                 NSString *month,
                                 NSString *day,
                                 NSString *hour){
                          
                          return nil;
                      }]
      deliverOnMainThread]
     subscribeNext:^(id _){
         @strongify(self)
         [self resetValue];
         [self resetDaYun];
     }];
    
    ShuangZaoData *shuangZaoData = [[MainViewModel sharedInstance] shuangZaoData];
    [[self.mainButton
      rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id _){
         @strongify(self)
         if(shuangZaoData.universeType == UniverseTypeQian){
             shuangZaoData.universeType = UniverseTypeKun;
             [self.mainButton setTitle:@"坤"
                                forState:UIControlStateNormal];
         }
         else{
             shuangZaoData.universeType = UniverseTypeQian;
             [self.mainButton setTitle:@"乾"
                                forState:UIControlStateNormal];
         }
         [self resetDaYun];
     }];
}

-(void)resetValue{
    ShuangZaoData *data = [MainViewModel sharedInstance].shuangZaoData;
    self.yearLabel.text = data.year;
    self.monthLabel.text = data.month;
    self.dayLabel.text = data.day;
    self.hourLabel.text = data.hour;
}

-(void)resetDaYun{
    ShuangZaoData *data = [MainViewModel sharedInstance].shuangZaoData;
    BottomViewData *bottomData = [MainViewModel sharedInstance].bottomData;
    NSArray *daYunLabelArr = @[self.daYunLabel1,
                               self.daYunLabel2,
                               self.daYunLabel3,
                               self.daYunLabel4,
                               self.daYunLabel5,
                               self.daYunLabel6,
                               self.daYunLabel7,];
    
    NSArray *jiaZiArr = [MainViewModel sharedInstance].jiaZiArr;
    if(data.month.length>0){
        NSInteger yueZhuIndex = [jiaZiArr indexOfObject:data.month];
        for(NSInteger i = 0;i<daYunLabelArr.count;i++){
            UILabel *label = daYunLabelArr[i];
            label.text = [bottomData getDaYunWithTableIndex:i+1
                                               universeType:data.universeType
                                                     ganZhi:data.year
                                                yueZhuIndex:yueZhuIndex];
        }
    }
   
}

@end
