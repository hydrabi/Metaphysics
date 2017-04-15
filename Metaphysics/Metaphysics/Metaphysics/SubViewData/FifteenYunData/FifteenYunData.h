//
//  FifteenYunData.h
//  Metaphysics
//
//  Created by Hydra on 2017/4/15.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SubViewData.h"

/**
 点击大运出现十五运窗口数据
 */
@interface FifteenYunData : SubViewData
//正在点击的15运
@property (nonatomic,assign)NSInteger fifteenYunSelectedNumber;
//15运数据字典，以后按照此来存储数据到coredata， fifteenYunSelectedNumber为key，value为存放textField内容的队列
@property (nonatomic,strong)NSMutableDictionary *fifteenYunDic;
@end
