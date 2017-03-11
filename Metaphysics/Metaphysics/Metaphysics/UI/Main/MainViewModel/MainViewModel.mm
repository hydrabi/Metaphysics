//
//  MainViewModel.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "MainViewModel.h"
#import <UIKit/UIKit.h>
#import "BottomLocation.h"
#import "TTLunarCalendar.h"
#import "AnalysisSolarTerm.h"
#import "NSString+Addition.h"
@interface MainViewModel()
@property (nonatomic, assign) Lunar*     lunar;
@end

@implementation MainViewModel

+(instancetype)sharedInstance{
    static MainViewModel *main = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        main = [[MainViewModel alloc] init];
    });
    return main;
}

-(void)initialize{
    [super initialize];
    
    self.leftMenuArr = @[
                            @[
                                @(LeftSideMenuTypeChaoDai),
                                @(LeftSideMenuTypeYanSe),
                                @(LeftSideMenuTypeShenSha),
                                @(LeftSideMenuTypeShuangZao),
                                ],
                         
                            @[
                                @(LeftSideMenuTypeDaYun),
                                
                                @(LeftSideMenuTypeYongShen),
                                @(LeftSideMenuTypeGeJu),
                                @(LeftSideMenuTypeXiangMao),
                                @(LeftSideMenuTypeWenPin),
                                @(LeftSideMenuTypeFuMu),
                                
                                @(LeftSideMenuTypeXiongDi),
                                @(LeftSideMenuTypeZiNv),
                                @(LeftSideMenuTypeHunYin),
                                @(LeftSideMenuTypeGuanGui),
                                @(LeftSideMenuTypeCaiFu),
                                
                                @(LeftSideMenuTypeGuanSi),
                                @(LeftSideMenuTypeJiBing),
                                @(LeftSideMenuTypeVersion),
                                ]
                         ];
    
    self.stemsStr = [NSString stemsStr];
    self.branchesStr = [NSString branchesStr];
    
    self.jiaZiArr = @[].mutableCopy;
    NSInteger i = 0;
    NSInteger j = 0;
    for(NSInteger index = 0; index < 60; index++){
        NSString *stem = [self.stemsStr substringWithRange:NSMakeRange(i, 1)];
        NSString *branch = [self.branchesStr substringWithRange:NSMakeRange(j, 1)];
        NSString *jiaZi = [NSString stringWithFormat:@"%@%@",stem,branch];
        [self.jiaZiArr addObject:jiaZi];

        i++;
        j++;
        if(i == self.stemsStr.length){
            i = 0;
        }
        
        if(j==self.branchesStr.length){
            j = 0;
        }
    }
    
    self.hadShowSolarTermsCollectionView = NO;
    self.hadHiddenBottomTableView = NO;
    self.hiddenBottomTableViewTag = 0;
    self.bottomLocation = @{}.mutableCopy;
    self.fifteenYunSelectedNumber = NSNotFound;
    self.currentBottomSectionMenuType = LeftSideMenuTypeEmpty;
    self.currentSelectTopSectionMenuTypeArr = @[].mutableCopy;
    self.shuangZaoData = [[ShuangZaoData alloc] init];
    self.selectedDate = [[CurrentSelectDate alloc] init];
    self.riZhuData = [[RiZhuData alloc] init];
    self.lunar = new Lunar();
    
    self.solarTermsTimeDic = [AnalysisSolarTerm analysis];
    
    [self bindOperation];
}

-(void)bindOperation{
    self.reloadBottomTablesSig = [[RACSubject subject]
                            setNameWithFormat:@"tableViewHiddenOperationSig"];
    
    self.LiuNianTextViewOperationSig = [[RACSubject subject] setNameWithFormat:@"bottomTextViewOperationSig"];
    
    self.fifteenYunTextViewOperationSig = [[RACSubject subject] setNameWithFormat:@"fifteenYunTextViewOperationSig"];
    
    self.currentBottomTextViewOperationSig = [[RACSubject subject] setNameWithFormat:@"currentBottomTextViewOperationSig"];
    
    self.reloadLeftTableSig = [[RACSubject subject]
                               setNameWithFormat:@"reloadLeftTableSig"];
    self.leftMenuTopSelectedOperationSig = [[RACSubject subject] setNameWithFormat:@"leftMenuTopSelectedOperationSig"];
}

