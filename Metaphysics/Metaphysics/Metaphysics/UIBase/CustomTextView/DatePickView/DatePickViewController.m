//
//  DatePickViewController.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/15.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DatePickViewController.h"
#import "DatePickViewModel.h"
#import "NSString+Addition.h"
@interface DatePickViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,weak)IBOutlet UIPickerView *pickView;
@property (nonatomic,strong)DatePickViewModel *viewModel;
@end

@implementation DatePickViewController
@dynamic viewModel;

+(UIPopoverController*)presentViewControllerWithRect:(CGRect)rect view:(UIView<UIPopoverControllerDelegate>*)view type:(CalendarType)type{
    
    DatePickViewController *picker = [[DatePickViewController alloc] initWithCalendarType:type];
    picker.preferredContentSize = CGSizeMake(datePickerWidth,
                                            datePickerHeight);
    UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:picker];
    [pop presentPopoverFromRect:rect
                         inView:view
       permittedArrowDirections:UIPopoverArrowDirectionUp
                       animated:YES];
    pop.delegate = view;
    return pop;
}

-(instancetype)initWithCalendarType:(CalendarType)type{
    DatePickViewModel *viewModel = [[DatePickViewModel alloc] init];
    self = [super initWithViewModel:viewModel];
    self.viewModel.calendarType = type;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.borderColor = [UIColor blackColor].CGColor;
    self.view.layer.borderWidth = 1.0f;

    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.viewModel.calendarType == CalendarTypeGregorian){
        [self selectGregorianRow];
    }
    else{
        [self selectLuanrRow];
    }
    
}

-(void)selectGregorianRow{
    if([self.viewModel.yearsArr containsObject:self.viewModel.date.gregorianYear]){
        NSInteger row = [self.viewModel.yearsArr indexOfObject:self.viewModel.date.gregorianYear];
        if(self.viewModel.yearsArr.count>row){
            [self.pickView selectRow:row inComponent:0 animated:YES];
        }
        
    }
    if([self.viewModel.monthsArr containsObject:self.viewModel.date.gregorianMonth]){
        NSInteger row = [self.viewModel.monthsArr indexOfObject:self.viewModel.date.gregorianMonth];
        if(self.viewModel.monthsArr.count>row){
            [self.pickView selectRow:row inComponent:1 animated:YES];
        }
    }
    if([self.viewModel.daysArr containsObject:self.viewModel.date.gregorianDay]){
        NSInteger row = [self.viewModel.daysArr indexOfObject:self.viewModel.date.gregorianDay];
        if(self.viewModel.daysArr.count>row){
            [self.pickView selectRow:row inComponent:2 animated:YES];
        }
    }
    if([self.viewModel.hoursArr containsObject:self.viewModel.date.gregorianHour]){
        NSInteger row = [self.viewModel.hoursArr indexOfObject:self.viewModel.date.gregorianHour];
        if(self.viewModel.hoursArr.count>row){
            [self.pickView selectRow:row inComponent:3 animated:YES];
        }
    }
}

-(void)selectLuanrRow{
    if([self.viewModel.yearsArr containsObject:self.viewModel.date.lunarYear]){
        NSInteger row = [self.viewModel.yearsArr indexOfObject:self.viewModel.date.lunarYear];
        if(self.viewModel.yearsArr.count>row){
            [self.pickView selectRow:row inComponent:0 animated:YES];
        }
        
    }
    if([self.viewModel.monthsArr containsObject:self.viewModel.date.lunarMonth]){
        NSInteger row = [self.viewModel.monthsArr indexOfObject:self.viewModel.date.lunarMonth];
        if([self.viewModel.date.isLeapMonth boolValue]){
            row += 1;
        }
        if(self.viewModel.monthsArr.count>row){
            [self.pickView selectRow:row inComponent:1 animated:YES];
        }
    }
    if([self.viewModel.daysArr containsObject:self.viewModel.date.lunarDay]){
        NSInteger row = [self.viewModel.daysArr indexOfObject:self.viewModel.date.lunarDay];
        if(self.viewModel.daysArr.count>row){
            [self.pickView selectRow:row inComponent:2 animated:YES];
        }
    }
    if([self.viewModel.hoursArr containsObject:self.viewModel.date.lunarHour]){
        NSInteger row = [self.viewModel.hoursArr indexOfObject:self.viewModel.date.lunarHour];
        if(self.viewModel.hoursArr.count>row){
            [self.pickView selectRow:row inComponent:3 animated:YES];
        }
    }
}

