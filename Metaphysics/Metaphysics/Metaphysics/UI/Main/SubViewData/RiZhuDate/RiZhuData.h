//
//  RiZhuDate.h
//  Metaphysics
//
//  Created by Hydra on 2017/3/5.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubViewData.h"
/**
 日柱资料
 */
@interface RiZhuData : SubViewData

/**
 当前公历年份
 */
@property (nonatomic,assign)NSInteger currentSolarYear;
/**
 该年所有节气的日期
 */
@property (nonatomic,strong)NSMutableArray *allTermsDateArr;
/**
 上一年所有节气的日期
 */
@property (nonatomic,strong)NSMutableArray *lastYearAllTermsDateArr;

/**
 干支月
 */
@property (nonatomic,strong)NSString *monthName;

/**
 左边的节气
 */
@property (nonatomic,strong)NSDate *leftTerm;
/**
 右边的节气
 */
@property (nonatomic,strong)NSDate *rightTerm;
/**
 左边的节气名称
 */
@property (nonatomic,strong)NSString *leftTermName;
/**
 右边的节气名称
 */
@property (nonatomic,strong)NSString *rightTermName;
/**
 分隔日数的队列
 */
@property (nonatomic,strong)NSArray *separatorDayArr;
/**
 分隔日数名称的队列
 */
@property (nonatomic,strong)NSArray *separatorDayNameArr;
/**
 根据年份创建所有节气得时间

 @param year 公历年份
 */
-(void)resetTermWithYear:(NSInteger)year;

/**
 处理日柱数据
 */
-(void)dealWithRiZhuData;
@end
