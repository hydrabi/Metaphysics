//
//  CurrentSelectDate.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/16.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SubViewData.h"

@interface CurrentSelectDate : SubViewData
@property (nonatomic,assign)NSInteger gregorianYear;
@property (nonatomic,assign)NSInteger gregorianMonth;
@property (nonatomic,assign)NSInteger gregorianDay;
@property (nonatomic,assign)NSInteger gregorianHour;
@property (nonatomic,assign)NSInteger lunarYear;
@property (nonatomic,assign)NSInteger lunarMonth;
@property (nonatomic,assign)NSInteger lunarDay;
@property (nonatomic,assign)NSInteger lunarHour;
@end
