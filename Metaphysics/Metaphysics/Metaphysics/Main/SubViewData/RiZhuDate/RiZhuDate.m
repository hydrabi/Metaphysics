//
//  RiZhuDate.m
//  Metaphysics
//
//  Created by Hydra on 2017/3/5.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "RiZhuDate.h"
#import "MainViewModel.h"
@implementation RiZhuDate

-(void)initialize{
    [super initialize];
    self.allTermsDateArr = @[].mutableCopy;
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
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSLog(@"now:%@", [dateFormatter stringFromDate:date]);
        [self.allTermsDateArr addObject:date];
    }
    
}

+(NSArray*)termsNameArr{
    return @[@"小寒",
             @"大寒",
             @"立春",
             @"雨水",
             @"惊蛰",
             @"春分",
             @"清明",
             @"谷雨",
             @"立夏",
             @"小满",
             @"芒种",
             @"夏至",
             @"小暑",
             @"大暑",
             @"立秋",
             @"处暑",
             @"白露",
             @"秋分",
             @"寒露",
             @"霜降",
             @"立冬",
             @"小雪",
             @"大雪",
             @"冬至"];
}

+(NSArray*)monthNameArr{
    return @[
             @"丑月",
             @"寅月",
             @"卯月",
             @"辰月",
             @"巳月",
             @"午月",
             @"未月",
             @"申月",
             @"酉月",
             @"戌月",
             @"亥月",
             @"子月",
             ];
}

@end
