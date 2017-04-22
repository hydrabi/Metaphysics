//
//  UIColor+Addition.h
//  Metaphysics
//
//  Created by Hydra on 2017/4/22.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

/**
 获取对应纳音的颜色

 @param targetStr 目标字符串
 @return 颜色
 */
+(UIColor*)getColorWithString:(NSString*)targetStr;
@end
