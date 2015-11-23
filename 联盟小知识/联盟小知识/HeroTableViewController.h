//
//  HeroTableViewController.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroDetail.h"

@interface HeroTableViewController : UITableViewController

@property (nonatomic,retain) NSString *heroname;
@property (nonatomic,retain) NSString *cnName;
@property (nonatomic,retain) HeroDetail *heroDetail;

@end
