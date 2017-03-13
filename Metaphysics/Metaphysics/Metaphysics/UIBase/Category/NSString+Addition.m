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

+(NSString*)shiChenWithTime:(NSInteger)time{
    NSString *shiChen = @"";
    switch (time) {
        case 23:
        case 0:
        {
            shiChen = @"子";
        }
            break;
        case 1:
        case 2:
        {
            shiChen = @"丑";
        }
            break;
        case 3:
        case 4:
        {
            shiChen = @"寅";
        }
            break;
        case 5:
        case 6:
        {
            shiChen = @"卯";
        }
            break;
        case 7:
        case 8:
        {
            shiChen = @"辰";
        }
            break;
        case 9:
        case 10:
        {
            shiChen = @"巳";
        }
            break;
        case 11:
        case 12:
        {
            shiChen = @"午";
        }
            break;
        case 13:
        case 14:
        {
            shiChen = @"未";
        }
            break;
        case 15:
        case 16:
        {
            shiChen = @"申";
        }
            break;
        case 17:
        case 18:
        {
            shiChen = @"酉";
        }
            break;
        case 19:
        case 20:
        {
            shiChen = @"戌";
        }
            break;
        case 21:
        case 22:
        {
            shiChen = @"戌";
        }
            break;
            
        default:
            break;
    }
    return shiChen;
}
@end
