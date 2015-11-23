//
//  HeroPanterController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroPanterController.h"
#import "HeroPanterCell.h"
#import "HeroPanter.h"
#import "UIImageView+WebCache.h"

@interface HeroPanterController ()
@property (nonatomic,retain) NSMutableArray *dataArray;
@property (nonatomic,assign) NSInteger cellHeight;
@end

@implementation HeroPanterController
static NSString *identifier = @"cellReuse";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[HeroPanterCell class] forCellReuseIdentifier:identifier];
    
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

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HeroPanterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    CGSize maximun = CGSizeMake(weight/2+60, 9999);
    CGSize max = CGSizeMake(weight-40, 9999);
    
//    self.dataArray = [NSMutableArray arrayWithCapacity:5];
//        for (NSDictionary *dic in array) {
//            HeroPanter *heropater = [HeroPanter new];
//            [heropater setValuesForKeysWithDictionary:dic];
//            [_dataArray addObject:heropater];
//        }
    if (indexPath.row == 0) {
        cell.title.text = @"最佳搭档";
        
        NSString *str1 = _likeArray[0][@"des"];
        NSString *str2 = _likeArray[1][@"des"];
        cell.desLabel1.text = str1;
        CGSize dateStr1 = [str1 sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maximun lineBreakMode:cell.desLabel1.lineBreakMode];
        cell.desLabel1.frame = CGRectMake(weight/5+40, 50, weight/2+60, dateStr1.height);
        
        
        
        cell.desLabel2.text = str2;
        CGSize dateStr2 = [str2 sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maximun lineBreakMode:cell.desLabel2.lineBreakMode];
        cell.desLabel2.frame = CGRectMake(weight/5+40, weight/3+50, weight/2+60, dateStr2.height);
        
        [cell.partnerImg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_likeArray[0][@"partner"]]]];
        
        [cell.partnerImg2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_likeArray[1][@"partner"]]]];
        
        cell.tipTitle.frame = CGRectMake(20,  weight/5+20+weight/3+50, weight/2, 20);
        cell.tipTitle.text = @"技巧贴士";
        
         CGSize dateStr3 = [_tip sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:max lineBreakMode:cell.tipLabel.lineBreakMode];
        
        
        cell.tipLabel.text = _tip;
        cell.tipLabel.frame = CGRectMake(20,  weight/5+20+weight/3+80, weight - 40, dateStr3.height);
        
        self.cellHeight =  weight/5+20+weight/3+80+dateStr3.height;
    }else if(indexPath.row == 1){
        
        
        cell.title.text = @"强力压制";
        
        NSString *str1 = _hateArray[0][@"des"];
        NSString *str2 = _hateArray[1][@"des"];
        cell.desLabel1.text = str1;
        CGSize dateStr1 = [str1 sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maximun lineBreakMode:cell.desLabel1.lineBreakMode];
        cell.desLabel1.frame = CGRectMake(weight/5+40, 50, weight/2+60, dateStr1.height);
        
        
        
        cell.desLabel2.text = str2;
        CGSize dateStr2 = [str2 sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:maximun lineBreakMode:cell.desLabel2.lineBreakMode];
        cell.desLabel2.frame = CGRectMake(weight/5+40, weight/3+50, weight/2+60, dateStr2.height);
        
        
        [cell.partnerImg1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_hateArray[0][@"partner"]]]];
        
        [cell.partnerImg2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_hateArray[1][@"partner"]]]];

        cell.tipTitle.frame = CGRectMake(20, weight/5+20+weight/3+50, weight/2, 20);
        cell.tipTitle.text = @"应对方法";
        
        CGSize dateStr3 = [_tip sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:max lineBreakMode:cell.tipLabel.lineBreakMode];
        
        
        cell.tipLabel.text = _tip;
        cell.tipLabel.frame = CGRectMake(20,  weight/5+20+weight/3+80, weight - 40, dateStr3.height);
        
    }
    
    
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _cellHeight+10;
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
