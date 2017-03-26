//
//  NSString+Addition.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/1.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)
+ (NSString *)convertToIconTextWithHexString:(NSString *)hexStr;

/**
 天干字符串

 @return 天干字符串
 */
+(NSString*)stemsStr;

/**
 地支字符串

 @return 地支字符串
 */
+(NSString*)branchesStr;

/**
 对应的时间转换为时辰

 @param time 对应的时
 @return 对应的时辰
 */
+(NSString*)shiChenWithTime:(NSInteger)time;

/**
 获取干支时

 @param hour 当前选中时间
 @param day 当前已经得到的干支日
 @return 时的干支
 */
+(NSString*)ganZhiHourWithHour:(NSInteger)hour day:(NSString*)day;
@end
