//
//  main.m
//  LunarCalendar
//
//  Created by yhtian on 14-7-2.
//  Copyright (c) 2014年 Tian Youhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LunarCalendarWrapper.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {

        NSDateComponents *components = [[NSDateComponents alloc] init];
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
        [components setYear:2015];
        [components setMonth:1];
        [components setDay:12];
        [components setHour:01];
        
        [components setMinute:2];
        
        
        NSDate *date = [gregorian dateFromComponents:components];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSLog(@"now:%@", [dateFormatter stringFromDate:date]);
        LunarCalendarWrapper *wrapper = [LunarCalendarWrapper lunarWithDate:date];
        NSLog(@"%@", wrapper);
    }
    return 0;
}

