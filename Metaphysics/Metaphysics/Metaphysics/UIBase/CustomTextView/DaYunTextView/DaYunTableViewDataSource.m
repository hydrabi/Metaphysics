//
//  DaYunTableViewDataSource.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/2.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DaYunTableViewDataSource.h"
#import "DaYunTableViewCell.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
static NSString *cellReuseIdentifier = @"cellReuseIdentifier";
@interface DaYunTableViewDataSource()
@property (nonatomic,weak)UITableView *tableView;
@end

@implementation DaYunTableViewDataSource

-(instancetype)initWithTableView:(UITableView*)tableView{
    self = [super init];
    if(self){
        self.tableView = tableView;
        [self UIConfig];
    }
    return self;
}

-(void)UIConfig{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DaYunTableViewCell class])
                                          bundle:nil]
    forCellReuseIdentifier:cellReuseIdentifier];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return daYunTableCellHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return daYunTableViewCount;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DaYunTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier
                                                                forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    BottomViewData *bottomData = mainViewModel.bottomData;
    if(bottomData.canStart){
        cell.daYunLabel.text = [bottomData getDaYunWithTableIndex:indexPath.row+1];
        cell.qiYunLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row * 10 + bottomData.qiYunShu] ;
    }
    
    return cell;
}


@end
