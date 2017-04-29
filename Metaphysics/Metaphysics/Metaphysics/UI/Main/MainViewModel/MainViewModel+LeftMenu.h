//
//  MainViewModel+LeftMenu.h
//  Metaphysics
//
//  Created by Hydra on 2017/4/29.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "MainViewModel.h"

@interface MainViewModel (LeftMenu)
#pragma mark - 选择菜单的某一项
-(void)selectMunuWithIndexPath:(NSIndexPath*)indexPath;
@end
