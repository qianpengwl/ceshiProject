//
//  HeroDetailTView.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroDetailTView.h"
#import "HeroSkilerViewCell.h"
#import "HeroDetail.h"
#import "UIImageView+WebCache.h"
#import "AFHTTPRequestOperationManager.h"
#import "HeroDetailTableViewCell.h"
#define Detail_URL @"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.3&heroName=Yasuo&v=108"
#define Pic_URL @"http://img.lolbox.duowan.com/champions/Garen_120x120.jpg"



@interface HeroDetailTView ()
@property (nonatomic,retain) NSMutableArray *hateArray;
@property (nonatomic,retain) NSMutableArray *likeArray;
@property (nonatomic,retain) NSDictionary *dataDic;
@property (nonatomic,retain) NSDictionary *bDic;
@property (nonatomic,retain) NSDictionary *qDic;
@property (nonatomic,retain) NSDictionary *wDic;
@property (nonatomic,retain) NSDictionary *eDic;
@property (nonatomic,retain) NSDictionary *rDic;
@property (nonatomic,retain) NSArray *skillArray;
@property (nonatomic,retain) NSArray *QWERarray;

@end

@implementation HeroDetailTView
static NSString *identifier = @"cellReuse";


- (void)setDataArray:(NSMutableArray *)dataArray{
    if (!_hateArray) {
        _hateArray = [[NSMutableArray alloc]init];
    }
}


- (void)viewDidLoad {
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    
    [super viewDidLoad];
    
    [self dataParese];
    
    UIImageView *headpic = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, weight/5, weight/5)];
    headpic.layer.cornerRadius = 20;
    headpic.layer.masksToBounds = YES;
    
    [headpic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroName]]];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, weight, weight/4+30)];
    
    self.tableView.tableHeaderView = headView;
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/6+40, 20, weight/3, weight/9)];
    
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:20];
    [headView addSubview:_nameLabel];
    
    self.attributeLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/6+40, weight/9+20, weight/2, weight/9)];
    _attributeLabel.textAlignment = NSTextAlignmentLeft;
    [headView addSubview:_attributeLabel];
    
    self.tagLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, weight/5+20, weight/5, 20)];
    
    _tagLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:_tagLabel];
    
    self.preiceLabel = [[UILabel alloc]initWithFrame:CGRectMake(weight/6+40, weight/5+20, weight/3+10, 20)];
    _preiceLabel.textAlignment = NSTextAlignmentLeft;
    [headView addSubview:_preiceLabel];
    
    self.skinBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_skinBtn setTitle:@"皮肤" forState:(UIControlStateNormal)];
    _skinBtn.frame = CGRectMake(weight/2+100, 20, weight/8, weight/10);
    _skinBtn.backgroundColor = [UIColor blueColor];
    _skinBtn.layer.cornerRadius = 20;
    _skinBtn.layer.masksToBounds = YES;
    [headView addSubview:_skinBtn];
    
    self.voiceBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_voiceBtn setTitle:@"声音" forState:(UIControlStateNormal)];
    _voiceBtn.frame = CGRectMake(weight/2+100, weight/5, weight/8, weight/10);
    _voiceBtn.backgroundColor = [UIColor blueColor];
    _voiceBtn.layer.cornerRadius = 20;
    _voiceBtn.layer.masksToBounds = YES;
    [headView addSubview:_voiceBtn];
    
    
    [headView addSubview:headpic];
    [self.view addSubview:headView];
    
    
    //注册
    [self.tableView registerClass:[HeroSkilerViewCell class] forCellReuseIdentifier:identifier];
}


- (void)dataParese{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //实际返回文本是HTML格式的,但是数据是json格式的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.3&heroName=%@&v=108",_heroName] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
        self.dataDic = [NSDictionary dictionaryWithDictionary:responseObject];
        
        _nameLabel.text = _dataDic[@"displayName"];
        NSString *str = [NSString stringWithFormat:@"攻:%@ 防:%@ 魔:%@ 难度:%@",_dataDic[@"ratingAttack"],_dataDic[@"ratingDefense"],_dataDic[@"ratingMagic"],_dataDic[@"ratingDifficulty"]];
       
        _attributeLabel.text = str;
        
        _tagLabel.text = _dataDic[@"tags"];
        
        _preiceLabel.text = [NSString stringWithFormat:@"价格:%@",_dataDic[@"price"]];
        
        
        //技能
        self.bDic = _dataDic[[NSString stringWithFormat:@"%@_B",_heroName]];
        self.qDic = _dataDic[[NSString stringWithFormat:@"%@_Q",_heroName]];
        self.wDic = _dataDic[[NSString stringWithFormat:@"%@_W",_heroName]];
        self.eDic = _dataDic[[NSString stringWithFormat:@"%@_E",_heroName]];
        self.rDic = _dataDic[[NSString stringWithFormat:@"%@_R",_heroName]];
        self.skillArray = @[_bDic,_qDic,_wDic,_eDic,_rDic];
        self.QWERarray = @[@"B",@"Q",@"W",@"E",@"R"];
        
        [self.tableView reloadData];
        
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败了,%@",error);
    }];
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _skillArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    
    HeroSkilerViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSString *str1 = _skillArray[indexPath.row][@"description"];
    NSString *str2 = _skillArray[indexPath.row][@"effect"];
    CGSize maximun = CGSizeMake(weight/2+80, 9999);
    
    cell.desLabel.text = str1;
    CGSize dateStr1 = [str1 sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maximun lineBreakMode:cell.desLabel.lineBreakMode];
    cell.effectLabel.text = str2;
    CGSize dateStr2 = [str2 sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maximun lineBreakMode:cell.effectLabel.lineBreakMode];
    
    cell.desLabel.frame = CGRectMake(weight/6+20, 50, weight/2+80, dateStr1.height);
    cell.desLabel.textAlignment = NSTextAlignmentLeft;
    cell.desLabel.font = [UIFont systemFontOfSize:14];
    cell.desLabel.textColor = [UIColor lightGrayColor];
    cell.desLabel.numberOfLines = 0;
    
    cell.effectLabel.frame = CGRectMake(weight/6+20, dateStr1.height+60+weight/4, weight/2+80, dateStr2.height);
    cell.effectLabel.textAlignment = NSTextAlignmentLeft;
    cell.effectLabel.font = [UIFont systemFontOfSize:14];
    cell.effectLabel.textColor = [UIColor lightGrayColor];
    cell.effectLabel.numberOfLines = 0;
    
    cell.skillName.text = _skillArray[indexPath.row][@"name"];
    cell.skillName.textAlignment = NSTextAlignmentLeft;
    
    [cell.skillImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3",_heroName,_QWERarray[indexPath.row]]]];
    
    cell.passiveLabel.frame = CGRectMake(10, dateStr1.height+60+weight/3, weight/6, 30);
    cell.passiveLabel.text = @"被动";
    cell.passiveLabel.textAlignment = NSTextAlignmentCenter;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    NSString *str1 = _skillArray[indexPath.row][@"description"];
    NSString *str2 = _skillArray[indexPath.row][@"effect"];
    
    
    
    return [self textHeight:str1]+[self textHeight:str2]+weight/2;
    
}

//计算字符串的frame
- (CGFloat)textHeight:(NSString *)string{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(365, 10000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    //返回计算好的高度
    return rect.size.height;
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
