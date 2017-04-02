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
}

-(void)resetData{
    [self resetGanZhiProperty];
    [self removeAll];
    [self isIncluedeTianYi];
    [self isIncludeTianDe];
    [self isIncludeYueDe];
    [self isIncludeTaiJi];
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
    
    self.totalGanZhiArr = @[self.ganZhiYear,
                            self.ganZhiMonth,
                            self.ganZhiDay,
                            self.ganZhiHour].mutableCopy;
    
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
#pragma mark - 包含的神煞
//是否包含天乙
//甲-丑未、乙-申子、丙-酉亥、丁-酉亥、戊-丑未、己-申子、庚-丑未、辛-寅午、壬-卯巳、癸-卯巳；（年日干查）
-(void)isIncluedeTianYi{
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

//天德
//寅月丁、卯月申、辰月壬、巳月辛、午月亥、未月甲、申月癸、酉月寅、戌月丙、亥月乙、子月巳、丑月庚
-(void)isIncludeTianDe{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeStems
                        checkTypeArr:@[@(MiddleSubViewTypeMonth),
                                       ]
                checkPrecnoditionArr:@[@"寅",
                                       @"卯",
                                       @"辰",
                                       @"巳",
                                       @"午",
                                       @"未",
                                       @"申",
                                       @"酉",
                                       @"戌",
                                       @"亥",
                                       @"子",
                                       @"丑",]
                  traverseConformArr:@[@"丁",
                                       @"申",
                                       @"壬",
                                       @"辛",
                                       @"亥",
                                       @"甲",
                                       @"癸",
                                       @"寅",
                                       @"丙",
                                       @"乙",
                                       @"巳",
                                       @"庚",]
                                name:@"天德"];
}

//月德
//寅月丙、卯月甲、辰月壬、巳月庚、午月丙、未月甲、申月壬、酉月庚、戌月丙、亥月甲、子月壬、丑月庚
-(void)isIncludeYueDe{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeStems
                        checkTypeArr:@[@(MiddleSubViewTypeMonth),
                                       ]
                checkPrecnoditionArr:@[@"寅",
                                       @"卯",
                                       @"辰",
                                       @"巳",
                                       @"午",
                                       @"未",
                                       @"申",
                                       @"酉",
                                       @"戌",
                                       @"亥",
                                       @"子",
                                       @"丑",]
                  traverseConformArr:@[@"丙",
                                       @"甲",
                                       @"壬",
                                       @"庚",
                                       @"丙",
                                       @"甲",
                                       @"壬",
                                       @"庚",
                                       @"丙",
                                       @"甲",
                                       @"壬",
                                       @"庚",]
                                name:@"月德"];
}

//太极
//甲日子、乙日午、丙日卯、丁日酉、戊己日（晨戊丑未）、庚日亥、辛日寅、壬日申、癸日巳。（年日干查）
-(void)isIncludeTaiJi{
    [self shenShaSearchWithCheckType:SBTypeStems
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"甲",
                                       @"乙",
                                       @"丙",
                                       @"丁",
                                       @"戊己",
                                       @"庚",
                                       @"辛",
                                       @"壬",
                                       @"癸",]
                  traverseConformArr:@[@"子",
                                       @"午",
                                       @"卯",
                                       @"酉",
                                       @"晨戊丑未",
                                       @"亥",
                                       @"寅",
                                       @"申",
                                       @"巳",]
                                name:@"太极"];
}

//华盖
//子见辰、丑见丑、寅见戌、卯见未、辰见辰、巳见丑、午见戌、未见未、申见辰、酉见丑、戌见戌、亥见未。（年日支查）
-(void)isIncludeHuaGai{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"子",
                                       @"丑",
                                       @"寅",
                                       @"卯",
                                       @"辰",
                                       @"巳",
                                       @"午",
                                       @"未",
                                       @"申",
                                       @"酉",
                                       @"戌",
                                       @"亥",]
                  traverseConformArr:@[@"辰",
                                       @"丑",
                                       @"戌",
                                       @"未",
                                       @"辰",
                                       @"丑",
                                       @"戌",
                                       @"未",
                                       @"辰",
                                       @"丑",
                                       @"戌",
                                       @"未",]
                                name:@"华盖"];
}

