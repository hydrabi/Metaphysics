//
//  JiaZiCollectionViewController.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/12.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "JiaZiCollectionViewController.h"
#import "JiaZiCollectionViewCell.h"
#import "UIConstantParameter.h"
#import "NSArray+Addition.h"
#import "NSString+Addition.h"
@interface JiaZiCollectionViewController ()

@end

@implementation JiaZiCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

+(void)presentViewControllerWithRect:(CGRect)rect view:(UIView*)view type:(MiddleSubViewType)type{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    JiaZiCollectionViewController *jiaZi = [[JiaZiCollectionViewController alloc] initWithCollectionViewLayout:layout];
    jiaZi.type = type;
    if(type == MiddleSubViewTypeYear ||
       type == MiddleSubViewTypeDay){
        jiaZi.preferredContentSize = CGSizeMake(jiaZiCellWidth*jiaZiCollectionColumn+jiaZiCellOffset*(jiaZiCollectionColumn+1),
                                                jiaZiCellHeight*jiaZiCollectionRow+jiaZiCellOffset*(jiaZiCollectionRow+1));
    }
    else{
        jiaZi.preferredContentSize = CGSizeMake(jiaZiCellWidth*6 + jiaZiCellOffset*(6+1),
                                                jiaZiCellHeight*2 + jiaZiCellOffset*(2+1));
    }
    
    
    
    UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:jiaZi];
    [pop presentPopoverFromRect:rect
                         inView:view
       permittedArrowDirections:UIPopoverArrowDirectionUp
                       animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionViewLayout;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(jiaZiCellWidth,
                                 jiaZiCellHeight);
    layout.minimumLineSpacing = jiaZiCellOffset;
    layout.minimumInteritemSpacing = jiaZiCellOffset;
    layout.sectionInset = UIEdgeInsetsMake(jiaZiCellOffset,
                                           jiaZiCellOffset,
                                           jiaZiCellOffset,
                                           jiaZiCellOffset);
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JiaZiCollectionViewCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:reuseIdentifier];
    
}

-(void)setType:(MiddleSubViewType)type{
    _type = type;
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.type == MiddleSubViewTypeYear ||
       self.type == MiddleSubViewTypeDay){
        return [MainViewModel sharedInstance].jiaZiArr.count;
    }
    else{
        return 12;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JiaZiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    MainViewModel *mainViewModel = [MainViewModel sharedInstance];
    ShuangZaoData *shuangZao = mainViewModel.shuangZaoData;
    
    if(self.type == MiddleSubViewTypeYear ||
       self.type == MiddleSubViewTypeDay){
        if(mainViewModel.jiaZiArr.count>indexPath.row){
            cell.titleLabel.text = mainViewModel.jiaZiArr[indexPath.row];
        }
    }
    else if(self.type == MiddleSubViewTypeMonth){
        cell.titleLabel.text = [NSArray getMonthGanZhiArrWithStems:[shuangZao.year getStems]][indexPath.row];
    }
    else{
        NSInteger hour = indexPath.row * 2;
        cell.titleLabel.text = [NSString ganZhiHourWithHour:hour
                                             day:shuangZao.day];
    }
    
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
//cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(jiaZiCellWidth, jiaZiCellHeight);
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShuangZaoData *data = [MainViewModel sharedInstance].shuangZaoData;
    NSString *result = [MainViewModel sharedInstance].jiaZiArr[indexPath.row];
    switch (self.type) {
        case MiddleSubViewTypeYear:
            data.year = result;
            break;
        case MiddleSubViewTypeMonth:
        {
            data.month = [NSArray getMonthGanZhiArrWithStems:[data.year getStems]][indexPath.row];
        }
            break;
        case MiddleSubViewTypeDay:
            data.day = result;
            break;
        case MiddleSubViewTypeHour:
        {
            NSInteger hour = indexPath.row * 2;
            data.hour = [NSString ganZhiHourWithHour:hour
                                                 day:data.day];
        }
            
            break;
        default:
            break;
    }
    NSLog(@"%@",result);
}



@end
