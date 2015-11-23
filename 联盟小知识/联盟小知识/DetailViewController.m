//
//  DetailViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "DetailViewController.h"
#import "RecommenTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "DetailTableViewCell.h"

@interface DetailViewController ()

@property (nonatomic,retain) NSArray *strArray;
@property (nonatomic,retain) NSArray *heroArray;

@end

@implementation DetailViewController
static NSString *identifier = @"cellReuse";
static NSString *ident = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    self.title = _titles;
    
    [self.tableView registerClass:[RecommenTableViewCell class] forCellReuseIdentifier:identifier];
    [self.tableView registerClass:[DetailTableViewCell class] forCellReuseIdentifier:ident];
    
    self.strArray = @[_recommend.des1,_recommend.des2,_recommend.des3,_recommend.des4,_recommend.des5];
    
    self.heroArray = @[_recommend.hero1,_recommend.hero2,_recommend.hero3,_recommend.hero4,_recommend.hero5];
    
    
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

    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    if (indexPath.row == 0) {
        RecommenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
       NSString *string = _recommend.des;
        cell.desLabel.frame = CGRectMake(10, weight/4+20, weight-20, [self textHeight:string]+10);
        cell.recommend = _recommend;
        
        return cell;
        
    }else{
        
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
        NSString *string = _strArray[indexPath.row-1];
        cell.contentLabel.text = string;
        cell.contentLabel.frame = CGRectMake(weight/6+10, 15, weight*2/3+30, [self textHeight:string]+10);
        cell.contentLabel.numberOfLines = 0;
        
        
        [cell.picImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroArray[indexPath.row-1]]]];
        
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        
        
        NSString *string = _recommend.des;
        
        return [self textHeight:string]+weight/3;
    }else{
        
        
        NSString *string = _strArray[indexPath.row-1];
        
        return [self textHeight:string]+20;
        
    }
    
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
