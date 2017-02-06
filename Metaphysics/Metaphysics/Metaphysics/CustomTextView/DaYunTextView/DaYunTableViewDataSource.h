//
//  DaYunTableViewDataSource.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/2.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaYunTableViewDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>
-(instancetype)initWithTableView:(UITableView*)tableView;

@end