#pragma mark - UIPickerViewDataSource
//年日月时 一共4个
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger row = 1;
    if(component == 0){
        row = self.viewModel.yearsArr.count;
    }
    else if (component == 1){
        row = self.viewModel.monthsArr.count;
    }
    else if (component == 2){
        row = self.viewModel.daysArr.count;
    }
    else if (component == 3){
        row = self.viewModel.hoursArr.count;
    }
    return row;
}

#pragma mark - UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    CGFloat width = 0.0f;
    if(component == 0){
        width = yearComponentWidth;
    }
    else if (component == 1){
        width = monthComponentWidth;
    }
    else if (component == 2){
        width = dayComponentWidth;
    }
    else if (component == 3){
        width = hourComponentWidth;
    }
    return width;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return datePickerRowHeight;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *title;
    if(component == 0){
        return [self.viewModel.yearsArr[row] stringValue];
    }
    else if (component == 1){
        if(self.viewModel.calendarType == CalendarTypeLunar){
            if(self.viewModel.leapMonth == row &&
               self.viewModel.leapMonth == [self.viewModel.monthsArr[row] integerValue]){
                return [NSString stringWithFormat:@"闰%@",[self.viewModel.monthsArr[row] stringValue]];
            }
            else{
                return [self.viewModel.monthsArr[row] stringValue];
            }
        }
        else{
            return [self.viewModel.monthsArr[row] stringValue];
        }
        
    }
    else if (component == 2){
        return [self.viewModel.daysArr[row] stringValue];
    }
    else if (component == 3){
        if(self.viewModel.calendarType == CalendarTypeGregorian){
            return [self.viewModel.hoursArr[row] stringValue];
        }
        else{
            return [NSString shiChenWithTime:[self.viewModel.hoursArr[row] integerValue]];
        }
        
    }
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){
        if(self.viewModel.calendarType == CalendarTypeGregorian){
            self.viewModel.date.gregorianYear = self.viewModel.yearsArr[row] ;
        }
        //农历要重新计算月份
        else{
            self.viewModel.date.lunarYear = self.viewModel.yearsArr[row];
            [self.viewModel createMonthsArr];
            [pickerView reloadComponent:1];
        }
        [self.viewModel createDaysArr];
        [pickerView reloadComponent:2];
    }
    else if(component == 1){
        if(self.viewModel.calendarType == CalendarTypeGregorian){
            self.viewModel.date.gregorianMonth = self.viewModel.monthsArr[row] ;
        }
        else{
            //当前选中的是闰月
            if(self.viewModel.leapMonth == row &&
               self.viewModel.leapMonth == [self.viewModel.monthsArr[row] integerValue]){
                self.viewModel.date.isLeapMonth = @(YES);
            }
            //不是闰月
            else{
                self.viewModel.date.isLeapMonth = @(NO);
            }
            self.viewModel.date.lunarMonth = self.viewModel.monthsArr[row] ;
        }
        
        [self.viewModel createDaysArr];
        [pickerView reloadComponent:2];
    }
    else if(component == 2){
        if(self.viewModel.calendarType == CalendarTypeGregorian){
            self.viewModel.date.gregorianDay = self.viewModel.daysArr[row] ;
        }
        else{
            self.viewModel.date.lunarDay = self.viewModel.daysArr[row] ;
        }
        
    }
    else {
        if(self.viewModel.calendarType == CalendarTypeGregorian){
            self.viewModel.date.gregorianHour = self.viewModel.hoursArr[row] ;
        }
        else{
            self.viewModel.date.lunarHour = self.viewModel.hoursArr[row] ;
        }
    }
}
@end
