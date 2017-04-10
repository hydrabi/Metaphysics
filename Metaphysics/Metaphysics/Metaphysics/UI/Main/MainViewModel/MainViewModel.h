//
//  MainViewModel.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "ShuangZaoData.h"
#import "CurrentSelectDate.h"
#import "UIConstantParameter.h"
#import "RiZhuData.h"
#import "MiddleViewData.h"
#import "BottomViewData.h"

@class BottomLocation;
@interface MainViewModel : BaseViewModel
//左边的菜单页面
@property (nonatomic,strong)NSArray *leftMenuArr;
//当前选中顶部的菜单类型
@property (nonatomic,strong)NSMutableArray *currentSelectTopSectionMenuTypeArr;
//当前选中底部的菜单类型
@property (nonatomic,assign)LeftSideMenuType currentBottomSectionMenuType;
//底部textView操作信号
@property (nonatomic,strong)RACSignal *currentBottomTextViewOperationSig;
//左边菜单选中上面部分的操作信号
@property (nonatomic,strong)RACSignal *leftMenuTopSelectedOperationSig;
//节气显示与否
@property (nonatomic,assign)BOOL hadShowSolarTermsCollectionView;
//左边菜单tableview操作信号
@property (nonatomic,strong)RACSignal *reloadLeftTableSig;

//天干
@property (nonatomic,strong)NSArray *stemsArr;
@property (nonatomic,strong)NSString *stemsStr;
//地支
@property (nonatomic,strong)NSArray *branchesArr;
@property (nonatomic,strong)NSString *branchesStr;
//60甲子
@property (nonatomic,strong)NSMutableArray *jiaZiArr;



//是否正在隐藏底部的tableView
@property (nonatomic,assign)BOOL hadHiddenBottomTableView;
//正在隐藏的tableview的标记
@property (nonatomic,assign)NSInteger hiddenBottomTableViewTag;
//隐藏或者显示的操作信号
@property (nonatomic,strong)RACSignal *reloadBottomTablesSig;

//底部正在隐藏textView
@property (nonatomic,assign)BOOL hadShowLiuNianTextView;
//隐藏或者显示最底部textView的操作信号
@property (nonatomic,strong)RACSignal *LiuNianTextViewOperationSig;
//选择的位置
@property (nonatomic,strong)NSMutableDictionary *bottomLocation;
//第一个location
@property (nonatomic,strong)BottomLocation *firstLocation;

//正在点击的15运
@property (nonatomic,assign)NSInteger fifteenYunSelectedNumber;
//隐藏或者显示15运的操作信号
@property (nonatomic,strong)RACSignal *fifteenYunTextViewOperationSig;

//中间视图的数据
@property (nonatomic,strong)MiddleViewData *middleData;
//双造数据
@property (nonatomic,strong)ShuangZaoData *shuangZaoData;
//日期数据
@property (nonatomic,strong)CurrentSelectDate *selectedDate;
//日柱数据
@property (nonatomic,strong)RiZhuData *riZhuData;
//底部数据
@property (nonatomic,strong)BottomViewData *bottomData;
//1900~2100年节气精确到分的时间集合
@property (nonatomic,strong)NSMutableDictionary *solarTermsTimeDic;

+(instancetype)sharedInstance;
-(NSString*)getSpecificMenuTitleWithType:(LeftSideMenuType)type;
-(LeftSideMenuType)getSpecificMenuTypeWithIndexPath:(NSIndexPath*)indexPath;
-(void)hiddenTableViewWithTag:(NSInteger)tag;
-(void)selectTableViewTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath;
-(void)selectTableViewHeaderWithTag:(NSInteger)tag;
#pragma mark - 选择菜单的某一项
-(void)selectMunuWithIndexPath:(NSIndexPath*)indexPath;

/**
 公历转农历
 */
-(void)solarToLunar;

/**
 农历转公历
 */
-(void)lunarToSolar;

/**
 获取该年的闰月月份数

 @param year 年份
 @return 若该年存在闰月，返回闰月月份，否则返回0
 */
-(int32_t)getLeapMonthWithYear:(int32_t)year;

/**
 获取该年闰月的日数

 @param year 年份
 @return 若该年存在闰月，返回闰月日数，否则返回0
 */
-(int32_t)getLeapDayWithYear:(int32_t)year;

/**
 获取农历月份日数

 @param year 年
 @param month 农历月份
 @return 农历月份日数
 */
-(int32_t)getLunarDayWithYear:(int32_t)year month:(int32_t)month;

/**
 获取该年所有节气日期

 @param year 选定的年
 @return 所有节气日期
 */
-(NSMutableArray*)getTremWithYear:(int32_t)year;
@end
