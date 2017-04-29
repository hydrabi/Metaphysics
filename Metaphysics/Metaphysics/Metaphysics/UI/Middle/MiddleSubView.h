//
//  MiddleSubView.h
//  Metaphysics
//
//  Created by Hydra on 2017/1/29.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewModel.h"
#import "DrawLayerView.h"
@interface MiddleSubView : UIView
@property (nonatomic,assign)MiddleSubViewType type;
@property (nonatomic,weak)IBOutlet CustomColorLabel *topLeftLabel;
@property (nonatomic,weak)IBOutlet CustomColorLabel *topRightLabel;
@property (nonatomic,weak)IBOutlet CustomColorLabel *bottomLeftLabel;
@property (nonatomic,weak)IBOutlet CustomColorLabel *bottomRightLabel;
@property (nonatomic,weak)IBOutlet CustomColorLabel *horLine1Label;
@property (nonatomic,weak)IBOutlet UILabel *horLine2Label;
@property (nonatomic,weak)IBOutlet CustomColorLabel *horLine3Label;
@property (nonatomic,weak)IBOutlet CustomColorLabel *verLineLabel;
@property (nonatomic,weak)IBOutlet UIButton *showFormButton;
@property (nonatomic,weak)IBOutlet UITableView *tableView;
+(instancetype)instanceMiddleSubViewWithType:(MiddleSubViewType)type;

/**
 重新加载数据
 */
-(void)reloadData;
@end
