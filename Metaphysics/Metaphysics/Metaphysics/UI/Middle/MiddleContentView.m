//
//  MiddleContentView.m
//  Metaphysics
//
//  Created by Hydra on 2017/1/29.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "MiddleContentView.h"
#import "MiddleSubView.h"
#import "UIConstantParameter.h"
@interface MiddleContentView()
//乾坤
@property (nonatomic,strong)UIButton *genderButton;
@property (nonatomic,strong)MiddleSubView *yearSubView;
@property (nonatomic,strong)MiddleSubView *monthSubView;
@property (nonatomic,strong)MiddleSubView *daySubView;
@property (nonatomic,strong)MiddleSubView *hourSubView;
@end

@implementation MiddleContentView

+(instancetype)instanceMiddleContentView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return [nibView objectAtIndex:0];
}


-(instancetype)init{
    self = [super init];
    if(self){
        [self UIConfig];
        [self bindViewModel];
    }
    return self;
}

-(void)UIConfig{
    self.genderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.genderButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.genderButton.titleLabel.font = [UIFont systemFontOfSize:titleFontSize_90];
    [self.genderButton setTitle:@"乾" forState:UIControlStateNormal];
    [self addSubview:self.genderButton];
    
    self.yearSubView = [MiddleSubView instanceMiddleSubViewWithType:MiddleSubViewTypeYear];
    [self addSubview:self.yearSubView];
    
    self.monthSubView = [MiddleSubView instanceMiddleSubViewWithType:MiddleSubViewTypeMonth];
    [self addSubview:self.monthSubView];
    
    self.daySubView = [MiddleSubView instanceMiddleSubViewWithType:MiddleSubViewTypeDay];
    [self addSubview:self.daySubView];
    
    self.hourSubView = [MiddleSubView instanceMiddleSubViewWithType:MiddleSubViewTypeHour];
    [self addSubview:self.hourSubView];
    
    [self makeConstraints];
}

-(void)makeConstraints{
    @weakify(self)
    [self.genderButton makeConstraints:^(MASConstraintMaker *make){
        @strongify(self)
        make.leading.equalTo(self.leading).offset(offset_16);
        make.top.equalTo(self.top).offset(offset_16);
        make.width.and.height.equalTo(middleMainButtonWidthAndheight);
        make.trailing.equalTo(self.yearSubView.leading).offset(-(middleViewOffset));
    }];
    
    NSArray *tempArr = @[self.yearSubView,
                         self.monthSubView,
                         self.daySubView,
                         self.hourSubView];
    MiddleSubView *lastView = nil;
    
    for(NSInteger i = 0;i < tempArr.count; i++){
        MiddleSubView *subView = tempArr[i];
        [subView makeConstraints:^(MASConstraintMaker *make){
            @strongify(self)
            make.top.equalTo(self.top).offset(0);
            make.bottom.equalTo(self.bottom).offset(0);
            if(lastView){
                make.leading.equalTo(lastView.trailing).offset(middleViewOffset);
                make.width.equalTo(lastView.width);
            }
        
            if(i == tempArr.count - 1){
                make.trailing.equalTo(self.trailing).offset(@(-(middleViewOffset)));
            }
        }];
        
        lastView = subView;
    }
}

-(void)bindViewModel{
    
    RACSignal *lToSSignal = [[MainViewModel sharedInstance] rac_signalForSelector:@selector(lunarToSolar)];
    RACSignal *sToLSignal = [[MainViewModel sharedInstance] rac_signalForSelector:@selector(solarToLunar)];
    @weakify(self)
    [[lToSSignal merge:sToLSignal]
     subscribeNext:^(id _){
         @strongify(self)
         [self.yearSubView reloadData];
         [self.monthSubView reloadData];
         [self.daySubView reloadData];
         [self.hourSubView reloadData];
     }];
}
@end
