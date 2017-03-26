//
//  SolarTermsCollectionView.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/19.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SolarTermsCollectionView.h"
#import "SolarTermsFirstCell.h"
#import "SolarTermsSecondCell.h"
#import "SolarTermsThirdCell.h"
#import "SolarTermsNumberCell.h"
#import "SolarTermsMulLineCell.h"
#import "SolarTermsMonthCell.h"
#import "RiZhuData.h"
#import "MainViewModel.h"

static NSString *firstCellIdentifier = @"firstCellIdentifier";
static NSString *secondCellIdentifier = @"secondCellIdentifier";
static NSString *thirdCellIdentifier = @"thirdCellIdentifier";
static NSString *numberCellIdentifier = @"numberCellIdentifier";
static NSString *numberCellIdentifier1 = @"numberCellIdentifier1";
static NSString *mulLineCellIdentifier = @"mulLineCellIdentifier";
static NSString *mulLineCellIdentifier1 = @"mulLineCellIdentifier1";
static NSString *emptyellIdentifier = @"emptyellIdentifier";
static NSString *monthCellIdentifier = @"monthCellIdentifier";

@implementation SolarTermsCollectionViewDataSource

-(instancetype)initWithCollectionView:(SolarTermsCollectionView*)collectionView{
    self = [super init];
    if(self){
        self.collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.layer.borderColor = [UIColor blackColor].CGColor;
        self.collectionView.layer.borderWidth = 1.0f;
        self.collectionView.scrollEnabled = NO;
        [self initialize];
        [self bindViewModel];
    }
    return self;
}

-(void)initialize{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SolarTermsFirstCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:firstCellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SolarTermsSecondCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:secondCellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SolarTermsThirdCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:thirdCellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SolarTermsNumberCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:numberCellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SolarTermsMulLineCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:mulLineCellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SolarTermsMonthCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:monthCellIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SolarTermsNumberCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:numberCellIdentifier1];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SolarTermsMulLineCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:mulLineCellIdentifier1];
    
    
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:emptyellIdentifier];
}

-(void)bindViewModel{
    @weakify(self)
    RiZhuData *riZhuData = [[MainViewModel sharedInstance] riZhuData];
    [[[riZhuData rac_signalForSelector:@selector(dealWithRiZhuData)]
     deliverOnMainThread]
     subscribeNext:^(id _){
         @strongify(self)
         [self.collectionView reloadData];
     }];
}

