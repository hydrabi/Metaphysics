//
//  LeftTableViewCell.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewModel.h"
@interface LeftTableViewCell : UITableViewCell
@property (nonatomic,weak)IBOutlet UILabel *menuLabel;
-(void)resetValueWithType:(LeftSideMenuType)type;
@end
