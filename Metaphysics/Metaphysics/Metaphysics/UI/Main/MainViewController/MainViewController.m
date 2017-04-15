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
#import "FifteenYunTextView.h"
#import "LiuNianTextView.h"
#import "NormalTextView.h"
#import "ShuangZaoTextView.h"
#import "SolarTermsCollectionView.h"

@interface MainViewController ()
@property (nonatomic,strong)MainViewModel *viewModel;
@property (nonatomic,strong)UITableView *leftSideMenuTabelView;
@property (nonatomic,strong)LeftSideMenuDataSource *tableViewDataSource;
@property (nonatomic,strong)TopContentView *topContentView;
@property (nonatomic,strong)MiddleContentView *middleContentView;
@property (nonatomic,strong)BottomContentView *bottomContentView;
@property (nonatomic,strong)LiuNianTextView *liuNianTextView;
@property (nonatomic,strong)UILabel *dateLabel;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)DaYunTextView *daYunTextView;
@property (nonatomic,strong)NormalTextView *normalTextView;
@property (nonatomic,strong)FifteenYunTextView *fifteenYunTextView;
@property (nonatomic,strong)ShuangZaoTextView *shuangZaoTextView;
@property (nonatomic,strong)SolarTermsCollectionView *solarTermsView;
@property (nonatomic,weak)UIView *currentTextView;
@property (nonatomic,strong)UIView *firstVerLine;
@property (nonatomic,strong)UIView *secondVerLine;
@end

@implementation MainViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self UIConfig];
    [self makeConstraints];
    [self bindViewModel];
}

#pragma mark - UI
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
    [self.topContentView bindViewModel];
    
    self.middleContentView = [[MiddleContentView alloc] init];
    [self.view addSubview:self.middleContentView];
    
    self.bottomContentView = [[BottomContentView alloc] init];
    [self.view addSubview:self.bottomContentView];
    
    self.liuNianTextView = [LiuNianTextView instanceLiuNianTextView];
    self.liuNianTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.liuNianTextView.layer.borderWidth = 1.0f;
    self.liuNianTextView.hidden = YES;
    [self.view addSubview:self.liuNianTextView];
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.font = [UIFont systemFontOfSize:titleFontSize_20];
    self.dateLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.dateLabel];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                               target:self
                                                             selector:@selector(resetDate)
                                                             userInfo:nil
                                                              repeats:YES];
    
    self.currentTextView = nil;
    
    self.daYunTextView = [[DaYunTextView alloc] init];
    self.daYunTextView.hidden = YES;
    [self.view addSubview:self.daYunTextView];
    
    self.fifteenYunTextView = [[FifteenYunTextView alloc] init];
    self.fifteenYunTextView.hidden = YES;
    [self.view addSubview:self.fifteenYunTextView];
    
    self.normalTextView = [NormalTextView instanceNormalTextView];
    self.normalTextView.hidden = YES;
    [self.view addSubview:self.normalTextView];
    
    self.shuangZaoTextView = [ShuangZaoTextView instanceShuangZaoTextView];
    self.shuangZaoTextView.hidden = YES;
    [self.view addSubview:self.shuangZaoTextView];
    [self.shuangZaoTextView resetValue];
    
    self.solarTermsView  = [SolarTermsCollectionView createSolarTermsCollectionView];
    self.solarTermsView.hidden = YES;
    [self.view addSubview:self.solarTermsView];
    
}

