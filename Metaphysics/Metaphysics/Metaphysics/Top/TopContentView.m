//
//  TopContentView.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "TopContentView.h"
#import "UIConstantParameter.h"
#import "DatePickViewController.h"
#import "MainViewModel.h"
//PlaceHolderView(TopContentView)

@interface TopContentView()<UITextFieldDelegate>
@property (nonatomic,weak)CurrentSelectDate *date;
@end

@implementation TopContentView
#pragma mark - 初始化
+(instancetype)instanceTopContentView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.hideButton setTitle:@"●" forState:UIControlStateNormal];
    self.hideButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_16];
    self.gregorianYearTxt.keyboardType = UIKeyboardTypeNumberPad;
    self.gregorianYearTxt.delegate = self;
    self.gregorianMonthTxt.keyboardType = UIKeyboardTypeNumberPad;
    self.gregorianMonthTxt.delegate = self;
    self.gregorianDayTxt.keyboardType = UIKeyboardTypeNumberPad;
    self.gregorianDayTxt.delegate = self;
    self.gregorianHourTxt.keyboardType = UIKeyboardTypeNumberPad;
    self.gregorianHourTxt.delegate = self;
    self.lunarYearTxt.keyboardType = UIKeyboardTypeNumberPad;
    self.lunarYearTxt.delegate = self;
    self.lunarMonthTxt.keyboardType = UIKeyboardTypeNumberPad;
    self.lunarMonthTxt.delegate = self;
    self.lunarDayTxt.keyboardType = UIKeyboardTypeNumberPad;
    self.lunarDayTxt.delegate = self;
    self.lunarHourTxt.keyboardType = UIKeyboardTypeNumberPad;
    self.lunarHourTxt.delegate = self;
    
    [self resetGregorianValue];
    [self resetLunarValue];
    
}

-(id)awakeAfterUsingCoder:(NSCoder *)aDecoder{
    self.date = [MainViewModel sharedInstance].selectedDate;
    return [super awakeAfterUsingCoder:aDecoder];
}

-(void)bindViewModel{
    CurrentSelectDate *date = [MainViewModel sharedInstance].selectedDate;
    @weakify(self)
    [[[RACSignal combineLatest:@[RACObserve(date, gregorianYear),
                                 RACObserve(date, gregorianMonth),
                                 RACObserve(date, gregorianDay),
                                 RACObserve(date, gregorianHour)] reduce:^id(NSNumber *year,
                                                                             NSNumber *month,
                                                                             NSNumber *day,
                                                                             NSNumber *hour){
                                     //全都不为空且修改过
                                     if(year && month && day && hour){
                                         
                                     }
                                     return nil;
                                 }]
      deliverOnMainThread]
     subscribeNext:^(id _){
         @strongify(self)
         [self resetGregorianValue];
     }];
    
    [[self.gregorianYearTxt.rac_textSignal
      deliverOnMainThread]
     subscribeNext:^(NSString *text){
         if(text.length>0){
             date.gregorianYear = @([text integerValue]);
         }
    }];
}

//重置公历
-(void)resetGregorianValue{
    self.gregorianYearTxt.text = [self.date.gregorianYear stringValue].length>0?[self.date.gregorianYear stringValue]:@"";
    self.gregorianMonthTxt.text = [self.date.gregorianMonth stringValue].length>0?[self.date.gregorianMonth stringValue]:@"";
    self.gregorianDayTxt.text = [self.date.gregorianDay stringValue].length>0?[self.date.gregorianDay stringValue]:@"";
    self.gregorianHourTxt.text = [self.date.gregorianHour stringValue].length>0?[self.date.gregorianHour stringValue]:@"";
}

//重置农历
-(void)resetLunarValue{
    self.lunarYearTxt.text = [self.date.lunarYear stringValue];
    self.lunarMonthTxt.text = [self.date.lunarMonth stringValue];
    self.lunarDayTxt.text = [self.date.lunarDay stringValue];
    self.lunarHourTxt.text = [self.date.lunarHour stringValue];
}
#pragma mark - 点击操作
-(IBAction)hideButtonClickAction{
    self.firstTextField.hidden = !self.firstTextField.hidden;
}

//农历选择
-(IBAction)lunarCalendarSelecteAction:(UIButton*)sender{
    
}

//公历选择
-(IBAction)gregorianCalendarSelecteAction:(UIButton*)sender{
    [DatePickViewController presentViewControllerWithRect:sender.frame
                                                     view:self
                                                     type:CalendarTypeGregorian];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField == self.gregorianYearTxt ||
       textField == self.lunarYearTxt){
        NSString *completeStr = [textField.text stringByReplacingCharactersInRange:range
                                                                        withString:string];
        if(completeStr.length>4){
            return NO;
        }
        if(string.length>0){
            unichar single = [string characterAtIndex:0];
            if(single >= '0' && single <= '9'){
                return YES;
            }
        }
        else{
            return YES;
        }
    }
    else if(textField == self.gregorianMonthTxt ||
            textField == self.lunarMonthTxt){
        NSString *completeStr = [textField.text stringByReplacingCharactersInRange:range
                                                                        withString:string];
        if(completeStr.length>2){
            return NO;
        }
        
        if([completeStr integerValue]>12){
            return NO;
        }
        
        if(string.length>0){
            unichar single = [string characterAtIndex:0];
            if(single >= '1' && single <= '9'){
                return YES;
            }
        }
        else{
            return YES;
        }
    }
    else if(textField == self.gregorianDayTxt ||
            textField == self.lunarDayTxt){
        NSString *completeStr = [textField.text stringByReplacingCharactersInRange:range
                                                                        withString:string];
        if(completeStr.length>2){
            return NO;
        }
        
        if([completeStr integerValue]>31){
            return NO;
        }
        
        if(string.length>0){
            unichar single = [string characterAtIndex:0];
            if(single >= '0' && single <= '9'){
                return YES;
            }
        }
        else{
            return YES;
        }
    }
    else if(textField == self.gregorianHourTxt ||
            textField == self.lunarHourTxt){
        NSString *completeStr = [textField.text stringByReplacingCharactersInRange:range
                                                                        withString:string];
        if(completeStr.length>2){
            return NO;
        }
        
        if([completeStr integerValue]>12){
            return NO;
        }
        
        if(string.length>0){
            unichar single = [string characterAtIndex:0];
            if(single >= '1' && single <= '9'){
                return YES;
            }
        }
        else{
            return YES;
        }
    }
    return NO;
}

@end
