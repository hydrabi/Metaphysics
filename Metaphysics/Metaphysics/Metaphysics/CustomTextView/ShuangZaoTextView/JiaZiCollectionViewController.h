//
//  JiaZiCollectionViewController.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/12.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewModel.h"
@interface JiaZiCollectionViewController : UICollectionViewController

@property (nonatomic,assign)MiddleSubViewType type;

+(void)presentViewControllerWithRect:(CGRect)rect view:(UIView*)view type:(MiddleSubViewType)type;
@end
