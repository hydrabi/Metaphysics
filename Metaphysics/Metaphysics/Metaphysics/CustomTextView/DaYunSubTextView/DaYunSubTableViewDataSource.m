//
//  DaYunSubTableViewDataSource.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/5.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DaYunSubTableViewDataSource.h"
#import "DaYunSubTableViewCell.h"
#import "UIConstantParameter.h"
static NSString *cellReuseIdentifier = @"cellReuseIdentifier";

@interface DaYunSubTableViewDataSource()
@property (nonatomic,weak)UITableView *tableView;
@end

@implementation DaYunSubTableViewDataSource


-(instancetype)initWithTableView:(UITableView*)tableView{
    self = [super init];
    if(self){
        self.tableView = tableView;
        [self UIConfig];
    }
    return self;
}

-(void)UIConfig{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DaYunSubTableViewCell class])
                                               bundle:nil]
         forCellReuseIdentifier:cellReuseIdentifier];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return daYunSubTableCellHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return daYunSubTableViewCount/2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DaYunSubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier
                                                               forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell resetValueWithIndexPath:indexPath];
    
    return cell;
}
@end
