//
//  CustomColorLabel.h
//  Metaphysics
//
//  Created by Hydra on 2017/4/22.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomColorLabel : UILabel

/**
 只判断其中一个字，这个字段用同样的颜色（默认单个字用对应的颜色）
 */
@property (nonatomic,assign)BOOL useTheSameColor;
@end
