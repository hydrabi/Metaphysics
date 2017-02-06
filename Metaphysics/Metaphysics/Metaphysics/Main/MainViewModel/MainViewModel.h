//
//  MainViewModel.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

typedef NS_ENUM(NSInteger,LeftSideMenuType) {
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

//是否正在隐藏底部的tableView
@property (nonatomic,assign)BOOL hadHiddenBottomTableView;
//正在隐藏的tableview的标记
@property (nonatomic,assign)NSInteger hiddenBottomTableViewTag;
//隐藏或者显示的操作信号
@property (nonatomic,strong)RACSignal *reloadTablesSig;

////底部正在选中tableview的tag
//@property (nonatomic,assign)NSInteger selectTableViewTag;
////底部正在选中tableview的indexpath
//@property (nonatomic,strong)NSIndexPath *selectIndexPath;
//底部正在隐藏textView
@property (nonatomic,assign)BOOL hadShowBottomTextView;
//隐藏或者显示的操作信号
@property (nonatomic,strong)RACSignal *bottomTextViewOperationSig;
//选择的位置
@property (nonatomic,strong)NSMutableDictionary *bottomLocation;

//是否正在展示大运
@property (nonatomic,assign)BOOL hadShowDaYunTextView;


+(instancetype)sharedInstance;
-(NSString*)getSpecificMenuTitleWithType:(LeftSideMenuType)type;
-(LeftSideMenuType)getSpecificMenuTypeWithIndexPath:(NSIndexPath*)indexPath;
-(void)hiddenTableViewWithTag:(NSInteger)tag;
-(void)selectTableViewTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath;
@end
