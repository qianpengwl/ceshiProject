//
//  GiftReusableView.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "GiftReusableView.h"

@implementation GiftReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 200, 30)];
        _titleLabel.font = [UIFont systemFontOfSize:22];
        [self addSubview:_titleLabel];
    }
    return self;
    
}


@end
