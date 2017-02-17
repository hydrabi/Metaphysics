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

-(void)createYearsArr{
    [self.yearsArr removeAllObjects];
    
    for(NSInteger i=1899;i<=2100;i++){
        [self.yearsArr addObject:@(i)];
    }
}

-(void)createMonthsArr{
    [self.monthsArr removeAllObjects];
    for(NSInteger i=1;i<=12;i++){
        [self.monthsArr addObject:@(i)];
    }
}

-(void)createDaysArr{
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

-(void)createHoursArr{
    [self.hoursArr removeAllObjects];
    for(NSInteger i = 1;i<=12;i++){
        [self.hoursArr addObject:@(i)];
    }
}

@end
