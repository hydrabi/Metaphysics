//
//  BottomNormalTableViewHeader.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomColorButton.h"
#import "CustomColorLabel.h"
@interface BottomNormalTableViewHeader : UIView

@property (nonatomic,weak)IBOutlet UILabel *topTitleLabel;
@property (nonatomic,weak)IBOutlet CustomColorLabel *mainTitleLabel;
@property (nonatomic,weak)IBOutlet UILabel *bottomNumberTitleLabel;
@property (nonatomic,weak)IBOutlet UIButton *hideTableViewButton;
@property (nonatomic,assign)NSInteger tableViewTag;

+(instancetype)instanceBottomNormalTableViewHeader;
-(void)reloadData;
@end
