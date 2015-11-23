//
//  GiftDetail.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "GiftDetail.h"
#import "UIImageView+WebCache.h"

@implementation GiftDetail


- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.picImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 90, weight/5, weight/5)];
    [_picImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/gifts/%@.png",_gift.ID]]];
    [self.view addSubview:_picImg];
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/5+40, 90, weight/3, 40)];
    _nameLabel.text = _gift.name;
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont systemFontOfSize:27];
    [self.view addSubview:_nameLabel];
    
    self.desLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, weight/5+90, weight/3, 30)];
    _desLabel.text = @"天赋介绍";
    _desLabel.textAlignment = NSTextAlignmentCenter;
    _desLabel.font = [UIFont systemFontOfSize:21];
    [self.view addSubview:_desLabel];
    
    
    for (int i = 0; i < _gift.level.count; i++) {
        self.levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, weight/5+140+i*45, weight-40, 40)];
        _levelLabel.text = _gift.level[i];
        _levelLabel.font = [UIFont systemFontOfSize:14];
        _levelLabel.textAlignment = NSTextAlignmentLeft;
        _levelLabel.numberOfLines = 0;
        _levelLabel.textColor = [UIColor grayColor];
        [self.view addSubview:_levelLabel];
    }
    
    
    
                                 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
