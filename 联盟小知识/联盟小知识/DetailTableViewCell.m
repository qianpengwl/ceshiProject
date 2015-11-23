//
//  DetailTableViewCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        self.contentLabel = [[UILabel alloc]init];
        [self addSubview:_contentLabel];
        
        
        self.picImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 20, weight/6, weight/6)];
        _picImg.layer.cornerRadius = 20;
        _picImg.layer.masksToBounds = YES;
        [self addSubview:_picImg];
        
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