-(CGFloat)getHeightWithSection:(NSInteger)section{
    CGFloat height = 0.0f;
    switch (section) {
        case 0:
            height = 63.0f;
            break;
        case 1:
            height = 56.0f;
            break;
        case 2:
            height = 56.0f;
            break;
        case 3:
            height = 51.0f;
            break;
        case 4:
            height = 101.0f;
            break;
        case 5:
            height = 51.0f;
            break;
        case 6:
            height = 51.0f;
            break;
        case 7:
            height = 101.0f;
            break;
            
        default:
            break;
    }
    return height;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 8;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    RiZhuData *riZhuData = [[MainViewModel sharedInstance] riZhuData];
    if(section == 0){
        return 1;
    }
    else if (section == 1){
        return 2;
    }
    else if (section == 2){
        NSInteger day = 0;
        for(NSNumber *eachDay in riZhuData.separatorDayArr){
            day += eachDay.integerValue;
        }
        NSInteger item = 0;
        //一共有31个格子，如果分隔天数加起来小于31天，则有最后一个空格代表空余天数
        if(day<31){
            item = riZhuData.separatorDayArr.count+1;
        }
        //否则直接等于队列项数
        else{
            item = riZhuData.separatorDayArr.count;
        }
        return item;
    }
    else if (section == 3){
        return 31;
    }
    else if (section == 4){
        return 31;
    }
    else if (section == 5){
        return 1;
    }
    else if (section == 6){
        return 31;
    }
    else if (section == 7){
        return 31;
    }
    
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:emptyellIdentifier
                                                                           forIndexPath:indexPath];
    RiZhuData *riZhuData = [[MainViewModel sharedInstance] riZhuData];
    
    if(indexPath.section == 0){
        SolarTermsFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:firstCellIdentifier
                                                         forIndexPath:indexPath];
        cell.titleLabel.text = riZhuData.monthName;
        return cell;
    }
    else if(indexPath.section == 1){
        SolarTermsSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondCellIdentifier
                                                                              forIndexPath:indexPath];
        //有值才赋值，否则为空
        cell.titleLabel.text = @"";
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日HH时mm分"];
        //左边
        if(indexPath.row == 0){
            cell.titleLabel.textAlignment = NSTextAlignmentLeft;
            NSString *leftDate = [dateFormatter stringFromDate:riZhuData.leftTerm];
            if(leftDate.length>0){
                cell.titleLabel.text = [NSString stringWithFormat:@"%@:%@",riZhuData.leftTermName,leftDate];
            }
            
        }
        //右边
        else{
            cell.titleLabel.textAlignment = NSTextAlignmentRight;
            NSString *rightDate = [dateFormatter stringFromDate:riZhuData.rightTerm];
            if(rightDate.length>0){
                cell.titleLabel.text = [NSString stringWithFormat:@"%@:%@",riZhuData.rightTermName,rightDate];
            }
            
        }
        return cell;
    }
    else if(indexPath.section == 2){
        SolarTermsThirdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:thirdCellIdentifier
                                                                               forIndexPath:indexPath];
        NSArray *nameArr = riZhuData.separatorDayNameArr;
        if(nameArr.count>indexPath.row){
            cell.titleLabel.text = nameArr[indexPath.row];
        }
        else{
             cell.titleLabel.text = @"";
        }
        return cell;
    }
    else if(indexPath.section == 3){
        SolarTermsNumberCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:numberCellIdentifier
                                                                              forIndexPath:indexPath];
        cell.titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row+1] ;
        
        return cell;
    }
    else if(indexPath.section == 4){
        SolarTermsMulLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mulLineCellIdentifier
                                                                               forIndexPath:indexPath];
        NSMutableArray *ganZhiArr = [MainViewModel sharedInstance].jiaZiArr;
        NSInteger index = [MainViewModel sharedInstance].riZhuData.indexOfTermsBranchName;
        index += indexPath.row;
        if(index>=ganZhiArr.count){
            index -= ganZhiArr.count;
        }
        cell.titleLabel.text = [ganZhiArr objectAtIndex:index];
        
        if(riZhuData.indexOfCurrentDay == indexPath.row){
            [cell isCurrentSelectedDay:YES];
        }
        else{
            [cell isCurrentSelectedDay:NO];
        }
        return cell;
    }
    else if(indexPath.section == 5){
        SolarTermsMonthCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:monthCellIdentifier
                                                                              forIndexPath:indexPath];
        CGFloat cloumn = CGRectGetWidth(collectionView.frame)/31.0f;
        cell.leadingConstraint.constant = cloumn*riZhuData.monthLeadingConstraint;
        cell.titleLabel.text = [NSString stringWithFormat:@"%ld月",riZhuData.monthNumber];
        return cell;
    }
    else if(indexPath.section == 6){
        SolarTermsNumberCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:numberCellIdentifier1
                                                                              forIndexPath:indexPath];
        if(riZhuData.solarDate.count>indexPath.row){
            cell.titleLabel.text = [[riZhuData.solarDate objectAtIndex:indexPath.row] stringValue];
        }
        else{
            cell.titleLabel.text = @"";
        }
        
        if(riZhuData.indexOfCurrentDay == indexPath.row){
            [cell isCurrentSelectedDay:YES];
        }
        else{
            [cell isCurrentSelectedDay:NO];
        }
        
        return cell;
    }
    else if(indexPath.section == 7){
        SolarTermsMulLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mulLineCellIdentifier1
                                                                               forIndexPath:indexPath];
        if(riZhuData.lunarDate.count>indexPath.row){
            cell.titleLabel.text = [riZhuData.lunarDate objectAtIndex:indexPath.row];
        }
        else{
            cell.titleLabel.text = @"";
        }
        
        if(riZhuData.indexOfCurrentDay == indexPath.row){
            [cell isCurrentSelectedDay:YES];
        }
        else{
            [cell isCurrentSelectedDay:NO];
        }
        
        return cell;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //每个格子的宽度（31列）
    CGFloat cloumn = CGRectGetWidth(collectionView.frame)/31.0f;
    //每行的高度
    CGFloat height = [self getHeightWithSection:indexPath.section];
    RiZhuData *riZhuData = [[MainViewModel sharedInstance] riZhuData];
    //第三行分隔日数
    NSArray *separatorDayArr = riZhuData.separatorDayArr;
    
    if(indexPath.section == 0){
        return CGSizeMake(CGRectGetWidth(collectionView.frame), height);
    }
    else if(indexPath.section == 1){
        return CGSizeMake((CGRectGetWidth(collectionView.frame)-1)/2, height);
    }
    else if(indexPath.section == 2){
        NSInteger totalDay = 0;
        for(NSNumber *eachDay in riZhuData.separatorDayArr){
            totalDay += eachDay.integerValue;
        }
        
        if(separatorDayArr.count>indexPath.row){
            NSInteger day = [separatorDayArr[indexPath.row] integerValue];
            //加上间隔线1*格数的宽度
            CGFloat width = cloumn*day;
            return CGSizeMake(width, height);
        }
        //不足31天的剩余天数
        else{
            NSInteger leftDay = 31 - totalDay;
            return CGSizeMake(cloumn*leftDay, height);
        }
    }
    else if(indexPath.section == 3){
        return CGSizeMake(cloumn, height);
    }
    else if(indexPath.section == 4){
        return CGSizeMake(cloumn, height);
    }
    else if(indexPath.section == 5){
        return CGSizeMake(CGRectGetWidth(collectionView.frame),height);
    }
    else if(indexPath.section == 6){
        return CGSizeMake(cloumn, height);
    }
    else if(indexPath.section == 7){
        return CGSizeMake(cloumn, height);
    }
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

@end

@implementation SolarTermsCollectionView

+(SolarTermsCollectionView*)createSolarTermsCollectionView{
    SolarTermsCollectionView *view = [[SolarTermsCollectionView alloc] initWithFrame:CGRectZero
                                                                collectionViewLayout:[[UICollectionViewFlowLayout alloc]init]];
    view.myDataSource = [[SolarTermsCollectionViewDataSource alloc] initWithCollectionView:view];
    return view;
}



@end
