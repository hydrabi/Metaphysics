//
//  MiddleTableViewDataSource.h
//  Metaphysics
//
//  Created by Hydra on 2017/4/3.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIConstantParameter.h"
@interface MiddleTableViewDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>
-(instancetype)initWithTableView:(UITableView*)tableView subViewType:(MiddleSubViewType)subViewType;
@end
