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

static NSString *firstCellIdentifier = @"firstCellIdentifier";
static NSString *secondCellIdentifier = @"secondCellIdentifier";
static NSString *thirdCellIdentifier = @"thirdCellIdentifier";
static NSString *numberCellIdentifier = @"numberCellIdentifier";
static NSString *mulLineCellIdentifier = @"mulLineCellIdentifier";
static NSString *emptyellIdentifier = @"emptyellIdentifier";
static NSString *monthCellIdentifier = @"monthCellIdentifier";

@implementation SolarTermsCollectionViewDataSource

-(instancetype)initWithCollectionView:(SolarTermsCollectionView*)collectionView{
    self = [super init];
    if(self){
        self.collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
//        self.collectionView.backgroundColor = [UIColor yellowColor];
        self.collectionView.backgroundView.backgroundColor = [UIColor blackColor];
        self.collectionView.layer.borderColor = [UIColor blackColor].CGColor;
        self.collectionView.layer.borderWidth = 1.0f;
        [self initialize];
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
    
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:emptyellIdentifier];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 8;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }
    else if (section == 1){
        return 2;
    }
    else if (section == 2){
        return 4;
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
    if(indexPath.section == 0){
        SolarTermsFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:firstCellIdentifier
                                                         forIndexPath:indexPath];
        return cell;
    }
    else if(indexPath.section == 1){
        SolarTermsSecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:secondCellIdentifier
                                                                              forIndexPath:indexPath];
        if(indexPath.row == 0){
            cell.titleLabel.textAlignment = NSTextAlignmentLeft;
        }
        else{
            cell.titleLabel.textAlignment = NSTextAlignmentRight;
        }
        return cell;
    }
    else if(indexPath.section == 2){
        SolarTermsThirdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:thirdCellIdentifier
                                                                               forIndexPath:indexPath];
        if(indexPath.row == 3){
            cell.titleLabel.text = @"";
        }
        return cell;
    }
    else if(indexPath.section == 3){
        SolarTermsNumberCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:numberCellIdentifier
                                                                              forIndexPath:indexPath];
        
        return cell;
    }
    else if(indexPath.section == 4){
        SolarTermsMulLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mulLineCellIdentifier
                                                                               forIndexPath:indexPath];
        return cell;
    }
    else if(indexPath.section == 5){
        SolarTermsMonthCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:monthCellIdentifier
                                                                              forIndexPath:indexPath];
        CGFloat cloumn = (CGRectGetWidth(collectionView.frame)-30)/31.0f;
        cell.leadingConstraint.constant = cloumn*25+24;
        return cell;
    }
    else if(indexPath.section == 6){
        SolarTermsNumberCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:numberCellIdentifier
                                                                              forIndexPath:indexPath];
        return cell;
    }
    else if(indexPath.section == 7){
        SolarTermsMulLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mulLineCellIdentifier
                                                                               forIndexPath:indexPath];
        return cell;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cloumn = (CGRectGetWidth(collectionView.frame)-30)/31.0f;
    if(indexPath.section == 0){
        return CGSizeMake(CGRectGetWidth(collectionView.frame), 62.0f);
    }
    else if(indexPath.section == 1){
        return CGSizeMake((CGRectGetWidth(collectionView.frame)-1)/2, 55.0f);
    }
    else if(indexPath.section == 2){
        if(indexPath.row == 0){
            return CGSizeMake(cloumn*7+6, 55.0f);
        }
        else if (indexPath.row == 1){
            return CGSizeMake(cloumn*7+6, 55.0f);
        }
        else if (indexPath.row == 2){
            return CGSizeMake(cloumn*16+15, 55.0f);
        }
        else{
            return CGSizeMake(cloumn*1, 55.0f);
        }
    }
    else if(indexPath.section == 3){
        return CGSizeMake(cloumn, 50.0f);
    }
    else if(indexPath.section == 4){
        return CGSizeMake(cloumn, 100.0f);
    }
    else if(indexPath.section == 5){
        return CGSizeMake(CGRectGetWidth(collectionView.frame),50.0f);
    }
    else if(indexPath.section == 6){
        return CGSizeMake(cloumn, 50.0f);
    }
    else if(indexPath.section == 7){
        return CGSizeMake(cloumn, 100.0f);
    }
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 1, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1.0f;
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
