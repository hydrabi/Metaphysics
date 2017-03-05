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
@interface RiZhuDate : SubViewData

/**
 当前公历年份
 */
@property (nonatomic,assign)NSInteger currentSolarYear;
/**
 该年所有节气的日期
 */
@property (nonatomic,strong)NSMutableArray *allTermsDateArr;

/**
 根据年份创建所有节气得时间

 @param year 公历年份
 */
-(void)resetTermWithYear:(NSInteger)year;
@end
