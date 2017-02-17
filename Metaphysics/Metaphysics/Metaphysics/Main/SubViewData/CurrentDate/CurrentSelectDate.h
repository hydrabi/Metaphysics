//
//  CurrentSelectDate.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/16.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SubViewData.h"

@interface CurrentSelectDate : SubViewData
@property (nonatomic,assign)NSNumber *gregorianYear;
@property (nonatomic,assign)NSNumber * gregorianMonth;
@property (nonatomic,assign)NSNumber * gregorianDay;
@property (nonatomic,assign)NSNumber * gregorianHour;
@property (nonatomic,assign)NSNumber * lunarYear;
@property (nonatomic,assign)NSNumber * lunarMonth;
@property (nonatomic,assign)NSNumber * lunarDay;
@property (nonatomic,assign)NSNumber * lunarHour;
@end
