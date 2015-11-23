//
//  CallSkillDetailView.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "CallSkillDetailView.h"
#import "UIImageView+WebCache.h"

@interface CallSkillDetailView ()

@end

@implementation CallSkillDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.picImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 84, weight/4, weight/4)];
    _picImg.layer.cornerRadius = 20;
    _picImg.layer.masksToBounds = YES;
    [_picImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",_callSkill.ID]]];
    [self.view addSubview:_picImg];
    
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/4+40, 84, weight/2, 30)];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.text = _callSkill.name;
    _nameLabel.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:_nameLabel];
    
    self.coolDownLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/4+40, 140, weight/2, 30)];
    _coolDownLabel.text =  [NSString stringWithFormat:@"冷却时间:%@",_callSkill.cooldown];
    _coolDownLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_coolDownLabel];
    
    self.tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, weight/4+250, weight-40, 70)];
    _tipLabel.textAlignment = NSTextAlignmentLeft;
    _tipLabel.text = _callSkill.tips;
    _tipLabel.textColor = [UIColor grayColor];
    _tipLabel.font = [UIFont systemFontOfSize:14];
    _tipLabel.numberOfLines = 0;
    [self.view addSubview:_tipLabel];
    
    self.destionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, weight/4+10+84, weight/3, 30)];
    _destionLabel.text = @"技能介绍";
    _destionLabel.textAlignment = NSTextAlignmentLeft;
    _destionLabel.font = [UIFont systemFontOfSize:23];
    [self.view addSubview:_destionLabel];
    
    
    self.desLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, weight/4+90, weight-40, weight/3)];
    _desLabel.text = _callSkill.des;
    _desLabel.numberOfLines = 0;
    _desLabel.font = [UIFont systemFontOfSize:15];
    _desLabel.textColor = [UIColor grayColor];
    [self.view addSubview:_desLabel];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
