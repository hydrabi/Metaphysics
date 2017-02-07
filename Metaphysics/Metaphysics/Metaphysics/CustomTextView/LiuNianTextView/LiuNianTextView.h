//
//  LiuNianTextView.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiuNianTextView : UIView
@property (nonatomic,weak)IBOutlet UILabel *yearLabel;
@property (nonatomic,weak)IBOutlet UILabel *daYunLabel;
@property (nonatomic,weak)IBOutlet UILabel *xiaoYunLabel;
@property (nonatomic,weak)IBOutlet UITextView *textView;
+(instancetype)instanceLiuNianTextView;
-(void)reloadData;
@end