//文昌
//甲见巳、乙见午、丙见申、丁见酉、戊见申、己见酉、庚见亥、辛见子、壬见寅、癸见卯。（年日干查）
-(void)isIncludeWenChang{
    [self shenShaSearchWithCheckType:SBTypeStems
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"甲",
                                       @"乙",
                                       @"丙",
                                       @"丁",
                                       @"戊",
                                       @"己",
                                       @"庚",
                                       @"辛",
                                       @"壬",
                                       @"癸",
                                       ]
                  traverseConformArr:@[@"巳",
                                       @"午",
                                       @"申",
                                       @"酉",
                                       @"申",
                                       @"酉",
                                       @"亥",
                                       @"子",
                                       @"寅",
                                       @"卯",
                                       ]
                                name:@"文昌"];
}

//德秀
//寅午戌月：丙丁为德、戊癸为秀；巳酉丑月：庚辛为德、乙庚为秀；申子辰月：壬癸戊己为德、丙辛甲己为秀；亥卯未月：甲乙为德、丁壬为秀。（月支查）
-(void)isIncludeDeXiu{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeStems
                        checkTypeArr:@[@(MiddleSubViewTypeMonth),
                                       ]
                checkPrecnoditionArr:@[@"寅午戌",
                                       @"巳酉丑",
                                       @"申子辰",
                                       @"亥卯未",
                                       ]
                  traverseConformArr:@[@"丙丁戊癸",
                                       @"庚辛乙庚",
                                       @"壬癸戊己丙辛甲己",
                                       @"甲乙丁壬",
                                       ]
                                name:@"德秀"];
}

//将星
//寅午戌见午、巳酉丑见酉、申子辰见子、亥卯未见卯。（年日支查）
-(void)isIncludeJiangXing{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"寅午戌",
                                       @"巳酉丑",
                                       @"申子辰",
                                       @"亥卯未",
                                       ]
                  traverseConformArr:@[@"午",
                                       @"酉",
                                       @"子",
                                       @"卯",
                                       ]
                                name:@"将星"];
}

//驿马
//寅午戌马在申、巳酉丑马在亥、申子辰马在寅、亥卯未马在巳。（年日支查）
-(void)isIncludeYiMa{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"寅午戌",
                                       @"巳酉丑",
                                       @"申子辰",
                                       @"亥卯未",
                                       ]
                  traverseConformArr:@[@"申",
                                       @"亥",
                                       @"寅",
                                       @"巳",
                                       ]
                                name:@"驿马"];
}

//禄神
//甲禄寅、乙禄卯、丙禄巳、丁禄午、戊禄巳、己禄午、庚禄申、辛禄酉、壬禄亥、癸禄子。（日干查）
-(void)isIncludeLuShen{
    [self shenShaSearchWithCheckType:SBTypeStems
                        traverseType:SBTypeBranches
                        checkTypeArr:@[
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"甲",
                                       @"乙",
                                       @"丙",
                                       @"丁",
                                       @"戊",
                                       @"己",
                                       @"庚",
                                       @"辛",
                                       @"壬",
                                       @"癸",
                                       ]
                  traverseConformArr:@[@"寅",
                                       @"卯",
                                       @"巳",
                                       @"午",
                                       @"巳",
                                       @"午",
                                       @"申",
                                       @"酉",
                                       @"亥",
                                       @"子",
                                       ]
                                name:@"文昌"];
}

