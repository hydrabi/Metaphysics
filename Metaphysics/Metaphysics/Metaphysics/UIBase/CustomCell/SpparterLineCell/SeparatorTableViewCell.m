//
//  SeparatorTableViewCell.m
//  Metaphysics
//
//  Created by Hydra on 2017/3/11.
//  Copyright © 2017年 毕志锋. All rights reserved.
//

#import "SeparatorTableViewCell.h"

@implementation SeparatorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    if(!self.tailLineView){
        self.tailLineView = [[UIView alloc] init];
        self.tailLineView.backgroundColor = [UIColor blackColor];
        [self addSubview:self.tailLineView];
        [self.tailLineView makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.top).offset(0);
            make.bottom.equalTo(self.bottom);
            make.trailing.equalTo(self.trailing).offset(0);
            make.width.equalTo(@1);
        }];
    }
    
    if(!self.floorLineView){
        self.floorLineView = [[UIView alloc] init];
        self.floorLineView.backgroundColor = [UIColor blackColor];
        [self addSubview:self.floorLineView];
        [self.floorLineView makeConstraints:^(MASConstraintMaker *make){
            make.bottom.equalTo(self.bottom).offset(0);
            make.leading.equalTo(self.leading).offset(0);
            make.trailing.equalTo(self.trailing).offset(0);
            make.height.equalTo(@1);
        }];
    }
    
}

-(void)showFloorLine{
    self.floorLineView.hidden = NO;
}

-(void)hideFloorLine{
    self.floorLineView.hidden = YES;
}

-(void)showTailLine{
    self.tailLineView.hidden = NO;
}

-(void)hideTailLine{
    self.tailLineView.hidden = YES;
}


@end
