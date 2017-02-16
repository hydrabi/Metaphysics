//
//  TopContentView.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceHolderView.h"

@interface TopContentView : UIView
@property (nonatomic,weak)IBOutlet UIButton *hideButton;
@property (nonatomic,weak)IBOutlet UITextField *firstTextField;
//农历选择按钮
@property (nonatomic,weak)IBOutlet UIButton *lunarCalendarSelectedButton;
//公历选择按钮
@property (nonatomic,weak)IBOutlet UIButton *gregorianCalendarSelectedButton;
//公历年
@property (nonatomic,weak)IBOutlet UITextField *gregorianYearTxt;
//公历月
@property (nonatomic,weak)IBOutlet UITextField *gregorianMonthTxt;
//公历日
@property (nonatomic,weak)IBOutlet UITextField *gregorianDayTxt;
//公历时
@property (nonatomic,weak)IBOutlet UITextField *gregorianHourTxt;
//农历年
@property (nonatomic,weak)IBOutlet UITextField *lunarYearTxt;
//农历月
@property (nonatomic,weak)IBOutlet UITextField *lunarMonthTxt;
//农历日
@property (nonatomic,weak)IBOutlet UITextField *lunarDayTxt;
//农历时
@property (nonatomic,weak)IBOutlet UITextField *lunarHourTxt;
+(instancetype)instanceTopContentView;
@end
