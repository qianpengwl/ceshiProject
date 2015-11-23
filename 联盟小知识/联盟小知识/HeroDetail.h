//
//  HeroDetail.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "JSONModel.h"

@interface HeroDetail : JSONModel

@property (nonatomic,retain) NSString *armorBase; //基础护甲
@property (nonatomic,retain) NSString *armorLevel; //每级提升护甲
@property (nonatomic,retain) NSString *attackBase; //基础攻击
@property (nonatomic,retain) NSString *attackLevel; //每级提升攻击
@property (nonatomic,retain) NSString *danceVideoPath;  //跳舞视频
@property (nonatomic,retain) NSString *heroDescription; //简介
@property (nonatomic,retain) NSString *displayName;
@property (nonatomic,retain) NSString *des;
@property (nonatomic,retain) NSString *partner;
@property (nonatomic,retain) NSString *healthBase;
@property (nonatomic,retain) NSString *healthLevel;
@property (nonatomic,retain) NSString *iconPath; //头像
@property (nonatomic,retain) NSString *ID;
@property (nonatomic,retain) NSString *magicResistBase; //基础魔抗
@property (nonatomic,retain) NSString *magicResistLevel;
@property (nonatomic,retain) NSString *manaBase; 
@property (nonatomic,retain) NSString *moveSpeed;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *opponentTips; //弱点
@property (nonatomic,retain) NSString *portraitPath; //肖像
@property (nonatomic,retain) NSString *price;
@property (nonatomic,retain) NSString *range; //射程
@property (nonatomic,retain) NSString *ratingAttack;
@property (nonatomic,retain) NSString *ratingDefense;
@property (nonatomic,retain) NSString *ratingDifficulty;
@property (nonatomic,retain) NSString *ratingMagic;
@property (nonatomic,retain) NSString *selectSoundPath;//选中声音
@property (nonatomic,retain) NSString *tags;
@property (nonatomic,retain) NSString *tips;
@property (nonatomic,retain) NSString *title;






@end
