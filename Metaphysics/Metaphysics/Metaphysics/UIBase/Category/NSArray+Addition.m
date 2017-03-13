//
//  NSArray+Addition.m
//  Metaphysics
//
//  Created by Hydra on 2017/3/11.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "NSArray+Addition.h"

@implementation NSArray (Addition)

+(NSMutableArray*)jiaZiArrWithStemsStr:(NSString*)stemsStr branchesStr:(NSString*)branchesStr{
    NSMutableArray *arr = @[].mutableCopy;
    NSInteger i = 0;
    NSInteger j = 0;
    for(NSInteger index = 0; index < 60; index++){
        NSString *stem = [stemsStr substringWithRange:NSMakeRange(i, 1)];
        NSString *branch = [branchesStr substringWithRange:NSMakeRange(j, 1)];
        NSString *jiaZi = [NSString stringWithFormat:@"%@%@",stem,branch];
        [arr addObject:jiaZi];
        
        i++;
        j++;
        if(i == stemsStr.length){
            i = 0;
        }
        
        if(j==branchesStr.length){
            j = 0;
        }
    }
    return arr;
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

//寅月： 戊7日    丙7日    甲16日
//卯月：         甲10日    乙20日
//辰月： 乙9日    癸3日    戊18日
//巳月： 戊5日    庚9日    丙16日
//午月：丙10日    己9日    丁11日
//未月： 丁9日    乙3日    己18日
//申月：戊10日    壬3日    庚17日
//酉月：         庚10日    辛20日
//戌月： 辛9日    丁3日    戊18日
//亥月： 戊7日    甲5日    壬18日
//子月：         壬10日    癸20日
//丑月： 癸9日    辛3日    己18日
+(NSArray*)separatorDayWithMonth:(NSInteger)month{
    NSArray *separatorDayArr = nil;
    switch (month) {
        case 0:
        {
            //丑月
            separatorDayArr = @[@(9),
                                @(3),
                                @(18)];
        }
            break;
        case 1:
        {
            //寅月
            separatorDayArr = @[@(7),
                                @(7),
                                @(16)];
        }
            break;
        case 2:
        {
            //卯月
            separatorDayArr = @[@(10),
                                @(20),
                                ];
        }
            break;
        case 3:
        {
            //辰月
            separatorDayArr = @[@(9),
                                @(3),
                                @(18)
                                ];
        }
            break;
        case 4:
        {
            //巳月
            separatorDayArr = @[@(5),
                                @(9),
                                @(16)
                                ];
        }
            break;
        case 5:
        {
            //午月
            separatorDayArr = @[@(10),
                                @(9),
                                @(11)
                                ];
        }
            break;
        case 6:
        {
            //未月
            separatorDayArr = @[@(9),
                                @(3),
                                @(18)
                                ];
        }
            break;
        case 7:
        {
            //申月
            separatorDayArr = @[@(10),
                                @(3),
                                @(17)
                                ];
        }
            break;
        case 8:
        {
            //酉月
            separatorDayArr = @[@(10),
                                @(20),
                                ];
        }
            break;
        case 9:
        {
            //戌月
            separatorDayArr = @[@(9),
                                @(3),
                                @(18),
                                ];
        }
            break;
        case 10:
        {
            //亥月
            separatorDayArr = @[@(7),
                                @(5),
                                @(18),
                                ];
        }
            break;
        case 11:
        {
            //子月
            separatorDayArr = @[@(10),
                                @(20),
                                ];
        }
            break;
            
        default:
            break;
    }
    return separatorDayArr;
}

+(NSArray*)separatorDayNameWithMonth:(NSInteger)month{
    NSArray *separatorDayArr = nil;
    switch (month) {
        case 0:
        {
            //丑月
            separatorDayArr = @[@"癸9日",
                                @"辛3日",
                                @"己18日"];
        }
            break;
        case 1:
        {
            //寅月
            separatorDayArr = @[@"戊7日",
                                @"丙7日",
                                @"甲16日"];
        }
            break;
        case 2:
        {
            //卯月
            separatorDayArr = @[@"甲10日",
                                @"乙20日"];
        }
            break;
        case 3:
        {
            //辰月
            separatorDayArr = @[@"乙9日",
                                @"癸3日",
                                @"戊18日"];
        }
            break;
        case 4:
        {
            //巳月
            separatorDayArr = @[@"戊5日",
                                @"庚9日",
                                @"丙16日"];
        }
            break;
        case 5:
        {
            //午月
            separatorDayArr = @[@"丙10日",
                                @"己9日",
                                @"丁11日"];
        }
            break;
        case 6:
        {
            //未月
            separatorDayArr = @[@"丁9日",
                                @"乙3日",
                                @"己18日"];
        }
            break;
        case 7:
        {
            //申月
            separatorDayArr = @[@"戊10日",
                                @"壬3日",
                                @"庚17日"];
        }
            break;
        case 8:
        {
            //酉月
            separatorDayArr = @[@"庚10日",
                                @"辛20日",
                                ];
        }
            break;
        case 9:
        {
            //戌月
            separatorDayArr = @[@"辛9日",
                                @"丁3日",
                                @"戊18日"];
        }
            break;
        case 10:
        {
            //亥月
            separatorDayArr = @[@"戊7日",
                                @"甲5日",
                                @"壬18日"];
        }
            break;
        case 11:
        {
            //子月
            separatorDayArr = @[@"壬10日",
                                @"癸20日",
                                ];
        }
            break;
            
        default:
            break;
    }
    return separatorDayArr;
}

+(NSMutableArray*)allTermsDateArrWithYear:(NSInteger)year solarTermTimeArr:(NSArray*)solarTermTimeArr termsDate:(NSMutableArray*)termsDate{
    NSMutableArray *resultArr = @[].mutableCopy;
    NSInteger month;
    NSInteger day;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    for(NSInteger i = 0;i<termsDate.count;i++){
        month = (NSInteger)((i/2)+1);
        day = [termsDate[i] integerValue];
        NSString *time = solarTermTimeArr[i];
        NSString *hour = [time substringWithRange:NSMakeRange(0, 2)];
        NSString *minute = [time substringWithRange:NSMakeRange(3, 2)];
        [components setYear:year];
        [components setMonth:month];
        [components setDay:day];
        [components setHour:hour.integerValue];
        [components setMinute:minute.integerValue];
        NSDate *date = [calendar dateFromComponents:components];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日HH时mm分"];
        NSLog(@"now:%@", [dateFormatter stringFromDate:date]);
        [resultArr addObject:date];
    }
    return resultArr;
}

@end
