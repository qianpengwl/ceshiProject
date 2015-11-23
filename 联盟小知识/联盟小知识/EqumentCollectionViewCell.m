//
//  EqumentCollectionViewCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "EqumentCollectionViewCell.h"
#import "EqumentDetail.h"


@implementation EqumentCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        self.picImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, weight/5, weight/5)];
        _picImg.layer.cornerRadius = 20;
        _picImg.layer.masksToBounds = YES;
        _picImg.backgroundColor = [UIColor blueColor];
        [self addSubview:_picImg];
        
        self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, weight/5+2, weight/5, 50)];
        _textLabel.numberOfLines = 0;
        _textLabel.font = [UIFont systemFontOfSize:13];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLabel];
    }
    
    return self;
}





@end
