//
//  BottomFirstTableViewHeader.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomFirstTableViewHeader.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
@implementation BottomFirstTableViewHeader

+(instancetype)instanceBottomFirstTableViewHeader{
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:nil
                                                    options:nil];
    return nibViews[0];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.mainTitleLabel.font = [UIFont systemFontOfSize:titleFontSize_50];
    self.mainTitleLabel.text = @"";
}

//恢复操作
-(IBAction)recoverAction{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    //隐藏流年窗口
    LiuNianData *liuNianData = mainViewModel.liuNianData;
    [liuNianData.bottomLocationDic removeAllObjects];
    liuNianData.firstLocation = nil;
    liuNianData.secondLocation = nil;
    mainViewModel.hadShowLiuNianTextView = NO;
    //隐藏底部大运窗口
    [mainViewModel selectTableViewHeaderWithTag:mainViewModel.fifteenYunData.fifteenYunSelectedNumber];
    //清空15运
    FifteenYunData *fifteenData = mainViewModel.fifteenYunData;
    [fifteenData clearData];
    
    [(RACSubject*)mainViewModel.LiuNianTextViewOperationSig sendNext:nil];
    [(RACSubject*)mainViewModel.reloadBottomTablesSig sendNext:nil];
}

@end
