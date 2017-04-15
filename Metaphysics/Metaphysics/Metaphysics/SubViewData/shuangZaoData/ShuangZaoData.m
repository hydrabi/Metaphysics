//
//  ShuangZaoData.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/13.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "ShuangZaoData.h"
#import "MainViewModel.h"
#import "NSArray+Addition.h"
#import "NSString+Addition.h"
@implementation ShuangZaoData

-(void)initialize{
    self.year = [NSArray jiaZiArr][0];
    self.day = [NSArray jiaZiArr][0];
}

-(void)setYear:(NSString *)year{
    _year = year;
    self.month = [NSArray getMonthGanZhiArrWithStems:[self.year getStems]][0];
}

-(void)setDay:(NSString *)day{
    _day = day;
    self.hour = [NSString ganZhiHourWithHour:0
                                         day:self.day];
}

-(void)resetData{
//    self.mainTitle = @"";
//    self.year = @"";
//    self.month = @"";
//    self.day = @"";
//    self.hour = @"";
//    self.text1 = @"";
//    self.text2 = @"";
}

@end
