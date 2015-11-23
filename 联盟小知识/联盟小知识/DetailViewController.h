//
//  DetailViewController.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recommend.h"

@interface DetailViewController : UITableViewController

@property (nonatomic,retain) NSMutableArray *dataArray;
@property (nonatomic,retain) NSString *titles;
@property (nonatomic,retain) Recommend *recommend;

@end
