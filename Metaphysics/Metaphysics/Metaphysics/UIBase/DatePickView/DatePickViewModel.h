//
//  DatePickViewModel.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/15.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BaseViewModel.h"
#import "UIConstantParameter.h"
@interface DatePickViewModel : BaseViewModel
@property (nonatomic,assign)CalendarType calendarType;
@property (nonatomic,strong)NSMutableArray *yearsArr;
@property (nonatomic,strong)NSMutableArray *monthsArr;
@property (nonatomic,strong)NSMutableArray *daysArr;
@property (nonatomic,strong)NSMutableArray *hoursArr;
@property (nonatomic,assign)NSInteger currentSelectYear;
@property (nonatomic,assign)NSInteger currentSelectMonth;
@property (nonatomic,assign)NSInteger currentSelectDay;
@property (nonatomic,assign)NSInteger currentSelectHour;
@end
