//
//  CurrentSelectDate.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/16.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "CurrentSelectDate.h"

@implementation CurrentSelectDate

-(NSDate*)getGregorianDate{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [components setYear:[self.gregorianYear integerValue]];
    [components setMonth:[self.gregorianMonth integerValue]];
    [components setDay:[self.gregorianDay integerValue]];
    [components setHour:[self.gregorianHour integerValue]];
    [components setMinute:0];
    NSDate *date = [calendar dateFromComponents:components];
    return date;
}

@end
