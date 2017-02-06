//
//  BaseViewController.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseViewModel;
@interface BaseViewController : UIViewController
@property (nonatomic,strong)BaseViewModel *viewModel;


-(instancetype)initWithViewModel:(BaseViewModel*)viewModel;
@end
