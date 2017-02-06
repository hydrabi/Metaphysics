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
                                ]
                         
                         
                         ];
    
    self.hadHiddenBottomTableView = NO;
    self.hiddenBottomTableViewTag = 0;
    self.hadShowDaYunTextView = NO;
    self.bottomLocation = @{}.mutableCopy;
    
    [self bindOperation];
}

-(void)bindOperation{
    self.reloadTablesSig = [[RACSubject subject] setNameWithFormat:@"tableViewHiddenOperationSig"];
    
    self.bottomTextViewOperationSig = [[RACSubject subject] setNameWithFormat:@"bottomTextViewOperationSig"];
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
            type = [temp[indexPath.row] integerValue];
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
    [(RACSubject*)self.reloadTablesSig sendNext:nil];
}

#pragma mark - 选择tableView的某一行
-(void)selectTableViewTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath{
    
    BottomLocation *location = [[BottomLocation alloc] initWithTag:tag indexPath:indexPath];
    if([self.bottomLocation objectForKey:location.key] == nil){
        self.hadShowBottomTextView = YES;
        [self.bottomLocation setObject:location
                                forKey:location.key];
    }
    else{
        [self.bottomLocation removeObjectForKey:location.key];
        if(self.bottomLocation.count == 0){
            self.hadShowBottomTextView = NO;
        }
    }
    
    [(RACSubject*)self.bottomTextViewOperationSig sendNext:nil];
    [(RACSubject*)self.reloadTablesSig sendNext:nil];
}

@end
