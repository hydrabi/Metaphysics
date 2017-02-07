//
//  UILabel+Addition.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/7.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "UILabel+Addition.h"
#import "objc/runtime.h"
static void * const originalSizeKey = "originalSizeKey";

@implementation UILabel (Addition)


-(void)setOriginalSize:(CGFloat)originalSize{
    objc_setAssociatedObject(self, originalSizeKey,@(originalSize), OBJC_ASSOCIATION_ASSIGN);
}

-(CGFloat)originalSize{
    return [(NSNumber*)objc_getAssociatedObject(self, originalSizeKey) floatValue];
}

-(void)setBoldFont{
    self.font = [UIFont boldSystemFontOfSize:self.font.pointSize];
}

-(void)setOriginalFont{
    self.font = [UIFont systemFontOfSize:self.font.pointSize];
}

@end
