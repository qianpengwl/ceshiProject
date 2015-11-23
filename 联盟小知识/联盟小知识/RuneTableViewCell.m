//
//  RuneTableViewCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "RuneTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation RuneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        self.picImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, weight/5, weight/5)];
        [self addSubview:_picImg];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, 20, weight/2, 30)];
        [self addSubview:_nameLabel];
        
        self.propLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, 60, weight-40, 15)];
        _propLabel.font = [UIFont systemFontOfSize:14];
        _propLabel.textColor = [UIColor grayColor];
        [self addSubview:_propLabel];
        
        
        self.levLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, 80, weight/2, 15)];
        _levLabel1.font = [UIFont systemFontOfSize:14];
        _levLabel1.textColor = [UIColor grayColor];
        [self addSubview:_levLabel1];
        
        self.levLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, 100, weight/2, 15)];
        _levLabel2.font = [UIFont systemFontOfSize:14];
        _levLabel2.textColor = [UIColor grayColor];
        [self addSubview:_levLabel2];
        
        self.levLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, 120, weight/2, 15)];
        _levLabel3.font = [UIFont systemFontOfSize:14];
        _levLabel3.textColor = [UIColor grayColor];
        [self addSubview:_levLabel3];
        
        
       
        
    }
    return self;
}

- (void)setRune:(Rune *)rune{
    _nameLabel.text = rune.Name;
    _levLabel1.text = rune.lev1;
    _levLabel2.text = rune.lev2;
    _levLabel3.text = rune.lev3;
    _propLabel.text = rune.Prop;
    [_picImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/runes/%@_3.png",rune.Img]]];
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
