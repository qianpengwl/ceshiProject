//
//  OtherTableViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "OtherTableViewController.h"
#import "CallSkillCollectionViewController.h"
#import "GiftCollectionViewController.h"
#import "RuneTableViewController.h"

@interface OtherTableViewController ()
@property (nonatomic,retain)NSArray *dataArray;
@end

@implementation OtherTableViewController
static NSString *identifier = @"cellReuse";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@"天赋",@"符文",@"召唤师技能"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
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

    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    if (indexPath.row == 0) {
        layout.headerReferenceSize = CGSizeMake(20, 30);
        GiftCollectionViewController *giftVC = [[GiftCollectionViewController alloc]initWithCollectionViewLayout:layout];       
        
        [self.navigationController pushViewController:giftVC animated:YES];
        
        
    }
    
    if (indexPath.row == 1) {
        RuneTableViewController *runeVC = [[RuneTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
        [self.navigationController pushViewController:runeVC animated:YES];
    }
    
    
    if (indexPath.row == 2) {
        
        CallSkillCollectionViewController *callVC = [[CallSkillCollectionViewController alloc]initWithCollectionViewLayout:layout];
        
        [self.navigationController pushViewController:callVC animated:YES];
        
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