-(NSString*)getSpecificMenuTitleWithType:(LeftSideMenuType)type{
    NSString *result = @"";
    
    switch (type) {
        case LeftSideMenuTypeChaoDai:
            result = @"朝代";
            break;
        case LeftSideMenuTypeShuangZao:
            result = @"双造";
            break;
        case LeftSideMenuTypeDaYun:
            result = @"大运";
            break;
        case LeftSideMenuTypeYongShen:
            result = @"用神-忌神";
            break;
        case LeftSideMenuTypeGeJu:
            result = @"格局-象意";
            break;
        case LeftSideMenuTypeXiangMao:
            result = @"相貌-性格";
            break;
        case LeftSideMenuTypeWenPin:
            result = @"文凭-特长";
            break;
        case LeftSideMenuTypeFuMu:
            result = @"父母";
            break;
        case LeftSideMenuTypeXiongDi:
            result = @"兄弟";
            break;
        case LeftSideMenuTypeZiNv:
            result = @"子女";
            break;
        case LeftSideMenuTypeHunYin:
            result = @"婚姻";
            break;
        case LeftSideMenuTypeGuanGui:
            result = @"官贵";
            break;
        case LeftSideMenuTypeCaiFu:
            result = @"财富";
            break;
        case LeftSideMenuTypeGuanSi:
            result = @"官司-牢狱";
            break;
        case LeftSideMenuTypeJiBing:
            result = @"疾病-灾祸";
            break;
        case LeftSideMenuTypeYanSe:
            result = @"色●";
            break;
        case LeftSideMenuTypeShenSha:
            result = @"神煞表";
            break;
        case LeftSideMenuTypeVersion:
            result = @"02_21";
            break;
        
        default:
            break;
    }
    
    return result;
}

-(LeftSideMenuType)getSpecificMenuTypeWithIndexPath:(NSIndexPath*)indexPath{
    LeftSideMenuType type = LeftSideMenuTypeChaoDai;
    
    if(self.leftMenuArr.count>indexPath.section){
        NSArray *temp = self.leftMenuArr[indexPath.section];
        if(temp.count>indexPath.row){
            type = (LeftSideMenuType)[temp[indexPath.row] integerValue];
        }
        
    }
    return type;
}

#pragma mark - 隐藏tableView
-(void)hiddenTableViewWithTag:(NSInteger)tag{
    if(self.hiddenBottomTableViewTag != tag){
        self.hiddenBottomTableViewTag = tag;
        self.hadHiddenBottomTableView = YES;
    }
    else{
        self.hadHiddenBottomTableView = !self.hadHiddenBottomTableView;
    }
    [(RACSubject*)self.reloadBottomTablesSig sendNext:nil];
}

#pragma mark - 选择tableView的某一行
-(void)selectTableViewTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath{
    
    BottomLocation *location = [[BottomLocation alloc] initWithTag:tag indexPath:indexPath];
    if([self.bottomLocation objectForKey:location.key] == nil){
        if(self.firstLocation == nil){
            self.firstLocation = [[BottomLocation alloc] initWithTag:tag indexPath:indexPath];
        }
        self.hadShowLiuNianTextView = YES;
        [self.bottomLocation setObject:location
                                forKey:location.key];
    }
    else{
        if([self.firstLocation.key isEqualToString:location.key]){
            self.firstLocation = nil;
            [self.bottomLocation removeAllObjects];
        }
        else{
            [self.bottomLocation removeObjectForKey:location.key];
        }
        
        if(self.bottomLocation.count == 0){
            self.hadShowLiuNianTextView = NO;
        }
    }
    
    [(RACSubject*)self.LiuNianTextViewOperationSig sendNext:nil];
    [(RACSubject*)self.reloadBottomTablesSig sendNext:nil];
}

#pragma mark - 选择底部大运的某一个，显示15运
-(void)selectTableViewHeaderWithTag:(NSInteger)tag{
    if(self.fifteenYunSelectedNumber != tag){
        self.fifteenYunSelectedNumber = tag;
        self.currentBottomSectionMenuType = LeftSideMenuTypeEmpty;
    }
    else{
        self.fifteenYunSelectedNumber = NSNotFound;
    }
    [(RACSubject*)self.fifteenYunTextViewOperationSig sendNext:nil];
    [(RACSubject*)self.reloadBottomTablesSig sendNext:nil];
    [(RACSubject*)self.reloadLeftTableSig sendNext:nil];
}

