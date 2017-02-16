//
//  DatePickViewController.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/15.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "UIConstantParameter.h"
@interface DatePickViewController : BaseViewController
+(void)presentViewControllerWithRect:(CGRect)rect view:(UIView*)view type:(CalendarType)type;
-(instancetype)initWithCalendarType:(CalendarType)type;
@end
