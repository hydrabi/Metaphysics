//
//  FifteenYunTitleView.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/6.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FifteenYunTitleView : UIView
@property (nonatomic,weak)IBOutlet UILabel *titleLabel;
@property (nonatomic,weak)IBOutlet UITextField *textField;

+(instancetype)instanceFifteenYunTitleView;
-(void)reloadData;
@end
