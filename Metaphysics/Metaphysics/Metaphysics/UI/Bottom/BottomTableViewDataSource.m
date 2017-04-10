//
//  BottomTableViewDataSource.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomTableViewDataSource.h"
#import "BottomTableViewCell.h"
#import "BottomFirstTableViewHeader.h"
#import "BottomNormalTableViewHeader.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
#import "BottomLocation.h"
#import "NSString+Addition.h"
static NSString *cellReuseIdentifier = @"cellReuseIdentifier";

@interface BottomTableViewDataSource()
@property (nonatomic,weak)NSMutableArray *tableViews;
@end

@implementation BottomTableViewDataSource

-(instancetype)initWithTableViews:(NSMutableArray*)tableViewsArr{
    self = [super init];
    if(self){
        self.tableViews = tableViewsArr;
        [self UIConfig];
    }
    return self;
}

-(void)UIConfig{
    for(UITableView *tableView in self.tableViews){
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BottomTableViewCell class])
                                              bundle:nil]
        forCellReuseIdentifier:cellReuseIdentifier];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableViewCellHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier
                                                                forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    MainViewModel *main = [MainViewModel sharedInstance];
    if(main.hadHiddenBottomTableView){
        if(tableView.tag >= main.hiddenBottomTableViewTag){
            [cell hideContent];
        }
        else{
            [cell showContent];
        }
    }
    //展示
    else{
        [cell showContent];
    }
    
    NSString *key = [BottomLocation createKeyWithTag:tableView.tag
                                           indexPath:indexPath];
    if([main.bottomLocation objectForKey:key]){
        [cell selectCell:YES];
    }
    else{
        [cell selectCell:NO];
    }
    
    [self fillContentWithCell:cell
                    tableView:tableView
                    indexPath:indexPath];
    
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        if(tableView.tag == 0){
            BottomFirstTableViewHeader *header = [BottomFirstTableViewHeader instanceBottomFirstTableViewHeader];
            header.frame = CGRectMake(0, 0, CGRectGetWidth(tableView.frame), tableViewHeaderHeight);
            return header;
        }
        else{
            BottomNormalTableViewHeader *header = [BottomNormalTableViewHeader instanceBottomNormalTableViewHeader];
            header.frame = CGRectMake(0, 0, CGRectGetWidth(tableView.frame), tableViewHeaderHeight);
            header.tableViewTag = tableView.tag;
            [header reloadData];
            return header;
        }
    }
    else{
        UIView *clearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), tableViewMiddleOffset)];
        clearView.backgroundColor = [UIColor whiteColor];
        return clearView;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return tableViewHeaderHeight;
    }
    else{
        return tableViewMiddleOffset;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[MainViewModel sharedInstance] selectTableViewTag:tableView.tag
                                             indexPath:indexPath];
}

-(void)fillContentWithCell:(BottomTableViewCell*)cell
                 tableView:(UITableView*)tableView
                 indexPath:(NSIndexPath *)indexPath{
    MainViewModel *mainViewModle = [MainViewModel sharedInstance];
    BottomViewData *bottomData = mainViewModle.bottomData;
    CurrentSelectDate *selectData = mainViewModle.selectedDate;
    MiddleViewData *middleData = mainViewModle.middleData;
    NSString *ganZhiYear = selectData.ganZhiYear;
    NSArray *jiaZiArr = mainViewModle.jiaZiArr;
    if(jiaZiArr.count>0 && bottomData.qiYunShu>=0){
        NSInteger firstLineTableViewShow = 10 - (bottomData.qiYunShu - 1);
        NSInteger realIndex = 10 * tableView.tag + indexPath.section * 5 + indexPath.row;
        NSInteger ganZhiYearIndex = [jiaZiArr indexOfObject:ganZhiYear];
        NSInteger indexOffset = realIndex - firstLineTableViewShow;
        
        if(realIndex >= firstLineTableViewShow){
            
            if(middleData.universeType == UniverseTypeQian){
                //男 阳顺阴逆
                if([[ganZhiYear getBranches] isBranchesYang]){
                    [self positiveOrderWithWithCell:cell
                                        indexOffset:indexOffset
                                    ganZhiYearIndex:ganZhiYearIndex
                                           jiaZiArr:jiaZiArr];
                }
                else{
                    [self reversedOrderWithCell:cell
                                    indexOffset:indexOffset
                                ganZhiYearIndex:ganZhiYearIndex
                                       jiaZiArr:jiaZiArr];
                }
            }
            else{
                //女 阳逆阴顺
                if([[ganZhiYear getBranches] isBranchesYang]){
                    [self reversedOrderWithCell:cell
                                    indexOffset:indexOffset
                                ganZhiYearIndex:ganZhiYearIndex
                                       jiaZiArr:jiaZiArr];
                }
                else{
                    [self positiveOrderWithWithCell:cell
                                        indexOffset:indexOffset
                                    ganZhiYearIndex:ganZhiYearIndex
                                           jiaZiArr:jiaZiArr];
                }
            }
            
        }
        else{
            cell.daYunLabel.text = @"";
            cell.yearLabel.text = @"";
        }
        
    }
    else{
        cell.daYunLabel.text = @"";
        cell.yearLabel.text = @"";
    }
}


//逆序
-(void)reversedOrderWithCell:(BottomTableViewCell*)cell
                 indexOffset:(NSInteger)indexOffset
             ganZhiYearIndex:(NSInteger)ganZhiYearIndex
                    jiaZiArr:(NSArray*)jiaZiArr{
    NSInteger locationIndex = ganZhiYearIndex - indexOffset ;
    //少于0，补正locationIndex
    if(locationIndex<0){
        NSInteger divisor = (NSInteger)((-locationIndex) / jiaZiArr.count) + 1;
        locationIndex = jiaZiArr.count * divisor + locationIndex;
    }
    if(jiaZiArr.count>locationIndex){
        cell.daYunLabel.text = jiaZiArr[locationIndex];
    }
    
    MainViewModel *mainViewModle = [MainViewModel sharedInstance];
    CurrentSelectDate *selectData = mainViewModle.selectedDate;
    if(selectData.gregorianYear.integerValue >0){
        cell.yearLabel.text = [NSString stringWithFormat:@"%ld",selectData.gregorianYear.integerValue + indexOffset] ;
    }
}

//顺序
-(void)positiveOrderWithWithCell:(BottomTableViewCell*)cell
                     indexOffset:(NSInteger)indexOffset
                 ganZhiYearIndex:(NSInteger)ganZhiYearIndex
                        jiaZiArr:(NSArray*)jiaZiArr{
    
    NSInteger locationIndex = indexOffset + ganZhiYearIndex;
    //超出60，引用余数
    locationIndex = locationIndex % (jiaZiArr.count - 1);
    if(jiaZiArr.count>locationIndex){
        cell.daYunLabel.text = jiaZiArr[locationIndex];
    }
    
    MainViewModel *mainViewModle = [MainViewModel sharedInstance];
    CurrentSelectDate *selectData = mainViewModle.selectedDate;
    if(selectData.gregorianYear.integerValue >0){
        cell.yearLabel.text = [NSString stringWithFormat:@"%ld",selectData.gregorianYear.integerValue + indexOffset] ;
    }
}


@end
