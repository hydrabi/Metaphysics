//
//  CurrentSelectDate.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/16.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SubViewData.h"

@interface CurrentSelectDate : SubViewData
@property (nonatomic,strong)NSNumber *gregorianYear;
@property (nonatomic,strong)NSNumber * gregorianMonth;
@property (nonatomic,strong)NSNumber * gregorianDay;
@property (nonatomic,strong)NSNumber * gregorianHour;
@property (nonatomic,strong)NSNumber * lunarYear;
@property (nonatomic,strong)NSNumber * lunarMonth;
@property (nonatomic,strong)NSNumber * lunarDay;
@property (nonatomic,strong)NSNumber * lunarHour;
@property (nonatomic,strong)NSNumber * isLeapMonth;
@property (nonatomic,strong)NSString * ganZhiYear;
@property (nonatomic,strong)NSString * ganZhiMonth;
@property (nonatomic,strong)NSString * ganZhiDay;
@property (nonatomic,strong)NSString * ganZhiHour;
/**
 当前节气
 */
@property (nonatomic,strong)NSString *currentTermName;

/**
 命宫
 */
@property (nonatomic,strong)NSString *mingGong;

/**
 胎元
 */
@property (nonatomic,strong)NSString *taiYuan;

/**
 获取当前的日期

 @return 当前的日期
 */
-(NSDate*)getGregorianDate;
//计算胎元
-(void)countTaiYuan;
//计算命宫
-(void)countMingGong;
@end
