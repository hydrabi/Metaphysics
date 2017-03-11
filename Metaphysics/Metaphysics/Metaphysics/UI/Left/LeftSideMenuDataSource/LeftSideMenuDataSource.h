//
//  LeftSideMenuDataSource.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MainViewModel.h"
@interface LeftSideMenuDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>
-(instancetype)initWithViewModel:(MainViewModel*)viewModel tableView:(UITableView*)tableView;
@end
