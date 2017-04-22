//
//  UIColor+Addition.m
//  Metaphysics
//
//  Created by Hydra on 2017/4/22.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

+(UIColor*)getColorWithString:(NSString*)targetStr{
    NSString *greenStr = @"甲乙寅卯木";
    
    NSString *redStr      = @"丙丁巳午火";
    
    NSString *brownStr = @"戊己辰戌丑未土";
    
    NSString *goldenStr = @"庚辛申酉金";
    
    NSString *blueStr = @"壬癸亥子水";
    
    NSArray *strArr = @[greenStr,
                        redStr,
                        brownStr,
                        goldenStr,
                        blueStr];
    
    for(NSInteger i = 0;i<strArr.count;i++){
        NSString *str = strArr[i];
        for(NSInteger j = 0;j<str.length;j++){
            NSString *charater = [str substringWithRange:NSMakeRange(j, 1)];
            if([targetStr containsString:charater]){
                return [self getColorWithIndex:i];
            }
        }
    }
    
    return [UIColor blackColor];
}

+(UIColor*)getColorWithIndex:(NSInteger)index{
    UIColor *color = [UIColor blackColor];
    switch (index) {
        case 0:
        {
            color = [UIColor greenColor];
        }
            break;
        case 1:
        {
            color = [UIColor redColor];
        }
            break;
        case 2:
        {
            color = [UIColor brownColor];
        }
            break;
        case 3:
        {
            color = [UIColor colorWithRed:218/255.0
                                    green:178/255.0
                                     blue:115/255.0
                                    alpha:1];
        }
            break;
        case 4:
        {
            color = [UIColor blueColor];
        }
            break;
            
        default:
            break;
    }
    return color;
}

@end
