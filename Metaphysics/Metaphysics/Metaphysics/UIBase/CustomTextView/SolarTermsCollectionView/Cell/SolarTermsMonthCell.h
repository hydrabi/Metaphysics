//
//  SolarTermsMonthCell.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/20.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeparatorTableViewCell.h"
@interface SolarTermsMonthCell : SeparatorTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingConstraint;

@end
