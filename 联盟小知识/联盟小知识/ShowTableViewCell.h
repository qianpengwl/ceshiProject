//
//  ShowTableViewCell.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recommend.h"

@interface ShowTableViewCell : UITableViewCell

@property (nonatomic,retain) UILabel *title;
@property (nonatomic,retain) UIImageView *hero1Img;
@property (nonatomic,retain) UIImageView *hero2Img;
@property (nonatomic,retain) UIImageView *hero3Img;
@property (nonatomic,retain) UIImageView *hero4Img;
@property (nonatomic,retain) UIImageView *hero5Img;
@property (nonatomic,retain) Recommend *recommend;
@property (nonatomic,retain) UILabel *desLabel;

@end
