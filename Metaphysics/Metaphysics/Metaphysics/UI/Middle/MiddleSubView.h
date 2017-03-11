//
//  MiddleSubView.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/29.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewModel.h"
@interface MiddleSubView : UIView
@property (nonatomic,assign)MiddleSubViewType type;
@property (nonatomic,weak)IBOutlet UILabel *topLeftLabel;
@property (nonatomic,weak)IBOutlet UILabel *topRightLabel;
@property (nonatomic,weak)IBOutlet UILabel *bottomLeftLabel;
@property (nonatomic,weak)IBOutlet UILabel *bottomRightLabel;
@property (nonatomic,weak)IBOutlet UILabel *horLine1Label;
@property (nonatomic,weak)IBOutlet UILabel *horLine2Label;
@property (nonatomic,weak)IBOutlet UILabel *horLine3Label;
@property (nonatomic,weak)IBOutlet UILabel *verLineLabel;
@property (nonatomic,weak)IBOutlet UIButton *showFormButton;
+(instancetype)instanceMiddleSubViewWithType:(MiddleSubViewType)type;

@end
