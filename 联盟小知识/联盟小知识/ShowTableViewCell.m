//
//  ShowTableViewCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "ShowTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ShowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        self.hero1Img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 70, weight/6, weight/6)];
        _hero1Img.backgroundColor = [UIColor blueColor];
        [self addSubview:_hero1Img];
        
        self.hero2Img = [[UIImageView alloc]initWithFrame:CGRectMake(weight/6+20, 70, weight/6, weight/6)];
        _hero2Img.backgroundColor = [UIColor blueColor];
        [self addSubview:_hero2Img];
        
        self.hero3Img = [[UIImageView alloc]initWithFrame:CGRectMake((weight/6+10)*2+10, 70, weight/6, weight/6)];
        _hero3Img.backgroundColor = [UIColor blueColor];
        [self addSubview:_hero3Img];
        
        self.hero4Img = [[UIImageView alloc]initWithFrame:CGRectMake((weight/6+10)*3+10, 70, weight/6, weight/6)];
        _hero4Img.backgroundColor = [UIColor blueColor];
        [self addSubview:_hero4Img];
        
        self.hero5Img = [[UIImageView alloc]initWithFrame:CGRectMake((weight/6+10)*4+10, 70, weight/6, weight/6)];
        _hero5Img.backgroundColor = [UIColor blueColor];
        [self addSubview:_hero5Img];
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, weight-30, 30)];
        [self addSubview:_title];
        
        self.desLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 150, weight-20, 50)];
        _desLabel.textColor = [UIColor grayColor];
        _desLabel.font = [UIFont systemFontOfSize:13];
        _desLabel.numberOfLines = 0;
        [self addSubview:_desLabel];
        
        
    }
    return self;
}

- (void)setRecommend:(Recommend *)recommend{
    [_hero1Img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",recommend.hero1]]];
    [_hero2Img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",recommend.hero2]]];
    [_hero3Img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",recommend.hero3]]];
    [_hero4Img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",recommend.hero4]]];
    [_hero5Img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",recommend.hero5]]];
    _desLabel.text = recommend.des;
    _title.text = recommend.title;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
