//
//  RuneTableViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "RuneTableViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "Rune.h"
#import "RuneTableViewCell.h"

@interface RuneTableViewController ()
@property (nonatomic,retain) NSArray *dataArray;
@property (nonatomic,retain) NSMutableArray *blueArray;
@property (nonatomic,retain) NSMutableArray *redArray;
@property (nonatomic,retain) NSMutableArray *yellowArray;
@property (nonatomic,retain) NSMutableArray *purpleArray;
@end

@implementation RuneTableViewController
static NSString *identifier = @"cellReuse";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dataParese];
    
    
    [self.tableView registerClass:[RuneTableViewCell class] forCellReuseIdentifier:identifier];
}

- (void)dataParese{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //实际返回文本是HTML格式的,但是数据是json格式的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString *url = @"http://lolbox.duowan.com/phone/apiRunes.php?OSType=iOS8.3&v=108";
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
       NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
        self.dataArray = [NSArray array];
        self.redArray = [NSMutableArray arrayWithCapacity:5];
        self.blueArray = [NSMutableArray arrayWithCapacity:5];
        self.yellowArray = [NSMutableArray arrayWithCapacity:5];
        self.purpleArray = [NSMutableArray arrayWithCapacity:5];
        NSArray *array = [NSArray array];
        if ((array = dic[@"Red"])) {
            for (NSDictionary *dic in array) {
                Rune *rune = [Rune new];
                [rune setValuesForKeysWithDictionary:dic];
                [_redArray addObject:rune];
            }
            [self.tableView reloadData];
            
        }
        
        if ((array = dic[@"Blue"])) {
            for (NSDictionary *dic in array) {
                Rune *rune = [Rune new];
                [rune setValuesForKeysWithDictionary:dic];
                [_blueArray addObject:rune];
            }
            [self.tableView reloadData];
            
        }
        
        if ((array = dic[@"Yellow"])) {
            for (NSDictionary *dic in array) {
                Rune *rune = [Rune new];
                [rune setValuesForKeysWithDictionary:dic];
                [_yellowArray addObject:rune];
            }
            [self.tableView reloadData];
            
        }
        
        if ((array = dic[@"Purple"])) {
            for (NSDictionary *dic in array) {
                Rune *rune = [Rune new];
                [rune setValuesForKeysWithDictionary:dic];
                [_purpleArray addObject:rune];
            }
            [self.tableView reloadData];
            
        }
        
        self.dataArray = @[_redArray,_blueArray,_yellowArray,_purpleArray];
        
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

    return _dataArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _redArray.count;
    }else if (section == 1){
        return _blueArray.count;
    }else if (section == 2){
        return _yellowArray.count;
    }else

    return _purpleArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RuneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.rune = _redArray[indexPath.row];
    }else if (indexPath.section == 1){
        cell.rune = _blueArray[indexPath.row];
    }else if (indexPath.section == 2){
        cell.rune = _yellowArray[indexPath.row];
    }else if (indexPath.section == 3){
        cell.rune = _purpleArray[indexPath.row];
    }   
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    return weight/3+30;
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
