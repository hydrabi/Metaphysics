//
//  MainViewModel.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
@class BottomLocation;
typedef NS_ENUM(NSInteger,LeftSideMenuType) {
    LeftSideMenuTypeEmpty = -1,     /**<空*/
    LeftSideMenuTypeChaoDai,        /**<朝代*/
    LeftSideMenuTypeShuangZao,      /**<双造*/
    LeftSideMenuTypeDaYun,          /**<大运*/
    LeftSideMenuTypeYongShen,       /**<用神-忌神*/
    LeftSideMenuTypeGeJu,           /**<格局-象意*/
    
    LeftSideMenuTypeXiangMao,       /**<相貌-性格*/
    LeftSideMenuTypeWenPin,         /**<文凭-特长*/
    LeftSideMenuTypeFuMu,           /**<父母*/
    LeftSideMenuTypeXiongDi,        /**<兄弟*/
    LeftSideMenuTypeZiNv,           /**<子女*/
    
    LeftSideMenuTypeHunYin,         /**<婚姻*/
    LeftSideMenuTypeGuanGui,        /**<官贵*/
    LeftSideMenuTypeCaiFu,          /**<财富*/
    LeftSideMenuTypeGuanSi,         /**<官司-牢狱*/
    LeftSideMenuTypeJiBing,         /**<疾病-灾祸*/
    
    LeftSideMenuTypeYanSe,           /**<颜色区分*/
    LeftSideMenuTypeShenSha         /**<神煞表*/
};

typedef NS_ENUM(NSInteger,MiddleSubViewType){
    MiddleSubViewTypeYear,          /**<年柱*/
    MiddleSubViewTypeMonth,         /**<月柱*/
    MiddleSubViewTypeDay,           /**<日柱*/
    MiddleSubViewTypeHour,          /**<时柱*/
};

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


+(instancetype)sharedInstance;
-(NSString*)getSpecificMenuTitleWithType:(LeftSideMenuType)type;
-(LeftSideMenuType)getSpecificMenuTypeWithIndexPath:(NSIndexPath*)indexPath;
-(void)hiddenTableViewWithTag:(NSInteger)tag;
-(void)selectTableViewTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath;
-(void)selectTableViewHeaderWithTag:(NSInteger)tag;
#pragma mark - 选择菜单的某一项
-(void)selectMunuWithIndexPath:(NSIndexPath*)indexPath;
@end
