//
//  RecommenTableViewCell.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recommend.h"
@interface RecommenTableViewCell : UITableViewCell

@property (nonatomic,retain) UILabel *desLabel;
@property (nonatomic,retain) UILabel *des1Label;
@property (nonatomic,retain) UILabel *des2Label;
@property (nonatomic,retain) UILabel *des3Label;
@property (nonatomic,retain) UILabel *des4Label;
@property (nonatomic,retain) UILabel *des5Label;
@property (nonatomic,retain) UILabel *reason;
@property (nonatomic,retain) UIImageView *hero1Img;
@property (nonatomic,retain) UIImageView *hero2Img;
@property (nonatomic,retain) UIImageView *hero3Img;
@property (nonatomic,retain) UIImageView *hero4Img;
@property (nonatomic,retain) UIImageView *hero5Img;
@property (nonatomic,retain) Recommend *recommend;



@end
