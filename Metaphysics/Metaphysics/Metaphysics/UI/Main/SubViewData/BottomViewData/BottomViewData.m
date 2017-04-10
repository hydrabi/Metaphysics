//
//  BottomViewData.m
//  Metaphysics
//
//  Created by Hydra on 2017/4/9.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomViewData.h"
#import "MainViewModel.h"
#import "NSString+Addition.h"
@implementation BottomViewData

-(void)initialize{
    self.qiYunShu = -1;
}

-(void)resetData{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    CurrentSelectDate *selectDate = mainViewModel.selectedDate;
    MiddleViewData *middleData = mainViewModel.middleData;
    RiZhuData *rizhu = mainViewModel.riZhuData;
    NSDate *leftTerm =  [self filterMinuteWithData:rizhu.leftTerm];
    NSDate *rightTerm = [self filterMinuteWithData:rizhu.rightTerm];
    NSDate *currentDate = selectDate.getGregorianDate;
    NSTimeInterval timeOffset = 0.0f;
    
    if(leftTerm && rightTerm){
        //男 阳顺阴逆
        if(middleData.universeType == UniverseTypeQian){
            
            if([[selectDate.ganZhiYear getBranches] isBranchesYang]){
                timeOffset = [currentDate timeIntervalSinceDate:leftTerm];
            }
            else{
                timeOffset = [rightTerm timeIntervalSinceDate:currentDate];
            }
        }
        //女 阳逆阴顺
        else{
            if([[selectDate.ganZhiYear getBranches] isBranchesYang]){
                timeOffset = [rightTerm timeIntervalSinceDate:currentDate];
            }
            else{
                timeOffset =  [currentDate timeIntervalSinceDate:leftTerm];
            }
        }
        [self countAgeWithTiemOffset:timeOffset];
    }
    
}

//计算起运数
-(void)countAgeWithTiemOffset:(NSTimeInterval)timeOffset{
    NSInteger hour = 60 * 60;
    NSInteger day = 24 * hour;
    NSInteger oneAndHalfDay = 1.5 * day;
    NSInteger threeDay = day * 3;
    NSInteger age = (NSInteger)(timeOffset / threeDay);
    //余数
    NSInteger ageRemainder = (NSInteger)((NSInteger)timeOffset % threeDay);
    if(ageRemainder >= oneAndHalfDay){
        age += 1;
    }
    else{
        if(age == 0){
            age = 1;
        }
    }
    self.qiYunShu = age;
}

-(NSDate*)filterMinuteWithData:(NSDate*)currentDate{
    if(currentDate){
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy"];
        NSInteger year = [[dateFormatter stringFromDate:currentDate] integerValue];
        [dateFormatter setDateFormat:@"MM"];
        NSInteger month = [[dateFormatter stringFromDate:currentDate] integerValue];
        [dateFormatter setDateFormat:@"dd"];
        NSInteger day = [[dateFormatter stringFromDate:currentDate] integerValue];
        [dateFormatter setDateFormat:@"HH"];
        NSInteger hour = [[dateFormatter stringFromDate:currentDate] integerValue];
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
        [components setYear:year];
        [components setMonth:month];
        [components setDay:day];
        [components setHour:hour];
        
        return [calendar dateFromComponents:components];
    }
    return nil;
}
@end
