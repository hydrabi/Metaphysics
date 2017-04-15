//
//  FifteenYunTableViewDataSource.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/5.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FifteenYunTableViewDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>
-(instancetype)initWithTableView:(UITableView*)tableView;
@end
