//
//  NSArray+Addition.h
//  Metaphysics
//
//  Created by Hydra on 2017/3/11.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Addition)

/**
 创建干支

 @param stemsStr 天干字符串
 @param branchesStr 地支字符串
 @return 干支名称队列
 */
+(NSMutableArray*)jiaZiArrWithStemsStr:(NSString*)stemsStr branchesStr:(NSString*)branchesStr;

/**
 节气名称队列

 @return 节气名称队列
 */
+(NSArray*)termsNameArr;

/**
 月份名称队列

 @return 月份名称队列
 */
+(NSArray*)monthNameArr;

/**
 分隔月份的天数表，日柱表用

 @param month monthNameArr的对应索引
 @return 分隔月份的天数表
 */
+(NSArray*)separatorDayWithMonth:(NSInteger)month;

/**
 分隔月份名称的天数表，日柱表用

 @param month monthNameArr的对应索引
 @return 分隔月份名称的天数表
 */
+(NSArray*)separatorDayNameWithMonth:(NSInteger)month;

/**
 获取该年所有节气得准确时间

 @param year 那一年
 @param solarTermTimeArr 节气时间
 @param termsDate 节气日期
 @return 该年所有节气得准确时间
 */
+(NSMutableArray*)allTermsDateArrWithYear:(NSInteger)year solarTermTimeArr:(NSArray*)solarTermTimeArr termsDate:(NSMutableArray*)termsDate;
@end
