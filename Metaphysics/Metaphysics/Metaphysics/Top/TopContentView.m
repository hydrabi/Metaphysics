//
//  TopContentView.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "TopContentView.h"
#import "UIConstantParameter.h"
#import "DatePickViewController.h"
#import "MainViewModel.h"
//PlaceHolderView(TopContentView)

@implementation TopContentView

+(instancetype)instanceTopContentView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.hideButton setTitle:@"●" forState:UIControlStateNormal];
    self.hideButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
}

-(id)awakeAfterUsingCoder:(NSCoder *)aDecoder{
    
    return [super awakeAfterUsingCoder:aDecoder];
}

-(IBAction)hideButtonClickAction{
    self.firstTextField.hidden = !self.firstTextField.hidden;
}

//农历选择
-(IBAction)lunarCalendarSelecteAction:(UIButton*)sender{
    
}

//公历选择
-(IBAction)gregorianCalendarSelecteAction:(UIButton*)sender{
    [DatePickViewController presentViewControllerWithRect:sender.frame
                                                     view:self
                                                     type:CalendarTypeGregorian];
}

-(void)bindViewModel{
    MainViewModel *main = [MainViewModel sharedInstance];
//    [RACSignal combineLatest:@[main.] reduce:<#^id(void)reduceBlock#>]
}

@end
