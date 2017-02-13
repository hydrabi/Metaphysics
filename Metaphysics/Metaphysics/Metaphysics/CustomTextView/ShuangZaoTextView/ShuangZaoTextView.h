//
//  ShuangZaoTextView.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^callBack)();

@interface ShuangZaoTextView : UIView
@property (nonatomic,weak)IBOutlet UIButton *mainButton;
@property (nonatomic,weak)IBOutlet UILabel *yearLabel;
@property (nonatomic,weak)IBOutlet UILabel *monthLabel;
@property (nonatomic,weak)IBOutlet UILabel *dayLabel;
@property (nonatomic,weak)IBOutlet UILabel *hourLabel;
@property (nonatomic,weak)IBOutlet UIButton *selectYearButton;
@property (nonatomic,weak)IBOutlet UIButton *selectMonthButton;
@property (nonatomic,weak)IBOutlet UIButton *selectDayButton;
@property (nonatomic,weak)IBOutlet UIButton *selectHourButton;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel1;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel2;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel3;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel4;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel5;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel6;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel7;
@property (nonatomic,weak)IBOutlet UITextField *textField1;
@property (nonatomic,weak)IBOutlet UITextField *textField2;

+(instancetype)instanceShuangZaoTextView;
@end
