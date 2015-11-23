//
//  HeroDetailTView.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailTView : UITableViewController

@property (nonatomic,retain) NSString *heroName;
@property (nonatomic,retain) UILabel *nameLabel;
@property (nonatomic,retain) UILabel *attributeLabel; //属性
@property (nonatomic,retain) UILabel *preiceLabel;
@property (nonatomic,retain) UILabel *tagLabel;
@property (nonatomic,retain) UIButton *skinBtn;
@property (nonatomic,retain) UIButton *voiceBtn;

@end
