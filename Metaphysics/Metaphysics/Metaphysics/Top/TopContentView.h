//
//  TopContentView.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceHolderView.h"

@interface TopContentView : UIView
@property (nonatomic,weak)IBOutlet UIButton *hideButton;
@property (nonatomic,weak)IBOutlet UITextField *firstTextField;

+(instancetype)instanceTopContentView;
@end
