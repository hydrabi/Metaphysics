//
//  NormalTextView.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalTextView : UIView
@property (nonatomic,weak)IBOutlet UILabel *titleLabel;
@property (nonatomic,weak)IBOutlet UITextView *textView;
+(instancetype)instanceNormalTextView;
-(void)reloadData;
@end
