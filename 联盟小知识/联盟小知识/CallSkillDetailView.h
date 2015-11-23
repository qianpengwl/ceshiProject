//
//  CallSkillDetailView.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CallSkill.h"

@interface CallSkillDetailView : UIViewController

@property (nonatomic,retain) CallSkill *callSkill;

@property (nonatomic,retain) UILabel *nameLabel;
@property (nonatomic,retain) UIImageView *picImg;
@property (nonatomic,retain) UILabel *coolDownLabel;
@property (nonatomic,retain) UILabel *tipLabel;
@property (nonatomic,retain) UILabel *desLabel;
@property (nonatomic,retain) UILabel *destionLabel;

@end
