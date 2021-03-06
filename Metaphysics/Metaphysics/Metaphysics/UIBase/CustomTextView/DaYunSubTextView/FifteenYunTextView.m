//
//  FifteenYunTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/5.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "FifteenYunTextView.h"
#import "UIConstantParameter.h"
#import "FifteenYunTableViewDataSource.h"
#import "FifteenYunTitleView.h"
#import "MainViewModel.h"
@interface FifteenYunTextView()
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *textFieldsArr;
@property (nonatomic,strong)FifteenYunTableViewDataSource *dataSource;
@property (nonatomic,strong)FifteenYunTitleView *titleView;
@end

@implementation FifteenYunTextView

-(instancetype)init{
    self = [super init];
    if(self){
        [self UIConfig];
        [self makeConstraints];
        [self bindViewModel];
    }
    return self;
}

-(void)UIConfig{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
    
    self.titleView = [FifteenYunTitleView instanceFifteenYunTitleView];
    [self addSubview:self.titleView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];
    
    self.dataSource = [[FifteenYunTableViewDataSource alloc] initWithTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    
    self.textFieldsArr = @[].mutableCopy;
    for(NSInteger i = 0;i<daYunSubTableViewCount;i++){
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectZero];
        textField.tag = i;
        textField.borderStyle = UITextBorderStyleNone;
        textField.font = [UIFont systemFontOfSize:titleFontSize_24];
        [self addSubview:textField];
        [self.textFieldsArr addObject:textField];
    }
}

-(void)makeConstraints{
    @weakify(self)
    [self.titleView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.top).offset(0);
        make.leading.equalTo(self.leading).offset(0);
        make.trailing.equalTo(self.trailing).offset(0);
        make.height.equalTo(daYunSubTitleViewHeight);
    }];
    
    [self.tableView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.leading).offset(0);
        make.top.equalTo(daYunSubTitleViewHeight);
        make.bottom.equalTo(self.bottom).offset(0);
        make.width.equalTo(daYunSubTableViewWidth);
    }];
    
    UITextField *lastTextField = nil;
    for(NSInteger i = 0;i<self.textFieldsArr.count;i++){
        UITextField *textField = self.textFieldsArr[i];
        
        [textField makeConstraints:^(MASConstraintMaker *make){
            @strongify(self)
            make.leading.equalTo(self.tableView.trailing).offset(offset_16);
            if(lastTextField){
                if(i == 5){
                    make.top.equalTo(lastTextField.bottom).offset(daYunSubTableViewMiddleOffset);
                }
                else{
                    make.top.equalTo(lastTextField.bottom).offset(0);
                }
            }
            else{
                make.top.equalTo(self.top).offset(daYunSubTitleViewHeight);
            }
            make.trailing.equalTo(self.trailing).offset(@(-offset_16));
            make.height.equalTo(daYunSubTableCellHeight);
        }];
        
        lastTextField = textField;
    }
}

-(void)bindViewModel{
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    @weakify(self)
    [RACObserve(mainViewModel.fifteenYunData, fifteenYunSelectedNumber)
     subscribeNext:^(id _){
         @strongify(self)
         [self reloadData];
     }];
}

-(void)reloadData{
    [self.titleView reloadData];
    [self.tableView reloadData];
}

@end
