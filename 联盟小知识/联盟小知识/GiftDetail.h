//
//  GiftDetail.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gift.h"

@interface GiftDetail : UIViewController

@property (nonatomic,retain) Gift *gift;
@property (nonatomic,retain) UIImageView *picImg;
@property (nonatomic,retain) UILabel *nameLabel;
@property (nonatomic,retain) UILabel *levelLabel;
@property (nonatomic,retain) UILabel *desLabel;


@end
