//
//  BottomContentView.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/30.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomContentView.h"
#import "UIConstantParameter.h"
#import "MainViewModel.h"
@interface BottomContentView()
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)NSMutableArray *tableViewsArr;
@end

@implementation BottomContentView

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
    
    self.tableViewsArr = @[].mutableCopy;
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.contentSize = CGSizeMake(tableViewCount*tableViewWidth+(tableViewCount-1)*tableViewOffset, scrollViewHeight);
    self.scrollView.scrollEnabled = YES;
    [self addSubview:self.scrollView];
    
    for(NSInteger i = 0;i<tableViewCount;i++){
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                              style:UITableViewStylePlain];
        tableView.tag = i;
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.scrollEnabled = NO;
        [self.tableViewsArr addObject:tableView];
        [self.scrollView addSubview:tableView];
    }
    self.dataSorce = [[BottomTableViewDataSource alloc] initWithTableViews:self.tableViewsArr];
}

-(void)makeConstraints{
    @weakify(self)
    [self.scrollView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.leading).offset(0);
        make.trailing.equalTo(self.trailing).offset(0);
        make.top.equalTo(self.top).offset(0);
        make.bottom.equalTo(self.bottom).offset(0);
    }];
    
    CGFloat offset = tableViewFirstVerOffset;
    for(NSInteger i = 0;i<tableViewCount;i++){
        UITableView *tableView = self.tableViewsArr[i];
        tableView.frame = CGRectMake(offset, 0, tableViewWidth, scrollViewHeight);
        tableView.delegate = self.dataSorce;
        tableView.dataSource = self.dataSorce;
        offset += tableViewWidth+tableViewOffset;
    }
}

-(void)bindViewModel{
    @weakify(self)
    [[[MainViewModel sharedInstance].reloadTablesSig
      deliverOnMainThread]
     subscribeNext:^(id _){
         @strongify(self)
         for(NSInteger i = 0;i<self.tableViewsArr.count;i++){
             UITableView *tableView = self.tableViewsArr[i];
             [tableView reloadData];
         }
     }];
}

@end
