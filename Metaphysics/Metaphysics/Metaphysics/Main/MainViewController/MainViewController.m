//
//  MainViewController.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/28.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewModel.h"
#import "LeftSideMenuDataSource.h"
#import "TopContentView.h"
#import "MiddleContentView.h"
#import "BottomContentView.h"
#import "UIConstantParameter.h"
#import "DaYunTextView.h"
@interface MainViewController ()
@property (nonatomic,strong)MainViewModel *viewModel;
@property (nonatomic,strong)UITableView *leftSideMenuTabelView;
@property (nonatomic,strong)LeftSideMenuDataSource *tableViewDataSource;
@property (nonatomic,strong)TopContentView *topContentView;
@property (nonatomic,strong)MiddleContentView *middleContentView;
@property (nonatomic,strong)BottomContentView *bottomContentView;
@property (nonatomic,strong)UITextView *bottomTextView;
@property (nonatomic,strong)UILabel *dateLabel;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)DaYunTextView *daYunTextView;
@property (nonatomic,strong)UIView *firstVerLine;
@property (nonatomic,strong)UIView *secondVerLine;
@end

@implementation MainViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self UIConfig];
    [self bindViewModel];
}


-(void)UIConfig{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.leftSideMenuTabelView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.leftSideMenuTabelView];
    self.tableViewDataSource = [[LeftSideMenuDataSource alloc] initWithViewModel:self.viewModel
                                                                       tableView:self.leftSideMenuTabelView];
    self.leftSideMenuTabelView.delegate = self.tableViewDataSource;
    self.leftSideMenuTabelView.dataSource = self.tableViewDataSource;
    
    self.firstVerLine = [[UIView alloc] init];
    self.firstVerLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.firstVerLine];
    
    self.secondVerLine = [[UIView alloc] init];
    self.secondVerLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.secondVerLine];
    
    self.topContentView = [TopContentView instanceTopContentView];
    [self.view addSubview:self.topContentView];
    
    self.middleContentView = [[MiddleContentView alloc] init];
    [self.view addSubview:self.middleContentView];
    
    self.bottomContentView = [[BottomContentView alloc] init];
    [self.view addSubview:self.bottomContentView];
    
    self.bottomTextView = [[UITextView alloc] init];
    self.bottomTextView.scrollEnabled = NO;
    self.bottomTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.bottomTextView.layer.borderWidth = 1.0f;
    self.bottomTextView.hidden = YES;
    [self.view addSubview:self.bottomTextView];
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.dateLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.dateLabel];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                               target:self
                                                             selector:@selector(resetDate)
                                                             userInfo:nil
                                                              repeats:YES];
    
    self.daYunTextView = [[DaYunTextView alloc] init];
    self.daYunTextView.hidden = YES;
    [self.view addSubview:self.daYunTextView];
    
    @weakify(self)
    [self.leftSideMenuTabelView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.view.leading).offset(0);
        make.top.equalTo(self.view.top).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.width.equalTo(leftSideTableViewWidth);
    }];
    
    [self.firstVerLine makeConstraints:^(MASConstraintMaker *make){
       @strongify(self)
        make.leading.equalTo(self.leftSideMenuTabelView.trailing).offset(0);
        make.top.equalTo(self.view.top).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.width.equalTo(leftVerLineWidth);
    }];
    
    [self.secondVerLine makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.firstVerLine.trailing).offset(leftVerLineOffset);
        make.top.equalTo(self.view.top).offset(0);
        make.bottom.equalTo(self.view.bottom).offset(0);
        make.width.equalTo(leftVerLineWidth);
    }];
    
    [self.topContentView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(0);
        make.top.equalTo(self.view.top).offset(0);
        make.trailing.equalTo(self.view.trailing).offset(0);
        make.height.equalTo(topViewHeight);
    }];
    
    [self.middleContentView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(0);
        make.top.equalTo(self.topContentView.bottom).offset(contentViewOffset);
        make.trailing.equalTo(self.view.trailing).offset(0);
        make.height.equalTo(middleViewHeight);
    }];
    
    [self.bottomContentView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(0);
        make.top.equalTo(self.middleContentView.bottom).offset(contentViewOffset);
        make.trailing.equalTo(self.view.trailing).offset(0);
        make.height.equalTo(bottomViewHeight);
    }];
    
    [self.bottomTextView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(@(offset_16));
        make.top.equalTo(self.bottomContentView.bottom).offset(0);
        make.trailing.equalTo(self.view.trailing).offset(@(-offset_16));
        make.height.equalTo(bottomTextViewHeight);
    }];
    
    [self.dateLabel makeConstraints:^(MASConstraintMaker *make){
       @strongify(self)
        make.trailing.equalTo(self.view.trailing).offset(@(-offset_16));
        make.bottom.equalTo(self.view.bottom).offset(0);
    }];
    
    [self.daYunTextView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(offset_16);
        make.top.equalTo(self.bottomContentView.top).offset(tableViewHeaderHeight);
        make.trailing.equalTo(self.view.trailing).offset(@(-offset_16));
        make.height.equalTo(daYunTextViewHeight);
    }];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)resetDate{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    self.dateLabel.text = [format stringFromDate:[NSDate date]];
}

-(void)bindViewModel{
    @weakify(self)
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    [[mainViewModel.bottomTextViewOperationSig
      deliverOnMainThread]
     subscribeNext:^(id _){
         @strongify(self)
         if([MainViewModel sharedInstance].hadShowBottomTextView){
             self.bottomTextView.hidden = NO;
         }
         else{
             self.bottomTextView.hidden = YES;
         }
     }];
    
    [[[RACObserve(mainViewModel, hadShowDaYunTextView)
      distinctUntilChanged]
      deliverOnMainThread]
     subscribeNext:^(id _){
        @strongify(self)
         if(mainViewModel.hadShowDaYunTextView){
             self.daYunTextView.hidden = NO;
         }
         else{
             self.daYunTextView.hidden = YES;
         }
     }];
}

@end
