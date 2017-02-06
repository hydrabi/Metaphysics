//
//  BottomLocation.h
//  Metaphysics
//
//  Created by Hydra on 2017/2/2.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BottomLocation : NSObject
@property (nonatomic,assign)NSInteger tag;
@property (nonatomic,assign)NSInteger section;
@property (nonatomic,assign)NSInteger row;
@property (nonatomic,strong)NSString *key;

-(instancetype)initWithTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath;
+(NSString*)createKeyWithTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath;
@end
