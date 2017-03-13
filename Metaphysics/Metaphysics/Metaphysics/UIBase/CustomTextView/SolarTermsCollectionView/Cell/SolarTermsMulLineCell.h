//
//  SolarTermsMulLineCell.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/19.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeparatorTableViewCell.h"
@interface SolarTermsMulLineCell : SeparatorTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
-(void)isCurrentSelectedDay:(BOOL)isSelected;
@end
