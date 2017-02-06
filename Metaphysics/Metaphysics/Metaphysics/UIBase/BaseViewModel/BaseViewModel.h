//
//  BaseViewModel.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseViewController;
@interface BaseViewModel : NSObject
@property (nonatomic,weak)BaseViewController *viewController;

/**
 *  初始化
 */
-(void)initialize;
@end
