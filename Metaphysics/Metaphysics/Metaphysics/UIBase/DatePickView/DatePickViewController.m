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
    return 1;
}



@end
