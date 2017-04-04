//
//  MiddleTableViewDataSource.m
//  Metaphysics
//
//  Created by Hydra on 2017/4/3.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "MiddleTableViewDataSource.h"
#import "MiddleTableViewCell.h"
#import "MainViewModel.h"
static NSString *cellReuseIdentifier = @"cellReuseIdentifier";
@interface MiddleTableViewDataSource()
@property (nonatomic,weak)UITableView *tableView;
@property (nonatomic,assign)MiddleSubViewType subViewType;
@end

@implementation MiddleTableViewDataSource

-(instancetype)initWithTableView:(UITableView*)tableView subViewType:(MiddleSubViewType)subViewType{
    self = [super init];
    if(self){
        self.tableView = tableView;
        self.subViewType = subViewType;
        [self registerNib];
    }
    return self;
}

-(void)registerNib{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MiddleTableViewCell class]) bundle:nil]
         forCellReuseIdentifier:cellReuseIdentifier];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 26.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MiddleViewData *middle = [MainViewModel sharedInstance].middleData;
    return [middle.shenShaData.totalShenShaArr[self.subViewType] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MiddleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier
                                                                forIndexPath:indexPath];
    MiddleViewData *middle = [MainViewModel sharedInstance].middleData;
    NSMutableArray *shenShaArr = middle.shenShaData.totalShenShaArr[self.subViewType];
    if(shenShaArr.count>indexPath.row){
        cell.shenShaLabel.text = shenShaArr[indexPath.row];
    }
    return cell;
}

@end
