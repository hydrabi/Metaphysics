//
//  FifteenYunTableViewCell.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/5.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FifteenYunTableViewCell : UITableViewCell
@property (nonatomic,weak)IBOutlet UILabel *yearLabel;
@property (nonatomic,weak)IBOutlet UILabel *liuNianLabel;
@property (nonatomic,weak)IBOutlet UILabel *xiaoYunLabel;

-(void)resetValueWithIndexPath:(NSIndexPath*)indexPath;
@end
