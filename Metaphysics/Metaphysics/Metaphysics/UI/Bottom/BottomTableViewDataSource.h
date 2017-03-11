//
//  BottomTableViewDataSource.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BottomTableViewDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>
-(instancetype)initWithTableViews:(NSMutableArray*)tableViewsArr;
@end
