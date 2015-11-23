//
//  InformationTableViewCell.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "InformationTableViewCell.h"



@implementation InformationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        
        self.picImg = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, weight/4, weight/4)];
        _picImg.layer.cornerRadius = 20;
        _picImg.layer.masksToBounds = YES;
        [self addSubview:_picImg];
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(weight/4 + 30, 10, weight/2, weight/6)];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.numberOfLines = 0;
        _title.font = [UIFont systemFontOfSize:20];
        [self addSubview:_title];
        
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/4 + 30, weight/6+10, weight/2, weight/6)];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = [UIColor grayColor];
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];

        
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
