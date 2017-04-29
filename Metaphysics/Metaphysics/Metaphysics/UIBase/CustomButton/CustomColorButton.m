//
//  CustomColorButton.m
//  Metaphysics
//
//  Created by Hydra on 2017/4/22.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "CustomColorButton.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
#import "UIColor+Addition.h"
@implementation CustomColorButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self bindViewModel];
    }
    return self;
}

-(void)bindViewModel{
    @weakify(self)
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:notificationKey_changeColor
                                                           object:nil]
     subscribeNext:^(id _){
         @strongify(self)
         [self drawColorWithText:self.titleLabel.text];
     }];
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self drawColorWithText:title];
}

-(void)drawColorWithText:(NSString*)text{
    if([[MainViewModel sharedInstance].currentSelectTopSectionMenuTypeArr containsObject:@(LeftSideMenuTypeYanSe)]
       && text.length>0){

        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
        for(NSInteger i = 0;i<text.length;i++){
            NSString *subString = [text substringWithRange:NSMakeRange(i, 1)];
            [attributeString addAttribute:NSForegroundColorAttributeName
                                    value:[UIColor getColorWithString:subString]
                                    range:NSMakeRange(i, 1)];
        }
        [self setAttributedTitle:attributeString
                        forState:UIControlStateNormal];

    }
    else{
        [self setTitleColor:[UIColor blackColor]
                   forState:UIControlStateNormal];
    }
}

@end
