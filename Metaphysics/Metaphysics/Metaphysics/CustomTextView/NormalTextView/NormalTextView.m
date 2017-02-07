//
//  NormalTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "NormalTextView.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
@implementation NormalTextView

+(instancetype)instanceNormalTextView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:titleFontSize_30];
    self.textView.scrollEnabled = NO;
    self.textView.font = [UIFont systemFontOfSize:titleFontSize_24];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
}

-(void)reloadData{
    self.titleLabel.text = [[MainViewModel sharedInstance] getSpecificMenuTitleWithType:[MainViewModel sharedInstance].currentBottomSectionMenuType];
}

@end
