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
    NSMutableArray *termsNums = [[MainViewModel alloc] getTremWithYear:(int32_t)year];
    NSInteger month;
    NSInteger day;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    for(NSInteger i = 0;i<termsNums.count;i++){
        month = (NSInteger)((i/2)+1);
        day = [termsNums[i] integerValue];
        NSLog(@"%ld月%ld日",(long)month,(long)day);
        [components setYear:self.currentSolarYear];
        [components setMonth:month];
        [components setDay:day];
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

@end
