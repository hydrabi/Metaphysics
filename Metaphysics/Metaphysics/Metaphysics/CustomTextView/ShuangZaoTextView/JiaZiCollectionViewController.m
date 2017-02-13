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
@interface JiaZiCollectionViewController ()

@end

@implementation JiaZiCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

+(void)presentViewControllerWithRect:(CGRect)rect view:(UIView*)view type:(MiddleSubViewType)type{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    JiaZiCollectionViewController *jiaZi = [[JiaZiCollectionViewController alloc] initWithCollectionViewLayout:layout];
    jiaZi.type = type;
    jiaZi.preferredContentSize = CGSizeMake(jiaZiCellWidth*jiaZiCollectionColumn+jiaZiCellOffset*(jiaZiCollectionColumn+1),
                                            jiaZiCellHeight*jiaZiCollectionRow+jiaZiCellOffset*(jiaZiCollectionRow+1));
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
    return [MainViewModel sharedInstance].jiaZiArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JiaZiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    MainViewModel *main = [MainViewModel sharedInstance];
    
    if(main.jiaZiArr.count>indexPath.row){
        cell.titleLabel.text = main.jiaZiArr[indexPath.row];
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
            data.month = result;
            break;
        case MiddleSubViewTypeDay:
            data.day = result;
            break;
        case MiddleSubViewTypeHour:
            data.hour = result;
            break;
        default:
            break;
    }
    NSLog(@"%@",result);
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
