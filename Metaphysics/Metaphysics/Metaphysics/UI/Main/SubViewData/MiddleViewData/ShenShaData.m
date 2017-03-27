//
//  ShenShaData.m
//  Metaphysics
//
//  Created by Hydra on 2017/3/27.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "ShenShaData.h"
#import "MainViewModel.h"
#import "NSString+Addition.h"
#import "UIConstantParameter.h"
@implementation ShenShaData

-(void)initialize{
    self.yearShenShaArr = @[].mutableCopy;
    self.monthShenShaArr = @[].mutableCopy;
    self.dayShenShaArr = @[].mutableCopy;
    self.hourShenShaArr = @[].mutableCopy;
    self.ganZhiYear = @"";
    self.ganZhiMonth = @"";
    self.ganZhiDay = @"";
    self.ganZhiHour = @"";
    
    self.totalShenShaArr = @[self.yearShenShaArr,
                             self.monthShenShaArr,
                             self.dayShenShaArr,
                             self.hourShenShaArr].mutableCopy;
    self.totalGanZhiArr = @[self.ganZhiYear,
                            self.ganZhiMonth,
                            self.ganZhiDay,
                            self.ganZhiHour].mutableCopy;
}

-(void)resetData{
    [self resetGanZhiProperty];
    [self removeAll];
}

-(void)removeAll{
    [self.yearShenShaArr removeAllObjects];
    [self.monthShenShaArr removeAllObjects];
    [self.dayShenShaArr removeAllObjects];
    [self.hourShenShaArr removeAllObjects];
}

-(void)resetGanZhiProperty{
    CurrentSelectDate *current = [MainViewModel sharedInstance].selectedDate;
    self.ganZhiYear = current.ganZhiYear;
    self.ganZhiMonth = current.ganZhiMonth;
    self.ganZhiDay = current.ganZhiDay;
    self.ganZhiHour = current.ganZhiHour;
    
}
//遍历所有干支，符合条件该柱添加上该神煞
-(void)traverseWithResult:(NSString *(^)(NSString *stems,NSString *branches))judgeBlock{
    for(NSInteger i = 0;i<self.totalGanZhiArr.count;i++){
        NSString *ganZhi = self.totalGanZhiArr[i];
        NSString *shenSha = judgeBlock(ganZhi.getStems,ganZhi.getBranches);
        if(shenSha.length>0){
            NSMutableArray *shenShaArray = self.totalShenShaArr[i];
            //如果该队列不包含该神煞，则添加上去
            if(![shenShaArray containsObject:shenSha]){
                [shenShaArray addObject:shenSha];
            }
        }
    }
}

//是否包含天乙
//甲-丑未、乙-申子、丙-酉亥、丁-酉亥、戊-丑未、己-申子、庚-丑未、辛-寅午、壬-卯巳、癸-卯巳；（年日干查）
-(void)isIncluedeTianYi{
//    NSString *shenShaName = @"天乙";
//    //符合年日天干为甲的条件
//    if([self.ganZhiYear.getStems containsString:@"甲"] ||
//       [self.ganZhiDay.getStems containsString:@"甲"]){
//        [self traverseWithResult:^NSString*(NSString *stems,NSString *branches){
//            if([branches containsString:@"丑"]||
//               [branches containsString:@"未"]){
//                return shenShaName;
//            }
//            return nil;
//        }];
//    }
    [self shenShaSearchWithCheckType:SBTypeStems
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),]
                checkPrecnoditionArr:@[@"甲",
                                       @"乙",
                                       @"丙",
                                       @"丁",
                                       @"戊",
                                       @"己",
                                       @"庚",
                                       @"辛",
                                       @"壬",
                                       @"癸",]
                  traverseConformArr:@[@"丑未",
                                       @"申子",
                                       @"酉亥",
                                       @"酉亥",
                                       @"丑未",
                                       @"申子",
                                       @"丑未",
                                       @"寅午",
                                       @"卯巳",
                                       @"卯巳",]
                                name:@"天乙"];
}


/**
 获取年月日时柱右边的神煞

 @param checkType 前置查找类型是天干还是地支,如天乙的年日干查,为SBTypeStems 干
 @param traverseType 遍历的是天干还是地支,如天乙的年日干查,为SBTypeBranches 支
 @param checkTypeArr 要查找的是年月日时那个柱,如天乙的年日干查,为年和日
 @param checkPrecnoditionArr 查找的干支前置条件,如天乙年日符合甲乙丙丁午己庚辛壬癸
 @param traverseConformArr 遍历的条件如天乙的丑未，申子，酉亥，丑未等
 @param name 神煞的名字，如天乙
 */
-(void)shenShaSearchWithCheckType:(SBType)checkType
                     traverseType:(SBType)traverseType
                     checkTypeArr:(NSArray*)checkTypeArr
             checkPrecnoditionArr:(NSArray*)checkPrecnoditionArr
               traverseConformArr:(NSArray*)traverseConformArr
                             name:(NSString*)name{
    for(NSInteger i = 0;i<checkPrecnoditionArr.count;i++){
        //多个前置条件中的一个
        NSString *preconditions = checkPrecnoditionArr[i];
        //前置条件可能包含多个干支，比如寅午戌马在申，有寅午戌三个，分离它，遍历
        for(NSInteger j = 0;j<preconditions.length;j++){
            //前置条件符合
            BOOL preconform = NO;
            //分离后的每个干或者支
            NSString *precondition = [preconditions substringWithRange:NSMakeRange(j, 1)];
            
            //前置条件的判断，只要其中一种条件符合就可进入遍历阶段
            //柱的类型
            for(NSNumber *checkTypeNumber in checkTypeArr){
                if(self.totalGanZhiArr.count>checkTypeNumber.integerValue){
                    //获取柱的类型，比如年天乙的年日干查，取年和日判断条件是否符合
                    NSString *ganZhi = self.totalGanZhiArr[checkTypeNumber.integerValue];
                    //天干
                    if(checkType == SBTypeStems){
                        //只要其中一种条件符合，就可遍历
                        if([ganZhi.getStems containsString:precondition]){
                            preconform = YES;
                        }
                    }
                    //地支
                    else{
                        //只要其中一种条件符合，就可遍历
                        if([ganZhi.getBranches containsString:precondition]){
                            preconform = YES;
                        }
                    }
                }
            }
            
            
            
            
            //符合前置条件
            if(preconform){
                //多个遍历条件中的一个
                NSString *traverseConformStrs = traverseConformArr[i];
                //遍历条件可能包含多个干支，比如天乙的甲-(丑未)
                for(NSInteger k = 0;k<traverseConformStrs.length;k++){
                    NSString* traverseConformStr = [traverseConformStrs substringWithRange:NSMakeRange(k, 1)];
                    [self traverseWithResult:^NSString*(NSString *stems,NSString *branches){
                        //如果遍历查找类型为天干
                        if(traverseType == SBTypeStems){
                            //如果遍历条件符合，添加
                            if([stems containsString:traverseConformStr]
                               ){
                                return name;
                            }
                        }
                        //地支
                        else{
                            //如果遍历条件符合，添加
                            if([branches containsString:traverseConformStr]
                               ){
                                return name;
                            }
                        }
                        return nil;
                    }];
                }
            }
            
            
            
        }
    }
    
}
@end
