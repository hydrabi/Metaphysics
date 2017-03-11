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
@end
