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

static NSString *firstCellIdentifier = @"firstCellIdentifier";
static NSString *secondCellIdentifier = @"secondCellIdentifier";
static NSString *thirdCellIdentifier = @"thirdCellIdentifier";
static NSString *numberCellIdentifier = @"numberCellIdentifier";
static NSString *mulLineCellIdentifier = @"mulLineCellIdentifier";
static NSString *emptyellIdentifier = @"emptyellIdentifier";

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
        return 3;
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
        return cell;
    }
    else if(indexPath.section == 2){
        SolarTermsThirdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:thirdCellIdentifier
                                                                               forIndexPath:indexPath];
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
    if(indexPath.section == 0){
        return CGSizeMake(CGRectGetWidth(collectionView.frame), 50);
    }
    else if(indexPath.section == 1){
        return CGSizeMake(CGRectGetWidth(collectionView.frame)/2-1, 40);
    }
    else if(indexPath.section == 2){
        if(indexPath.row == 0){
            return CGSizeMake(35.0f*7, 40);
        }
        else if (indexPath.row == 1){
            return CGSizeMake(35.0f*7, 40);
        }
        else if (indexPath.row == 2){
            return CGSizeMake(35.0f*16, 40);
        }
        else{
            return CGSizeMake(35.0f*1, 40);
        }
    }
    else if(indexPath.section == 3){
        return CGSizeMake(35.0f, 35.0f);
    }
    else if(indexPath.section == 4){
        return CGSizeMake(35.0f, 70.0f);
    }
    else if(indexPath.section == 5){
        return CGSizeMake(CGRectGetWidth(collectionView.frame),35.0f);
    }
    else if(indexPath.section == 6){
        return CGSizeMake(35.0f, 35.0f);
    }
    else if(indexPath.section == 7){
        return CGSizeMake(35.0f, 70.0f);
    }
    return CGSizeZero;
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
