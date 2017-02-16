//
//  DatePickViewController.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/15.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DatePickViewController.h"
#import "DatePickViewModel.h"
@interface DatePickViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,weak)IBOutlet UIPickerView *pickView;
@property (nonatomic,strong)DatePickViewModel *viewModel;
@end

@implementation DatePickViewController
@dynamic viewModel;

+(void)presentViewControllerWithRect:(CGRect)rect view:(UIView*)view type:(CalendarType)type{
    
    DatePickViewController *picker = [[DatePickViewController alloc] initWithCalendarType:type];
    picker.preferredContentSize = CGSizeMake(datePickerWidth,
                                            datePickerHeight);
    UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:picker];
    [pop presentPopoverFromRect:rect
                         inView:view
       permittedArrowDirections:UIPopoverArrowDirectionUp
                       animated:YES];
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
        return [self.viewModel.monthsArr[row] stringValue];
    }
    else if (component == 2){
        return [self.viewModel.daysArr[row] stringValue];
    }
    else if (component == 3){
        return [self.viewModel.hoursArr[row] stringValue];
    }
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component == 0){
        self.viewModel.currentSelectDay = [self.viewModel.yearsArr[row] integerValue];
    }
    else if(component == 1){
        self.viewModel.currentSelectMonth = [self.viewModel.monthsArr[row] integerValue];
        [self.viewModel createDaysArr];
        [pickerView reloadComponent:2];
    }
    else if(component == 2){
        self.viewModel.currentSelectDay = [self.viewModel.daysArr[row] integerValue];
    }
    else {
        self.viewModel.currentSelectHour = [self.viewModel.hoursArr[row] integerValue];
    }
}
@end
