//
//  HeroSkilerViewCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroSkilerViewCell.h"

@implementation HeroSkilerViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        
        self.skillImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 50, weight/6, weight/6)];
        _skillImg.layer.cornerRadius = 20;
        _skillImg.layer.masksToBounds = YES;
        [self addSubview:_skillImg];
        
        self.desLabel = [[UILabel alloc]init];       
        [self addSubview:_desLabel];
        
        
        self.effectLabel = [[UILabel alloc]init];
        [self addSubview:_effectLabel];        
        
        
        self.skillName = [[UILabel alloc]initWithFrame:CGRectMake(weight/6+20, 10, weight/3, 30)];
        [self addSubview:_skillName];
        
        self.activeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, weight/6+50, weight/6, 20)];
        _activeLabel.text = @"主动";
        _activeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_activeLabel];
        
        
        self.passiveLabel = [[UILabel alloc]init];
        [self addSubview:_passiveLabel];
        
        
        
        
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
