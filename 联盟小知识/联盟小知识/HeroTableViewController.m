//
//  HeroTableViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroTableViewController.h"
#import "HeroDetailTView.h"
#import "AFHTTPRequestOperationManager.h"
#import "HeroStroryView.h"
#import "HeroPanterController.h"

@interface HeroTableViewController ()
@property (nonatomic,retain) NSArray *groupArray;
@property (nonatomic,retain) NSString *des;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *picUrl;
@property (nonatomic,retain) NSString *nameTitle;
@property (nonatomic,retain) NSArray *hateArray;
@property (nonatomic,retain) NSArray *likeArray;
@property (nonatomic,retain) NSString *opTip;
@property (nonatomic,retain) NSString *tip;

@end

@implementation HeroTableViewController
static NSString *identifier = @"cellReuse";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _cnName;
    
    self.groupArray = @[@"英雄详情",@"背景故事",@"最佳搭档",@"推荐出装"];
    
    [self dataParese];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
}


- (void)dataParese{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //实际返回文本是HTML格式的,但是数据是json格式的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.3&heroName=%@&v=108",_heroname] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
        
        self.des = dic[@"description"];
        self.name = dic[@"displayName"];
        self.nameTitle = dic[@"title"];
        self.hateArray = dic[@"hate"];
        self.likeArray = dic[@"like"];
        self.opTip = dic[@"opponentTips"];
        self.tip = dic[@"tips"];
        
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

    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text = _groupArray[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        HeroDetailTView *heroDV = [[HeroDetailTView alloc]init];
        
        heroDV.heroName = _heroname;
        
        [self.navigationController pushViewController:heroDV animated:YES];
    }else if (indexPath.row == 1){
        HeroStroryView *HeroSV = [[HeroStroryView alloc]initWithStyle:(UITableViewStyleGrouped)];
        
        HeroSV.des = _des;
        HeroSV.name = [NSString stringWithFormat:@"%@--%@",_name,_nameTitle];
        HeroSV.picName = _heroname;
        [self.navigationController pushViewController:HeroSV animated:YES];
        
    }else if (indexPath.row == 2){
        HeroPanterController *heroPV = [[HeroPanterController alloc]init];
        
        heroPV.hateArray = _hateArray;
        heroPV.likeArray = _likeArray;
        heroPV.opTip = _opTip;
        heroPV.tip = _tip;
        
        [self.navigationController pushViewController:heroPV animated:YES];
        
    }
    
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
