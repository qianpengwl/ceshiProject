//
//  HeroPanterCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroPanterCell.h"

@implementation HeroPanterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, weight - 40, 20)];
        _title.font = [UIFont systemFontOfSize:20];
        [self addSubview:_title];
        
        self.partnerImg1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 50, weight/5, weight/5)];
        [self addSubview:_partnerImg1];
        
        
        self.partnerImg2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, weight/3+50, weight/5, weight/5)];
        [self addSubview:_partnerImg2];
        
        
        
        
        self.desLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, 50, weight/2+80, weight/3)];
        _desLabel1.numberOfLines = 0;
        _desLabel1.textColor = [UIColor grayColor];
        _desLabel1.font = [UIFont systemFontOfSize:14];
        [self addSubview:_desLabel1];
        
        
        self.desLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, weight/3+50, weight/2+80, weight/3)];
        _desLabel2.numberOfLines = 0;
        _desLabel2.textColor = [UIColor grayColor];
        _desLabel2.font = [UIFont systemFontOfSize:14];
        [self addSubview:_desLabel2];
        
        
        self.tipTitle = [[UILabel alloc]init];
        _tipTitle.font = [UIFont systemFontOfSize:20];
        [self addSubview:_tipTitle];
        
        self.tipLabel = [[UILabel alloc]init];
        _tipLabel.numberOfLines = 0;
        _tipLabel.textColor = [UIColor grayColor];
        _tipLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_tipLabel];
        
        
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
