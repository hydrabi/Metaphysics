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
    return tableViewSection;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return rowPerSection;
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
    
    NSNumber *key = [BottomLocation createKeyNumberWithTag:tableView.tag
                                           indexPath:indexPath];
    if([main.liuNianData.bottomLocationDic objectForKey:key]){
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
    
    [bottomData fillContentWithTableIndex:tableView.tag
                             tableSection:indexPath.section
                                 tableRow:indexPath.row
                                    block:^(NSString *liuNian,NSString *xiaoYun,NSString *year){
                                        cell.liuNianLabel.text = liuNian;
                                        cell.yearLabel.text = year;
                                    }];
}

@end
