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
@property (nonatomic,weak)IBOutlet UILabel *liuNianLabel;
@property (nonatomic,weak)IBOutlet UILabel *xiaoYunLabel;
@property (nonatomic,weak)IBOutlet UILabel *colonLabel;
@property (nonatomic,weak)IBOutlet UITextView *textView;

@property (nonatomic,weak)IBOutlet UILabel *yearLabel2;
@property (nonatomic,weak)IBOutlet UILabel *liuNianLabel2;
@property (nonatomic,weak)IBOutlet UILabel *xiaoYunLabel2;
@property (nonatomic,weak)IBOutlet UILabel *colonLabel2;
@property (nonatomic,weak)IBOutlet UITextView *textView2;

@property (nonatomic,weak)IBOutlet UIButton *clearButton;
+(instancetype)instanceLiuNianTextView;
-(void)reloadData;
@end
