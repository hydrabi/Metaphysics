//
//  PlaceHolderView.h
//  17Track
//
//  Created by Halin on 15-3-11.
//  Copyright (c) 2015年 17Track. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PlaceHolderView(name) @interface PlaceHolderView##name:PlaceHolderView @end  @implementation PlaceHolderView##name - (NSString *)xibName{    return NSStringFromClass([name class]); } @end


static NSString *const PLACE_HOLDER_VIEW_SUFFIX_IPHONE_6P = @"6P";
static NSString *const PLACE_HOLDER_VIEW_SUFFIX_IPHONE_6  = @"6";
static NSString *const PLACE_HOLDER_VIEW_SUFFIX_IPHONE_5  = @"5";
static NSString *const PLACE_HOLDER_VIEW_SUFFIX_IPHONE_4  = @"4";

/**PlaceHolderView的初始化方式会导致awakeFromNib被两次调用（一次在外层的nib，第二次在自身的nib），而initWithCoder时，自身对象并未初始化，对一些必须一次初始化的调用不利，继承PlaceHolderInitDelegate后，可以保证在自身对象初始化后，commonInitCallByPlaceHolderView被调用一次
    注意事项：
    1.使用PlaceHolder做绑定时，需要先将View的类改为目标类，绑定后再改为PlaceHolderViewxxx类，否则无法绑定
    2.在子View的XIB中，若有subView要对齐或等高View，需要设置View的Content Hugging Priority和Content Compressing Resistance Priority 为Require，否则显示会不正常
    3.view的高度只能由intrinsicContentSize决定(或者由子xib对齐完成),
 */
@protocol PlaceHolderInitDelegate <NSObject>

/**从xib加载的初始化方法*/
- (void)commonInitCallByPlaceHolderView;

@end


/**
 实现View替换的方法，利用awakeAfterUsingCoder可以使用已存在view的方法替换成目标view，相比再initWithCoder中，添加子View的方法，这种减少了一层View，同时也不会收到View本身约束的影响，可使用PlaceHolder(name)定义快速定义子view 
 */
@interface PlaceHolderView : UIView

/**xibName,使用PlaceHolderView(name)定义将使其默认变成类名*/
- (NSString *)xibName;

@end
