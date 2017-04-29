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
         [self drawColorWithText:self.text];
     }];
}

-(void)setText:(NSString *)text{
    [super setText:text];
    [self drawColorWithText:text];
    
}

-(void)drawColorWithText:(NSString*)text{
    if([[MainViewModel sharedInstance].currentSelectTopSectionMenuTypeArr containsObject:@(LeftSideMenuTypeYanSe)]
       && text.length>0){
        if(self.useTheSameColor){
            self.textColor = [UIColor getColorWithString:self.text];
        }
        else{
            NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
            for(NSInteger i = 0;i<text.length;i++){
                NSString *subString = [text substringWithRange:NSMakeRange(i, 1)];
                [attributeString addAttribute:NSForegroundColorAttributeName
                                        value:[UIColor getColorWithString:subString]
                                        range:NSMakeRange(i, 1)];
                
            }
            self.attributedText = attributeString;
        }
    }
    else{
        self.textColor = [UIColor blackColor];
    }
}

@end