-(void)makeConstraints{
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
    
    [self.liuNianTextView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(@(leftVerLineOffset));
        make.top.equalTo(self.bottomContentView.bottom).offset(leftVerLineOffset);
        make.trailing.equalTo(self.view.trailing).offset(@(-leftVerLineOffset));
        make.height.equalTo(bottomTextViewHeight);
    }];
    
    [self.dateLabel makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.trailing.equalTo(self.view.trailing).offset(@(-offset_16));
        make.bottom.equalTo(self.view.bottom).offset(0);
    }];
    
    [self.daYunTextView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(leftVerLineOffset);
        make.top.equalTo(self.bottomContentView.top).offset(tableViewHeaderHeight);
        make.trailing.equalTo(self.view.trailing).offset(@(-leftVerLineOffset));
        make.height.equalTo(daYunTextViewHeight);
    }];
    
    [self.fifteenYunTextView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(leftVerLineOffset);
        make.top.equalTo(self.bottomContentView.top).offset(tableViewHeaderHeight);
        make.trailing.equalTo(self.view.trailing).offset(@(-leftVerLineOffset));
        make.height.equalTo(daYunSubTextViewHeight);
    }];
    
    [self.normalTextView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(leftVerLineOffset);
        make.top.equalTo(self.bottomContentView.top).offset(tableViewHeaderHeight);
        make.trailing.equalTo(self.view.trailing).offset(@(-leftVerLineOffset));
        make.height.equalTo(normalTextViewHeight);
    }];
    
    [self.shuangZaoTextView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(leftVerLineOffset);
        make.top.equalTo(self.view.top).offset(0);
        make.trailing.equalTo(self.view.trailing).offset(@(-leftVerLineOffset));
        make.height.equalTo(topViewHeight);
    }];
    
    [self.solarTermsView makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.secondVerLine.trailing).offset(leftVerLineOffset-1);
        make.top.equalTo(self.bottomContentView.top).offset(0);
        make.trailing.equalTo(self.view.trailing).offset(@(-leftVerLineOffset+1));
        make.height.equalTo(bottomViewHeight);
    }];
}

-(void)resetCurrentTextView:(UIView*)view{
    self.currentTextView.hidden = YES;
    if(view != nil){
        self.currentTextView = view;
        self.currentTextView.hidden = NO;
    }
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
    //流年底部textView操作
    [[mainViewModel.LiuNianTextViewOperationSig
      deliverOnMainThread]
     subscribeNext:^(id _){
         @strongify(self)
         if([MainViewModel sharedInstance].hadShowLiuNianTextView){
             self.liuNianTextView.hidden = NO;
         }
         else{
             self.liuNianTextView.hidden = YES;
         }
     }];
    
    //左边菜单底部选项选中操作
    [[[RACObserve(mainViewModel, currentBottomSectionMenuType)
      distinctUntilChanged]
      deliverOnMainThread]
     subscribeNext:^(id _){
        @strongify(self)
         if(mainViewModel.currentBottomSectionMenuType == LeftSideMenuTypeEmpty){
             [self resetCurrentTextView:nil];
         }
         else{
             
             switch (mainViewModel.currentBottomSectionMenuType) {
                 case LeftSideMenuTypeDaYun:
                 {
                     [self resetCurrentTextView:self.daYunTextView];
                     [self.daYunTextView reloadData];
                 }
                     break;
                     
                 default:
                 {
                     [self resetCurrentTextView:self.normalTextView];
                     [self.normalTextView reloadData];
                 }
                     break;
             }
         }
     }];
    
    //左边菜单上边部分选中
    [[mainViewModel.leftMenuTopSelectedOperationSig
     deliverOnMainThread]
     subscribeNext:^(id _){
         @strongify(self)
         if([mainViewModel.currentSelectTopSectionMenuTypeArr containsObject:@(LeftSideMenuTypeShuangZao)]){
             self.shuangZaoTextView.hidden = NO;
         }
         else{
             self.shuangZaoTextView.hidden = YES;
         }
     }];
    
    //15运选中操作
    [[mainViewModel.fifteenYunTextViewOperationSig
      deliverOnMainThread]
     subscribeNext:^(id _){
        @strongify(self)
         if(mainViewModel.fifteenYunData.fifteenYunSelectedNumber != -1){
             [self resetCurrentTextView:self.fifteenYunTextView];
         }
         else{
             [self resetCurrentTextView:nil];
         }
     }];
    
    //节气表选中操作
    [[RACObserve(mainViewModel, hadShowSolarTermsCollectionView)
      deliverOnMainThread]
     subscribeNext:^(id _){
         if(mainViewModel.hadShowSolarTermsCollectionView){
             [self resetCurrentTextView:self.solarTermsView];
         }
         else{
             [self resetCurrentTextView:nil];
         }
     }];
    
    //左边的菜单tableview刷新数据
    [[mainViewModel.reloadLeftTableSig
     deliverOnMainThread]
     subscribeNext:^(id _){
         @strongify(self)
         [self.leftSideMenuTabelView reloadData];
     }];
}


@end
