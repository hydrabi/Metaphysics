//
//  SeparatorTableViewCell.h
//  Metaphysics
//
//  Created by Hydra on 2017/3/11.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeparatorTableViewCell : UICollectionViewCell
@property (strong,nonatomic) UIView *floorLineView;
@property (strong,nonatomic) UIView *tailLineView;
-(void)showFloorLine;
-(void)hideFloorLine;
-(void)showTailLine;
-(void)hideTailLine;
@end
