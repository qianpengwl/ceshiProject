//
//  HeroCollectionViewCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroCollectionViewCell.h"

@implementation HeroCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        
        self.picImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, weight/5, weight/5)];
        _picImg.layer.cornerRadius = 20;
        _picImg.layer.masksToBounds = YES;
        _picImg.backgroundColor = [UIColor blueColor];
        [self addSubview:_picImg];
        
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, weight/5+2, weight/5, 50)];
        
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.numberOfLines = 0;
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_nameLabel];
        
        
    }
    
    return self;
    
}


@end
