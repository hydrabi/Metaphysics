//
//  DatePickViewModel.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/15.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DatePickViewModel.h"

@interface DatePickViewModel()

@end

@implementation DatePickViewModel

-(void)initialize{
    self.yearsArr = @[].mutableCopy;
    self.monthsArr = @[].mutableCopy;
    self.daysArr = @[].mutableCopy;
    self.hoursArr = @[].mutableCopy;
    
    self.date = [MainViewModel sharedInstance].selectedDate;
}

-(void)setCalendarType:(CalendarType)calendarType{
    _calendarType = calendarType;
    [self createYearsArr];
    [self createMonthsArr];
    [self createDaysArr];
    [self createHoursArr];
}

-(void)getCurrentDate{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *inputDate = [NSDate date];
    NSDateComponents *dateComps = [calendar components:
                                   NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour
                                             fromDate:inputDate];
    self.date.gregorianYear = @(dateComps.year);
    self.date.gregorianMonth = @(dateComps.month);
    self.date.gregorianDay = @(dateComps.day);
    self.date.gregorianHour = @(dateComps.hour);
}
#pragma mark - 创建年
-(void)createYearsArr{
    [self.yearsArr removeAllObjects];
    
    for(NSInteger i=1900;i<=2100;i++){
        [self.yearsArr addObject:@(i)];
    }
}

#pragma mark - 创建月
-(void)createMonthsArr{
    [self.monthsArr removeAllObjects];
    if(self.calendarType == CalendarTypeGregorian){
        [self createGregorianMonth];
    }
    else{
        [self createLunarMonth];
    }
}

-(void)createGregorianMonth{
    for(NSInteger i=1;i<=12;i++){
        [self.monthsArr addObject:@(i)];
    }
}

-(void)createLunarMonth{
    NSInteger year = 1900;
    if(self.date.lunarYear != nil){
        year = self.date.lunarYear.integerValue;
    }
    int32_t leapMonth = [[MainViewModel sharedInstance] getLeapMonthWithYear:(int32_t)year];
    //有闰月
    if(leapMonth){
        self.leapMonth = leapMonth;
        for(NSInteger i=1;i<=12;i++){
            [self.monthsArr addObject:@(i)];
            if(leapMonth == i){
                [self.monthsArr addObject:@(i)];
            }
        }
    }
    //无闰月
    else{
        self.leapMonth = 0;
        [self createGregorianMonth];
    }
}

#pragma mark - 创建日
-(void)createDaysArr{
    if(self.calendarType == CalendarTypeGregorian){
        [self createGregorianDay];
    }
    else{
        [self createLunarDay];
    }
}

-(void)createGregorianDay{
    NSInteger dayCount = 30;
    if([self.date.gregorianMonth integerValue] == 2){
        if(([self.date.gregorianYear integerValue] % 4 == 0 && [self.date.gregorianYear integerValue] % 100 != 0)
           || [self.date.gregorianYear integerValue] % 400 == 0){
            dayCount = 29;
        }
        else{
            dayCount = 28;
        }
    }
    else if (4 == [self.date.gregorianMonth integerValue]
             || 6 == [self.date.gregorianMonth integerValue]
             || 9 == [self.date.gregorianMonth integerValue]
             || 11 == [self.date.gregorianMonth integerValue]){
        dayCount = 30;
    }
    else{
        dayCount = 31;
    }
    
    [self.daysArr removeAllObjects];
    for(NSInteger i = 1;i<=dayCount;i++){
        [self.daysArr addObject:@(i)];
    }
}

-(void)createLunarDay{
    NSInteger year = 1900;
    NSInteger month = 1;
    NSInteger dayCount = 30;
    if(self.date.lunarYear != nil){
        year = self.date.lunarYear.integerValue;
    }
    
    if(self.date.lunarMonth != nil){
        month = self.date.lunarMonth.integerValue;
    }
    
    if(self.date.isLeapMonth.boolValue){
        dayCount = [[MainViewModel sharedInstance] getLeapDayWithYear:(int32_t)year];
    }
    else{
        dayCount = [[MainViewModel sharedInstance] getLunarDayWithYear:(int32_t)year
                                                                 month:(int32_t)month];
    }
   
    [self.daysArr removeAllObjects];
    for(NSInteger i = 1;i<=dayCount;i++){
        [self.daysArr addObject:@(i)];
    }
}

#pragma mark - 创建时
-(void)createHoursArr{
    [self.hoursArr removeAllObjects];
    for(NSInteger i = 1;i<=24;i++){
        [self.hoursArr addObject:@(i)];
    }
}

@end
