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
@interface MiddleSubView()
    
@property (nonatomic,weak)IBOutlet UIView *innerView;
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

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

-(void)UIConfig{
    
    self.horLine1Label.font = [UIFont systemFontOfSize:titleFontSize_50];
    self.horLine2Label.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.horLine3Label.font = [UIFont systemFontOfSize:titleFontSize_24];
    self.verLineLabel.font = [UIFont systemFontOfSize:titleFontSize_24];
    
    self.topLeftLabel.font = [UIFont systemFontOfSize:titleFontSize_26];
    self.topRightLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.bottomLeftLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.bottomRightLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    
    self.innerView.layer.borderWidth = 1.0f;
    self.innerView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.showFormButton setTitleColor:[UIColor blackColor]
                              forState:UIControlStateNormal];
    self.showFormButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
    [self.showFormButton setTitle:@"●"
                         forState:UIControlStateNormal];
    self.showFormButton.hidden = YES;
    
    switch (self.type) {
        case MiddleSubViewTypeYear:
        {
            self.bottomLeftLabel.text = @"";
            self.bottomRightLabel.text = @"";
            self.topRightLabel.text = @"";
        }
            break;
        case MiddleSubViewTypeMonth:
        {
            self.topRightLabel.text = @"";
            self.bottomLeftLabel.text = @"";
            self.bottomRightLabel.text = @"滚浪桃花";
        }
            break;
        case MiddleSubViewTypeDay:
        {
            self.topLeftLabel.text = @"日元";
            self.topRightLabel.text = @"";
            self.showFormButton.hidden = NO;
        }
            break;
        case MiddleSubViewTypeHour:
        {
            
        }
            break;
            
        default:
            break;
    }
}

@end
