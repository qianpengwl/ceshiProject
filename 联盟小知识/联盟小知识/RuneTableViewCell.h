//
//  RuneTableViewCell.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rune.h"
@interface RuneTableViewCell : UITableViewCell

@property (nonatomic,retain) UIImageView *picImg;
@property (nonatomic,retain) UILabel *nameLabel;
@property (nonatomic,retain) UILabel *propLabel;
@property (nonatomic,retain) UILabel *levLabel1;
@property (nonatomic,retain) UILabel *levLabel2;
@property (nonatomic,retain) UILabel *levLabel3;
@property (nonatomic,retain) Rune *rune;


@end
