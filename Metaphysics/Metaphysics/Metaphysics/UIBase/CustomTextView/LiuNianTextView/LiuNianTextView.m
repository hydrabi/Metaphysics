//
//  LiuNianTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "LiuNianTextView.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
#import "BottomLocation.h"
@implementation LiuNianTextView

+(instancetype)instanceLiuNianTextView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    LiuNianTextView *view = [nibView objectAtIndex:0];
    [view bindViewModel];
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.yearLabel.font  = [UIFont systemFontOfSize:titleFontSize_20];
    self.liuNianLabel.font  = [UIFont systemFontOfSize:titleFontSize_30];
    self.xiaoYunLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.textView.scrollEnabled = NO;
    self.textView.font = [UIFont systemFontOfSize:titleFontSize_24];
    
    self.yearLabel2.font  = [UIFont systemFontOfSize:titleFontSize_20];
    self.liuNianLabel2.font  = [UIFont systemFontOfSize:titleFontSize_30];
    self.xiaoYunLabel2.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.textView2.scrollEnabled = NO;
    self.textView2.font = [UIFont systemFontOfSize:titleFontSize_24];
}

-(void)bindViewModel{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    LiuNianData *liuNianData = mainViewModel.liuNianData;
    @weakify(self)
    [[RACObserve(liuNianData, firstLocation) merge:RACObserve(liuNianData, secondLocation)]
     subscribeNext:^(id _){
         @strongify(self)
         [self reloadData];
     }];
}

-(void)reloadData{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    LiuNianData *liuNianData = mainViewModel.liuNianData;
    BottomViewData *bottomData = mainViewModel.bottomData;
    BottomLocation *firstLocation = liuNianData.firstLocation;
    BottomLocation *secondLocation = liuNianData.secondLocation;
    
    if(firstLocation){
        [bottomData fillContentWithTableIndex:firstLocation.tag
                                 tableSection:firstLocation.section
                                     tableRow:firstLocation.row
                                        block:^(NSString *liuNian,NSString *xiaoYun,NSString *year){
                                            self.yearLabel.text = year;
                                            self.liuNianLabel.text = liuNian;
                                            self.xiaoYunLabel.text = xiaoYun;
                                            self.colonLabel.text = @":";
                                        }];
    }
    else{
        self.yearLabel.text = @"";
        self.liuNianLabel.text = @"";
        self.xiaoYunLabel.text = @"";
        self.colonLabel.text = @"";
    }
    
    if(secondLocation){
        [bottomData fillContentWithTableIndex:secondLocation.tag
                                 tableSection:secondLocation.section
                                     tableRow:secondLocation.row
                                        block:^(NSString *liuNian,NSString *xiaoYun,NSString *year){
                                            self.yearLabel2.text = year;
                                            self.liuNianLabel2.text = liuNian;
                                            self.xiaoYunLabel2.text = xiaoYun;
                                            self.colonLabel2.text = @":";
                                        }];
    }
    else{
        self.yearLabel2.text = @"";
        self.liuNianLabel2.text = @"";
        self.xiaoYunLabel2.text = @"";
        self.colonLabel2.text = @"";
    }
}

-(IBAction)clearButtonAction:(id)sender{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    LiuNianData *liuNianData = mainViewModel.liuNianData;
    [liuNianData.bottomLocationDic removeAllObjects];
    liuNianData.firstLocation = nil;
    liuNianData.secondLocation = nil;
    mainViewModel.hadShowLiuNianTextView = NO;
    [(RACSubject*)mainViewModel.LiuNianTextViewOperationSig sendNext:nil];
    [(RACSubject*)mainViewModel.reloadBottomTablesSig sendNext:nil];
}
@end
