//
//  LiuQinData.m
//  Metaphysics
//
//  Created by Hydra on 2017/3/26.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "LiuQinData.h"
#import "NSString+Addition.h"
#import "MainViewModel.h"
@implementation LiuQinData

-(NSMutableDictionary*)liuQinDic{
    if(_liuQinDic == nil){
        //@"甲乙丙丁戊己庚辛壬癸"
        NSString *stemsStr = [NSString stemsStr];
        NSMutableDictionary *mainDic = @{}.mutableCopy;
        for(NSInteger i = 0;i<stemsStr.length;i++){
            //日干
            NSString *riGankey = [stemsStr substringWithRange:NSMakeRange(i, 1)];
            NSMutableDictionary *subDic = @{}.mutableCopy;
            NSArray *subValues = [LiuQinData getLiuQinArrWithIndex:i];
            for(NSInteger j = 0;j<stemsStr.length;j++){
                NSString *subKey = [stemsStr substringWithRange:NSMakeRange(j, 1)];
                NSString *subValue = subValues[j];
                [subDic setObject:subValue
                           forKey:subKey];
            }
            [mainDic setObject:subDic
                        forKey:riGankey];
        }
        _liuQinDic = mainDic;
    }
    return _liuQinDic;
    
}

-(NSString*)getLiuQinValueWithRiGanZhi:(NSString*)riGanZhi otherGanZhi:(NSString*)otherGanZhi{
    NSString* result = @"";
    NSAssert(riGanZhi != nil, @"日干支为空");
    NSAssert(otherGanZhi != nil, @"其它干支为空");
    NSString *riGan = [riGanZhi substringWithRange:NSMakeRange(0, 1)];
    NSString *otherGan = [otherGanZhi substringWithRange:NSMakeRange(0, 1)];
    NSNumber *typeNumber  = self.liuQinDic[riGan][otherGan];
    result = [self getValueWithType:(liuQinType)typeNumber.integerValue];
    return result;
}

-(NSString*)getLiuQinValueWithRiGanZhi:(NSString*)riGanZhi cangGan:(NSString*)cangGan{
    NSString* result = @"";
    NSAssert(riGanZhi != nil, @"日干支为空");
    NSAssert(cangGan != nil, @"藏干为空");
    NSString *riGan = [riGanZhi substringWithRange:NSMakeRange(0, 1)];
    for(NSInteger i = 0 ;i<cangGan.length;i++){
        NSString *otherGan = [cangGan substringWithRange:NSMakeRange(i, 1)];
        NSNumber *typeNumber  = self.liuQinDic[riGan][otherGan];
        result = [result stringByAppendingString:[self getValueWithType:(liuQinType)typeNumber.integerValue]];
    }
    
    return result;
}

-(void)resetData{
    CurrentSelectDate *current = [MainViewModel sharedInstance].selectedDate;
    CangGanData *cangGanData = [MainViewModel sharedInstance].middleData.cangGanData;
    self.yearTopLiuQin = [self getLiuQinValueWithRiGanZhi:current.ganZhiDay
                                              otherGanZhi:current.ganZhiYear];
    self.monthTopLiuQin = [self getLiuQinValueWithRiGanZhi:current.ganZhiDay
                                              otherGanZhi:current.ganZhiMonth];
    self.dayTopLiuQin = @"日干";
    self.hourTopLiuQin = [self getLiuQinValueWithRiGanZhi:current.ganZhiDay
                                              otherGanZhi:current.ganZhiHour];
    
    self.yearBottomLiuQin = [self getLiuQinValueWithRiGanZhi:current.ganZhiDay
                                                     cangGan:cangGanData.yearCangGan];
    self.monthBottomLiuQin = [self getLiuQinValueWithRiGanZhi:current.ganZhiDay
                                                     cangGan:cangGanData.monthCangGan];
    self.dayBottomLiuQin = [self getLiuQinValueWithRiGanZhi:current.ganZhiDay
                                                     cangGan:cangGanData.dayCangGan];
    self.hourBottomLiuQin = [self getLiuQinValueWithRiGanZhi:current.ganZhiDay
                                                     cangGan:cangGanData.hourCangGan];
}

