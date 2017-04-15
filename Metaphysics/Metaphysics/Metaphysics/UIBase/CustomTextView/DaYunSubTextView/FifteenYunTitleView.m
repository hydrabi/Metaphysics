//
//  FifteenYunTitleView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/6.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "FifteenYunTitleView.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
@implementation FifteenYunTitleView

+(instancetype)instanceFifteenYunTitleView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:titleFontSize_26];
}

-(void)reloadData{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    BottomViewData *bottomData = mainViewModel.bottomData;
    if(bottomData.canStart){
        NSString *ganZhi = [bottomData getDaYunWithTableIndex:mainViewModel.fifteenYunData.fifteenYunSelectedNumber];
        NSString *qiYun = [NSString stringWithFormat:@"%ld",(mainViewModel.fifteenYunData.fifteenYunSelectedNumber - 1) * 10 + bottomData.qiYunShu] ;
        self.titleLabel.text = [NSString stringWithFormat:@"%@ %@",ganZhi,qiYun];
    }
    
}

@end
