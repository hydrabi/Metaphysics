//
//  SolarTermsCollectionView.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/19.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SolarTermsCollectionView;
@interface SolarTermsCollectionViewDataSource : NSObject<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,weak)SolarTermsCollectionView *collectionView;
@end

@interface SolarTermsCollectionView : UICollectionView
@property (nonatomic,strong)SolarTermsCollectionViewDataSource *myDataSource;
+(SolarTermsCollectionView*)createSolarTermsCollectionView;
@end
