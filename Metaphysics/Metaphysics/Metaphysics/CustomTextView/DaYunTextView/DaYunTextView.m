//
//  DaYunTextView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/2.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "DaYunTextView.h"
#import "UIConstantParameter.h"
#import "DaYunTableViewDataSource.h"
@interface DaYunTextView()
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *textFieldsArr;
@property (nonatomic,strong)DaYunTableViewDataSource *dataSource;
@property (nonatomic,strong)UILabel *titleLabel;
@end

@implementation DaYunTextView

-(instancetype)init{
    self = [super init];
    if(self){
        [self UIConfig];
        [self makeConstraints];
    }
    return self;
}

-(void)UIConfig{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:titleFontSize_30];
    self.titleLabel.text = @"大运";
    [self addSubview:self.titleLabel];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];
    
    self.dataSource = [[DaYunTableViewDataSource alloc] initWithTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    
    self.textFieldsArr = @[].mutableCopy;
    for(NSInteger i = 0;i<daYunTableViewCount;i++){
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
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.top).offset(leftVerLineOffset);
        make.centerX.equalTo(self.centerX);
    }];
    
    [self.tableView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.leading).offset(0);
        make.top.equalTo(textViewTitleHeight);
        make.bottom.equalTo(self.bottom).offset(0);
        make.width.equalTo(daYunTableViewWidth);
    }];
    
    UITextField *lastTextField = nil;
    for(NSInteger i = 0;i<self.textFieldsArr.count;i++){
        UITextField *textField = self.textFieldsArr[i];
        
        [textField makeConstraints:^(MASConstraintMaker *make){
            @strongify(self)
            make.leading.equalTo(self.tableView.trailing).offset(offset_16);
            if(lastTextField){
                make.top.equalTo(lastTextField.bottom).offset(0);
            }
            else{
                make.top.equalTo(self.top).offset(textViewTitleHeight);
            }
            make.trailing.equalTo(self.trailing).offset(@(-offset_16));
            make.height.equalTo(daYunTableCellHeight);
        }];
        
        lastTextField = textField;
    }
}
@end
