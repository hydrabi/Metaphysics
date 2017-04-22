//
//  CustomColorLabel.m
//  Metaphysics
//
//  Created by Hydra on 2017/4/22.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "CustomColorLabel.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
#import "UIColor+Addition.h"
@implementation CustomColorLabel

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
             self.textColor = [UIColor getColorWithString:self.text];
         }
         else{
             self.textColor = [UIColor blackColor];
         }
     }];
}

-(void)setText:(NSString *)text{
    [super setText:text];
    if([[MainViewModel sharedInstance].currentSelectTopSectionMenuTypeArr containsObject:@(LeftSideMenuTypeYanSe)]){
        self.textColor = [UIColor getColorWithString:self.text];
    }
    else{
        self.textColor = [UIColor blackColor];
    }
}

@end
