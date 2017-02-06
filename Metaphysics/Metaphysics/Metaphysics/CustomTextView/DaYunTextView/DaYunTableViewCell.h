//
//  DaYunTableViewCell.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/2.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DaYunTableViewCell : UITableViewCell
@property (nonatomic,weak)IBOutlet UILabel *numberLabel;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel;
@property (nonatomic,weak)IBOutlet UILabel *yearLabel;
-(void)resetValueWithIndexPath:(NSIndexPath*)indexPath;
@end
