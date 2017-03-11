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
@end
