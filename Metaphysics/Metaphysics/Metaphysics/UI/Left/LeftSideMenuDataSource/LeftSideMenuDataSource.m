//
//  LeftSideMenuDataSource.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "LeftSideMenuDataSource.h"
#import "LeftTableViewCell.h"
#import "UIConstantParameter.h"
static NSString *cellReuseIdentifier = @"cellReuseIdentifier";

@interface LeftSideMenuDataSource()
@property (nonatomic,weak)MainViewModel *viewModel;
@property (nonatomic,weak)UITableView *tableView;
@end

@implementation LeftSideMenuDataSource

-(instancetype)initWithViewModel:(MainViewModel*)viewModel tableView:(UITableView*)tableView{
    self = [super init];
    if(self){
        self.viewModel = viewModel;
        self.tableView = tableView;
        [self UIConfig];
    }
    return self;
}

-(void)UIConfig{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LeftTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:cellReuseIdentifier];
}

#pragma mark - 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *temp = self.viewModel.leftMenuArr[section];
    return temp.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.leftMenuArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier
                                                              forIndexPath:indexPath];
    
    LeftSideMenuType type = [self.viewModel getSpecificMenuTypeWithIndexPath:indexPath];
    [cell resetValueWithType:type];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[MainViewModel sharedInstance] selectMunuWithIndexPath:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 0;
    }
    if(section == 1){
        return contentViewOffset;
    }
    else{
        return 0;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
//        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), offset_16)];
//        header.backgroundColor = [UIColor whiteColor];
//        return header;
        return nil;
    }
    else if(section == 1){
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), contentViewOffset)];
        header.backgroundColor = [UIColor whiteColor];
        return header;
    }
    else{
        return nil;
    }
}

@end
