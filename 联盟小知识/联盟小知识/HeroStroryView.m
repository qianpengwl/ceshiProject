//
//  HeroStroryView.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroStroryView.h"
#import "HeroStroryViewCell.h"
#import "UIImageView+WebCache.h"

@interface HeroStroryView ()

@end

@implementation HeroStroryView
static NSString *identifier = @"cellReuse";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    [self.tableView registerClass:[HeroStroryViewCell class] forCellReuseIdentifier:identifier];
    
    
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
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HeroStroryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    cell.nameLabel.text = _name;
    
    NSString *str = _des;
    
    
    cell.desLabel.text = str;
    cell.desLabel.frame = CGRectMake(20, weight/5+30, weight-40, [self textHeight:str]+100);
    
    cell.desLabel.textColor = [UIColor grayColor];
    cell.desLabel.numberOfLines = 0;
    
    [cell.picImg  sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_picName]]];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return [self textHeight:_des]+200;
    
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
