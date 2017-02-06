//
//  BottomLocation.m
//  Metaphysics
//
//  Created by Hydra on 2017/2/2.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "BottomLocation.h"

@implementation BottomLocation

-(instancetype)initWithTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath{
    self = [super init];
    if(self){
        self.tag = tag;
        self.section = indexPath.section;
        self.row = indexPath.row;
        self.key = [BottomLocation createKeyWithTag:tag indexPath:indexPath];
        NSLog(@"%@",self.key);
    }
    return self;
}

+(NSString*)createKeyWithTag:(NSInteger)tag indexPath:(NSIndexPath*)indexPath{
    return [NSString stringWithFormat:@"%ld%ld%ld",(long)tag,(long)indexPath.section,(long)indexPath.row];
}
@end
