//
//  MainViewModel+LeftMenu.m
//  Metaphysics
//
//  Created by Hydra on 2017/4/29.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "MainViewModel+LeftMenu.h"

@implementation MainViewModel (LeftMenu)

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
                self.fifteenYunData.fifteenYunSelectedNumber = -1;
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
            
            if(type == LeftSideMenuTypeYanSe){
                [[NSNotificationCenter defaultCenter] postNotificationName:notificationKey_changeColor
                                                                    object:nil];
            }
        }
            break;
        case LeftSideMenuTypeCountQiYunUseHour:
        {
            self.useHourCountQiYun = !self.useHourCountQiYun;
        }
            break;
        default:
            break;
    }
    [(RACSubject*)self.reloadLeftTableSig sendNext:nil];
    [(RACSubject*)self.reloadBottomTablesSig sendNext:nil];
}

@end
