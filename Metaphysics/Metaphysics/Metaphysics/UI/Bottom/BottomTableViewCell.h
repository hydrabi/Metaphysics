//
//  BottomTableViewCell.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomTableViewCell : UITableViewCell
@property (nonatomic,weak)IBOutlet UILabel *yearLabel;
@property (nonatomic,weak)IBOutlet UILabel *liuNianLabel;

-(void)hideContent;
-(void)showContent;
-(void)selectCell:(BOOL)select;
@end