#pragma mark - 选择菜单的某一项
-(void)selectMunuWithIndexPath:(NSIndexPath*)indexPath{
    LeftSideMenuType type = [self getSpecificMenuTypeWithIndexPath:indexPath];
    switch (type) {
        case LeftSideMenuTypeDaYun:          /**<大运*/
        case LeftSideMenuTypeYongShen:       /**<用神-忌神*/
        case LeftSideMenuTypeGeJu:           /**<格局-象意*/
            
        case LeftSideMenuTypeXiangMao:       /**<相貌-性格*/
        case LeftSideMenuTypeWenPin:         /**<文凭-特长*/
        case LeftSideMenuTypeFuMu:           /**<父母*/
        case LeftSideMenuTypeXiongDi:        /**<兄弟*/
        case LeftSideMenuTypeZiNv:           /**<子女*/
            
        case LeftSideMenuTypeHunYin:         /**<婚姻*/
        case LeftSideMenuTypeGuanGui:        /**<官贵*/
        case LeftSideMenuTypeCaiFu:          /**<财富*/
        case LeftSideMenuTypeGuanSi:         /**<官司-牢狱*/
        case LeftSideMenuTypeJiBing:         /**<疾病-灾祸*/
        {
            if(self.currentBottomSectionMenuType != type){
                self.currentBottomSectionMenuType = type;
                //将15运的选择tag置为notfound，并隐藏
                self.fifteenYunSelectedNumber = NSNotFound;
            }
            else{
                self.currentBottomSectionMenuType = LeftSideMenuTypeEmpty;
            }
            [(RACSubject*)self.currentBottomTextViewOperationSig sendNext:nil];
        }
            break;
        case LeftSideMenuTypeShuangZao:
        case LeftSideMenuTypeShenSha:
        case LeftSideMenuTypeYanSe:
        {
            if([self.currentSelectTopSectionMenuTypeArr containsObject:@(type)]){
                [self.currentSelectTopSectionMenuTypeArr removeObject:@(type)];
            }
            else{
                [self.currentSelectTopSectionMenuTypeArr addObject:@(type)];
            }
            [(RACSubject*)self.leftMenuTopSelectedOperationSig sendNext:nil];
        }
            break;
        default:
            break;
    }
    [(RACSubject*)self.reloadLeftTableSig sendNext:nil];
    [(RACSubject*)self.reloadBottomTablesSig sendNext:nil];
}

#pragma mark - 日期转换
-(void)solarToLunar{
    if(self.selectedDate.gregorianYear.integerValue>=1900 &&
       self.selectedDate.gregorianYear.integerValue<=2100){
        struct LunarObj *obj = self.lunar->solar2lunar((int32_t)self.selectedDate.gregorianYear.integerValue,
                                                       (int32_t)self.selectedDate.gregorianMonth.integerValue,
                                                       (int32_t)self.selectedDate.gregorianDay.integerValue);
        if(obj != NULL){
            TTLunarDate *date = [[TTLunarDate alloc] initWithLunarObj:obj];
            self.selectedDate.lunarYear = @(date.lunarYear);
            self.selectedDate.lunarMonth = @(date.lunarMonth);
            self.selectedDate.lunarDay = @(date.lunarDay);
            self.selectedDate.lunarHour = self.selectedDate.gregorianHour;
            self.selectedDate.isLeapMonth = @(date.isLeap);
            [self.riZhuData resetTermWithYear:self.selectedDate.gregorianYear.integerValue];
        }
    }
    
}

-(void)lunarToSolar{
    if(self.selectedDate.lunarYear.integerValue>=1900 &&
       self.selectedDate.lunarYear.integerValue<=2100){
        int leapMonth = self.lunar->leapMonth((int32_t)self.selectedDate.lunarYear.integerValue);
        struct LunarObj *obj;
        //当前选中的是闰月
        if([self.selectedDate.isLeapMonth boolValue] &&
           self.selectedDate.lunarMonth.integerValue == leapMonth){
            obj = self.lunar->lunar2solar((int32_t)self.selectedDate.lunarYear.integerValue,
                                          (int32_t)self.selectedDate.lunarMonth.integerValue,
                                          (int32_t)self.selectedDate.lunarDay.integerValue,
                                          true);
        }
        else{
            obj = self.lunar->lunar2solar((int32_t)self.selectedDate.lunarYear.integerValue,
                                          (int32_t)self.selectedDate.lunarMonth.integerValue,
                                          (int32_t)self.selectedDate.lunarDay.integerValue,
                                          false);
        }
        
        if(obj != NULL){
            TTLunarDate *date = [[TTLunarDate alloc] initWithLunarObj:obj];
            self.selectedDate.gregorianYear = @(date.solarYear);
            self.selectedDate.gregorianMonth = @(date.solarMonth);
            self.selectedDate.gregorianDay = @(date.solarDay);
            self.selectedDate.gregorianHour = self.selectedDate.lunarHour;
            self.selectedDate.isLeapMonth = @(date.isLeap);
            [self.riZhuData resetTermWithYear:self.selectedDate.gregorianYear.integerValue];
        }
        
    }
}

-(int32_t)getLeapMonthWithYear:(int32_t)year{
    return self.lunar->leapMonth(year);
}

-(int32_t)getLeapDayWithYear:(int32_t)year{
    return self.lunar->leapDays(year);
}

-(int32_t)getLunarDayWithYear:(int32_t)year month:(int32_t)month{
    return self.lunar->monthDays(year, month);
}

-(NSMutableArray*)getTremWithYear:(int32_t)year{
    int32_t result;
    NSMutableArray *allTerm = @[].mutableCopy;
    for(int32_t i = 1;i<=24;i++){
        result = self.lunar->getTerm(year, i);
        [allTerm addObject:@(result)];
    }
    return  allTerm;
}

@end