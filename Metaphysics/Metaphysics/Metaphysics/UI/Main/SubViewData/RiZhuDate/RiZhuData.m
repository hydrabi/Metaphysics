//
//  RiZhuDate.m
//  Metaphysics
//
//  Created by Hydra on 2017/3/5.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "RiZhuData.h"
#import "MainViewModel.h"
#import "NSArray+Addition.h"
@implementation RiZhuData

-(void)initialize{
    [super initialize];
    self.allTermsDateArr = @[].mutableCopy;
    self.lastYearAllTermsDateArr = @[].mutableCopy;
}

-(void)resetTermWithYear:(NSInteger)year{
    self.currentSolarYear = year;
    [self.allTermsDateArr removeAllObjects];
    NSMutableArray *termsNums = [[MainViewModel sharedInstance] getTremWithYear:(int32_t)year];
    NSInteger month;
    NSInteger day;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    //取该年节气的时间集合
    NSArray *solarTermTimeArr = [[MainViewModel sharedInstance].solarTermsTimeDic objectForKey:[NSString stringWithFormat:@"%ld",(long)year]];
    
    for(NSInteger i = 0;i<termsNums.count;i++){
        month = (NSInteger)((i/2)+1);
        day = [termsNums[i] integerValue];
        NSString *time = solarTermTimeArr[i];
        NSString *hour = [time substringWithRange:NSMakeRange(0, 2)];
        NSString *minute = [time substringWithRange:NSMakeRange(3, 2)];
        [components setYear:self.currentSolarYear];
        [components setMonth:month];
        [components setDay:day];
        [components setHour:hour.integerValue];
        [components setMinute:minute.integerValue];
        NSDate *date = [calendar dateFromComponents:components];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日HH时mm分"];
        NSLog(@"now:%@", [dateFormatter stringFromDate:date]);
        [self.allTermsDateArr addObject:date];
    }
    [self dealWithRiZhuData];
}

-(void)getTermWithLastYear:(NSInteger)lastYear{
    if(lastYear<1900){
        [self.lastYearAllTermsDateArr removeAllObjects];
        NSLog(@"超过1900上限，没有上一年");
        return;
    }
    
    [self.lastYearAllTermsDateArr removeAllObjects];
    NSMutableArray *termsNums = [[MainViewModel sharedInstance] getTremWithYear:(int32_t)lastYear];
    NSInteger month;
    NSInteger day;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    //取该年节气的时间集合
    NSArray *solarTermTimeArr = [[MainViewModel sharedInstance].solarTermsTimeDic objectForKey:[NSString stringWithFormat:@"%ld",(long)lastYear]];
    
    for(NSInteger i = 0;i<termsNums.count;i++){
        month = (NSInteger)((i/2)+1);
        day = [termsNums[i] integerValue];
        NSString *time = solarTermTimeArr[i];
        NSString *hour = [time substringWithRange:NSMakeRange(0, 2)];
        NSString *minute = [time substringWithRange:NSMakeRange(3, 2)];
        [components setYear:lastYear];
        [components setMonth:month];
        [components setDay:day];
        [components setHour:hour.integerValue];
        [components setMinute:minute.integerValue];
        NSDate *date = [calendar dateFromComponents:components];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSLog(@"now:%@", [dateFormatter stringFromDate:date]);
        [self.lastYearAllTermsDateArr addObject:date];
    }
}

//早于小寒取上年的大雪作为前边的节气，为子月，大雪-小寒
//早于立春为丑月，小寒-立春
//早于惊蛰为寅月，立春-惊蛰
//早于清明为卯月，惊蛰-清明
//早于立夏为辰月，清明-立夏
//早于芒种为巳月，立夏-芒种
//早于小暑为午月，芒种-小暑
//早于立秋为未月，小暑-立秋
//早于白露为申月，立秋-白露
//早于寒露为酉月，白露-寒露
//早于立冬为戌月，寒露-立冬
//早于大雪为亥月，立冬-大雪
//早于小寒为子月，大雪-小寒
-(void)dealWithRiZhuData{
    NSDate *selectedDate = [[MainViewModel sharedInstance].selectedDate getGregorianDate];
    NSArray *monthNames = [NSArray monthNameArr];
    for(NSInteger i = 0;i<self.allTermsDateArr.count;i+=2){
        NSDate *term = self.allTermsDateArr[i];
        if([selectedDate compare:term] == NSOrderedAscending){
            //早于小寒取上年的大雪作为前边的节气，为子月，大雪-小寒
            if(0 == i){
                [self getTermWithLastYear:([MainViewModel sharedInstance].selectedDate.gregorianYear.integerValue-1)];
                NSInteger daXueIndex = [[NSArray termsNameArr] indexOfObject:@"大雪"];
                if(self.lastYearAllTermsDateArr.count>(daXueIndex+1)){
                    self.leftTerm = self.lastYearAllTermsDateArr[daXueIndex];
                    self.rightTerm = self.allTermsDateArr[i];
                    self.leftTermName = [[NSArray termsNameArr] objectAtIndex:daXueIndex];
                    self.rightTermName = [[NSArray termsNameArr] objectAtIndex:i];
                    self.separatorDayArr = [NSArray separatorDayWithMonth:monthNames.count-1];
                    self.separatorDayNameArr = [NSArray separatorDayNameWithMonth:monthNames.count-1];
                    //子月
                    self.monthName = [monthNames objectAtIndex:monthNames.count-1];
                }
            }
            else{
                self.leftTerm = self.allTermsDateArr[i-2];
                self.rightTerm = self.allTermsDateArr[i];
                self.leftTermName = [[NSArray termsNameArr] objectAtIndex:i-2];
                self.rightTermName = [[NSArray termsNameArr] objectAtIndex:i];
                self.monthName = [monthNames objectAtIndex:(NSInteger)(i/2)];
                self.separatorDayArr = [NSArray separatorDayWithMonth:(NSInteger)(i/2)];
                self.separatorDayNameArr = [NSArray separatorDayNameWithMonth:(NSInteger)(i/2)];
            }
            break;
        }
        
    }
}



@end
