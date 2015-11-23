//
//  HeroStroryViewCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroStroryViewCell.h"

@implementation HeroStroryViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        self.picImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, weight/5, weight/5)];
        _picImg.layer.cornerRadius = 20;
        _picImg.layer.masksToBounds = YES;
        [self addSubview:_picImg];
        
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, 20, weight/2+30, weight/10)];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_nameLabel];
        
        self.desLabel = [[UILabel alloc]init];
        [self addSubview:_desLabel];
 
        
        
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
