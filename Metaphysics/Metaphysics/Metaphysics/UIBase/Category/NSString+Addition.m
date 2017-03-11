//
//  NSString+Addition.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/1.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

+ (NSString *)convertToIconTextWithHexString:(NSString *)hexStr{
    
    if (!hexStr) {
        return @"";
    }
    //1.将json中的iconText 转换成16进制
    unsigned long hex = strtoul([hexStr UTF8String], 0, 16);
    //2.将16进制强制转换成unsigned short
    unichar ll = hex;
    
    //3.在转成NSString
    return [[NSString alloc] initWithCharacters:&ll length:1];
    
}

+(NSString*)stemsStr{
    return @"甲乙丙丁戊己庚辛壬癸";
}

+(NSString*)branchesStr{
    return @"子丑寅卯辰巳午未申酉戌亥";
}
@end