//羊刃
//甲日卯、乙日寅、丙日午、丁日巳、戊日午未、己日巳辰、庚日酉、辛日申、壬日子、癸日亥。（日干查）
-(void)isIncludeYangRen{
    [self shenShaSearchWithCheckType:SBTypeStems
                        traverseType:SBTypeBranches
                        checkTypeArr:@[
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"甲",
                                       @"乙",
                                       @"丙",
                                       @"丁",
                                       @"戊",
                                       @"己",
                                       @"庚",
                                       @"辛",
                                       @"壬",
                                       @"癸",
                                       ]
                  traverseConformArr:@[@"卯",
                                       @"寅",
                                       @"午",
                                       @"巳",
                                       @"午未",
                                       @"巳辰",
                                       @"酉",
                                       @"申",
                                       @"子",
                                       @"亥",
                                       ]
                                name:@"羊刃"];
}

//桃花
//寅午戌见卯，申子辰见酉，亥卯未见子，巳酉丑见午。（年日支查）
-(void)isIncludeTaoHua{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"寅午戌",
                                       @"申子辰",
                                       @"亥卯未",
                                       @"巳酉丑",
                                       ]
                  traverseConformArr:@[@"卯",
                                       @"酉",
                                       @"子",
                                       @"午",
                                       ]
                                name:@"桃花"];
}

//红艳
//甲日午、乙日午、丙日寅、丁日未、戊日辰、己日辰、庚日戌、辛日酉、壬日子、癸日申。（年日干查）
-(void)isIncludeHongYan{
    [self shenShaSearchWithCheckType:SBTypeStems
                        traverseType:SBTypeBranches
                        checkTypeArr:@[
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"甲",
                                       @"乙",
                                       @"丙",
                                       @"丁",
                                       @"戊",
                                       @"己",
                                       @"庚",
                                       @"辛",
                                       @"壬",
                                       @"癸",
                                       ]
                  traverseConformArr:@[@"午",
                                       @"午",
                                       @"寅",
                                       @"未",
                                       @"辰",
                                       @"辰",
                                       @"戌",
                                       @"酉",
                                       @"子",
                                       @"申",
                                       ]
                                name:@"红艳"];
}

//亡神
//寅午戌见巳，亥卯未见寅，巳酉丑见申，申子辰见亥；（年日支查）
-(void)isIncludeWangShen{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"寅午戌",
                                       @"申子辰",
                                       @"亥卯未",
                                       @"巳酉丑",
                                       ]
                  traverseConformArr:@[@"巳",
                                       @"寅",
                                       @"申",
                                       @"亥",
                                       ]
                                name:@"亡神"];
}

//劫煞
//寅午戌见亥、申子辰见巳、亥卯未见申、巳酉丑见寅。（年日支查）
-(void)isIncludeJieSha{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"寅午戌",
                                       @"申子辰",
                                       @"亥卯未",
                                       @"巳酉丑",
                                       ]
                  traverseConformArr:@[@"亥",
                                       @"巳",
                                       @"申",
                                       @"寅",
                                       ]
                                name:@"劫煞"];
}

//灾煞
//申子辰见午，亥卯未见酉，寅午戌见子，巳酉丑见卯。（年支查）
-(void)isIncludeZaiSha{
    [self shenShaSearchWithCheckType:SBTypeBranches
                        traverseType:SBTypeBranches
                        checkTypeArr:@[@(MiddleSubViewTypeYear),
                                       @(MiddleSubViewTypeDay),
                                       ]
                checkPrecnoditionArr:@[@"申子辰",
                                       @"亥卯未",
                                       @"寅午戌",
                                       @"巳酉丑",
                                       ]
                  traverseConformArr:@[@"午",
                                       @"酉",
                                       @"子",
                                       @"卯",
                                       ]
                                name:@"灾煞"];
}

//元辰
//

#pragma mark - 统一的算法
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
                            break;
                        }
                    }
                    //地支
                    else{
                        //只要其中一种条件符合，就可遍历
                        if([ganZhi.getBranches containsString:precondition]){
                            preconform = YES;
                            break;
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
