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
         if([[MainViewModel sharedInstance].currentSelectTopSectionMenuTypeArr containsObject:@(LeftSideMenuTypeYanSe)]){
             [self setTitleColor:[UIColor getColorWithString:self.titleLabel.text]
                        forState:UIControlStateNormal];
         }
         else{
             [self setTitleColor:[UIColor blackColor]
                        forState:UIControlStateNormal];
         }
     }];
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    if([[MainViewModel sharedInstance].currentSelectTopSectionMenuTypeArr containsObject:@(LeftSideMenuTypeYanSe)]){
        [self setTitleColor:[UIColor getColorWithString:self.titleLabel.text]
                   forState:UIControlStateNormal];
    }
    else{
        [self setTitleColor:[UIColor blackColor]
                   forState:UIControlStateNormal];
    }
}

@end
