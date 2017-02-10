//
//  ShuangZaoTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "ShuangZaoTextView.h"
#import "UIConstantParameter.h"
@implementation ShuangZaoTextView

+(instancetype)instanceShuangZaoTextView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                      owner:nil
                                                    options:nil];
    return [nibView objectAtIndex:0];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.mainButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_50];
//    self.yearLabel.font = [UIFont systemFontOfSize:<#(CGFloat)#>]
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
}

@end
