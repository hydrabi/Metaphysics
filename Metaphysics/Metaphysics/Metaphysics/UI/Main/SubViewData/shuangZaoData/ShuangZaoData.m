//
//  ShuangZaoData.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/13.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "ShuangZaoData.h"

@implementation ShuangZaoData

-(void)initialize{
    [self resetData];
}

-(void)resetData{
    self.mainTitle = @"";
    self.year = @"";
    self.month = @"";
    self.day = @"";
    self.hour = @"";
    self.text1 = @"";
    self.text2 = @"";
}

@end
