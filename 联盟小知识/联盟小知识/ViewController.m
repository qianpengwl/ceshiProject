//
//  ViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "ViewController.h"
#import "InformationTableViewController.h"
#import "RecommendTableViewController.h"
#import "EqumentTableViewController.h"
#import "HeroCollectionViewController.h"
#import "OtherTableViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    InformationTableViewController *inforVC = [[InformationTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:inforVC];
    inforVC.title = @"资讯";
    inforVC.tabBarItem.image = [UIImage imageNamed:@"40"];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    HeroCollectionViewController *heroVC = [[HeroCollectionViewController alloc]initWithCollectionViewLayout:layout];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:heroVC];
    heroVC.title = @"英雄";
    heroVC.tabBarItem.image = [UIImage imageNamed:@"41"];
    
   
    EqumentTableViewController *equipmentVC = [[EqumentTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:equipmentVC];
    equipmentVC.title = @"装备";
    equipmentVC.tabBarItem.image = [UIImage imageNamed:@"42"];
    
    
    RecommendTableViewController *giftVC = [[RecommendTableViewController alloc]initWithStyle:(UITableViewStyleGrouped)];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:giftVC];
    giftVC.title = @"推荐";
    giftVC.tabBarItem.image = [UIImage imageNamed:@"43"];
    
    
    OtherTableViewController *otherVC = [[OtherTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
    UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:otherVC];
    otherVC.title = @"其他";
    otherVC.tabBarItem.image = [UIImage imageNamed:@"44"];
    
    
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
