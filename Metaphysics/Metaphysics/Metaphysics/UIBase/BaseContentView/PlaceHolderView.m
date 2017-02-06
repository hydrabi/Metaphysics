//
//  PlaceHolderView.m
//  17Track
//
//  Created by Halin on 15-3-11.
//  Copyright (c) 2015年 17Track. All rights reserved.
//

#import "PlaceHolderView.h"

@implementation PlaceHolderView

/**从coder初始化*/
- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder{
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *xibName = [self xibName];
    NSString *phoneModel = [self iphoneModel];
    NSString *modelXibName = [NSString stringWithFormat:@"%@_%@",xibName,phoneModel];
    NSString *pathForModelXib = [mainBundle pathForResource:modelXibName ofType:@"nib"];
    
    NSArray *viewArray;
    if (pathForModelXib) {
        viewArray = [mainBundle loadNibNamed:modelXibName owner:nil options:nil];
    }else{
        viewArray = [mainBundle loadNibNamed:xibName      owner:nil options:nil];
    }
    
    
    UIView *view =[viewArray firstObject];      //从xib加载view
    view.translatesAutoresizingMaskIntoConstraints = NO;                                                            //禁止将view的边距转换为约束
    if ([view conformsToProtocol:@protocol(PlaceHolderInitDelegate)]) {
        //如果实现了PlaceHolderInitDelegate,调用commonInitCallByPlaceHolderView方法
        if([view respondsToSelector:@selector(commonInitCallByPlaceHolderView)]){
            [(id<PlaceHolderInitDelegate>)view commonInitCallByPlaceHolderView];
        }else{
            NSLog(@"Warning , commonInitCallByPlaceHolderView is not responds for view %@",view);
        }
    }
    return view;            //使用新的view替换本来的view
}

/**获得手机对应型号的*/
- (NSString *)iphoneModel{
    
    /**
     * 屏幕height
     * iPhone 6+ : 736
     * iPhone 6  : 667
     * iPhone 5s : 568
     * iPhone 5  : 568
     * iPhone 4s : 480
     */
    
    float screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (screenHeight < 500) {
        return PLACE_HOLDER_VIEW_SUFFIX_IPHONE_4;
    }else if(screenHeight < 600){
        return PLACE_HOLDER_VIEW_SUFFIX_IPHONE_5;
    }else if(screenHeight < 700){
        return PLACE_HOLDER_VIEW_SUFFIX_IPHONE_6;
    }else{
        return PLACE_HOLDER_VIEW_SUFFIX_IPHONE_6P;
    }
}


- (NSString *)xibName{return nil;}//空实现

@end