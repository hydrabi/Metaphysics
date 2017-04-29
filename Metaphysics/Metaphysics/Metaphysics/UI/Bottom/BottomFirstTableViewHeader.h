//
//  BottomFirstTableViewHeader.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomFirstTableViewHeader : UIView
@property (nonatomic,weak)IBOutlet UILabel *mainTitleLabel;

/**
 恢复按钮，使流年选择清空，流年窗口隐藏，大运选择恢复
 */
@property (nonatomic,weak)IBOutlet UIButton *recoverButton;
+(instancetype)instanceBottomFirstTableViewHeader;
@end