+(NSArray*)getLiuQinArrWithIndex:(NSInteger)index{
    NSArray *result = nil;
    switch (index) {
        case 0:
        {
            result = @[@(liuQinType_Bi),
                       @(liuQinType_Jie),
                       @(liuQinType_Shi),
                       @(liuQinType_Shang),
                       @(liuQinType_CaiFu),
                       @(liuQinType_CaiHua),
                       @(liuQinType_Sha),
                       @(liuQinType_Guan),
                       @(liuQinType_Xiao),
                       @(liuQinType_Yin),];
        }
            break;
        case 1:
        {
            result = @[@(liuQinType_Jie),
                       @(liuQinType_Bi),
                       @(liuQinType_Shang),
                       @(liuQinType_Shi),
                       @(liuQinType_CaiHua),
                       @(liuQinType_CaiFu),
                       @(liuQinType_Guan),
                       @(liuQinType_Sha),
                       @(liuQinType_Yin),
                       @(liuQinType_Xiao),];
        }
            break;
        case 2:
        {
            result = @[@(liuQinType_Xiao),
                       @(liuQinType_Yin),
                       @(liuQinType_Bi),
                       @(liuQinType_Jie),
                       @(liuQinType_Shi),
                       @(liuQinType_Shang),
                       @(liuQinType_CaiFu),
                       @(liuQinType_CaiHua),
                       @(liuQinType_Sha),
                       @(liuQinType_Guan),];
        }
            break;
        case 3:
        {
            result = @[@(liuQinType_Yin),
                       @(liuQinType_Xiao),
                       @(liuQinType_Jie),
                       @(liuQinType_Bi),
                       @(liuQinType_Shang),
                       @(liuQinType_Shi),
                       @(liuQinType_CaiHua),
                       @(liuQinType_CaiFu),
                       @(liuQinType_Guan),
                       @(liuQinType_Sha),];
        }
            break;
        case 4:
        {
            result = @[@(liuQinType_Sha),
                       @(liuQinType_Guan),
                       @(liuQinType_Xiao),
                       @(liuQinType_Yin),
                       @(liuQinType_Bi),
                       @(liuQinType_Jie),
                       @(liuQinType_Shi),
                       @(liuQinType_Shang),
                       @(liuQinType_CaiFu),
                       @(liuQinType_CaiHua),];
        }
            break;
        case 5:
        {
            result = @[@(liuQinType_Guan),
                       @(liuQinType_Sha),
                       @(liuQinType_Yin),
                       @(liuQinType_Xiao),
                       @(liuQinType_Jie),
                       @(liuQinType_Bi),
                       @(liuQinType_Shang),
                       @(liuQinType_Shi),
                       @(liuQinType_CaiHua),
                       @(liuQinType_CaiFu),];
        }
            break;
        case 6:
        {
            result = @[@(liuQinType_CaiFu),
                       @(liuQinType_CaiHua),
                       @(liuQinType_Sha),
                       @(liuQinType_Guan),
                       @(liuQinType_Xiao),
                       @(liuQinType_Yin),
                       @(liuQinType_Bi),
                       @(liuQinType_Jie),
                       @(liuQinType_Shi),
                       @(liuQinType_Shang),];
        }
            break;
        case 7:
        {
            result = @[@(liuQinType_CaiHua),
                       @(liuQinType_CaiFu),
                       @(liuQinType_Guan),
                       @(liuQinType_Sha),
                       @(liuQinType_Yin),
                       @(liuQinType_Xiao),
                       @(liuQinType_Jie),
                       @(liuQinType_Bi),
                       @(liuQinType_Shang),
                       @(liuQinType_Shi),];
        }
            break;
        case 8:
        {
            result = @[@(liuQinType_Shi),
                       @(liuQinType_Shang),
                       @(liuQinType_CaiFu),
                       @(liuQinType_CaiHua),
                       @(liuQinType_Sha),
                       @(liuQinType_Guan),
                       @(liuQinType_Xiao),
                       @(liuQinType_Yin),
                       @(liuQinType_Bi),
                       @(liuQinType_Jie),];
        }
            break;
        case 9:
        {
            result = @[@(liuQinType_Shang),
                       @(liuQinType_Shi),
                       @(liuQinType_CaiHua),
                       @(liuQinType_CaiFu),
                       @(liuQinType_Guan),
                       @(liuQinType_Sha),
                       @(liuQinType_Yin),
                       @(liuQinType_Xiao),
                       @(liuQinType_Jie),
                       @(liuQinType_Bi),];
        }
            break;
            
        default:
            break;
    }
    return result;
}

-(NSString*)getValueWithType:(liuQinType)type{
    NSString *result = @"";
    switch (type) {
        case liuQinType_Bi:
            result = @"比";
            break;
        case liuQinType_Jie:
            result = @"劫";
            break;
        case liuQinType_Xiao:
            result = @"枭";
            break;
        case liuQinType_Yin:
            result = @"印";
            break;
        case liuQinType_CaiFu:
            result = @"财";
            break;
        case liuQinType_CaiHua:
            result = @"才";
            break;
        case liuQinType_Sha:
            result = @"杀";
            break;
        case liuQinType_Guan:
            result = @"官";
            break;
        case liuQinType_Shi:
            result = @"食";
            break;
        case liuQinType_Shang:
            result = @"伤";
            break;
        default:
            break;
    }
    return result;
}

@end
