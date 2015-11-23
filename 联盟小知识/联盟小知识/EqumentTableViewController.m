//
//  EqumentTableViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "EqumentTableViewController.h"
#define Type_URL @"http://lolbox.duowan.com/phone/apiZBCategory.php?v=108&OSType=iOS8.3&versionName=2.2.5"
#import "EquipmentType.h"
#import "EquipmentCollectionViewController.h"

@interface EqumentTableViewController ()

@end

@implementation EqumentTableViewController
static NSString *identifier = @"cellReuse";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"装备";
    [self dataParese];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
}

- (void)dataParese{
    //1.创建url
    NSURL *url = [[NSURL alloc]initWithString:Type_URL];
    //2.创建响应对象(请求对象)
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //3.建立会话
    //    NSURLSession类支持三种类型的任务:加载数据,下载,上传
    //    NSURLSessionDataTask
    //    NSURLSessionDownloadTask
    //    NSURLSessionUploadTask
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (data != nil) {
            self.dataArray = [NSMutableArray arrayWithCapacity:5];
            for (NSDictionary *dic in array) {
                EquipmentType *type = [EquipmentType new];
                [type setValuesForKeysWithDictionary:dic];
                [_dataArray addObject:type];
            }
            for (EquipmentType *type in _dataArray) {
                NSLog(@"%@",type);
            }
            [self.tableView reloadData];
        }
    }];
    //执行方法,因为是回调,写在外面
    //使用resume方法启动任务
    [task resume];
    
    
    
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
    
    EquipmentType *type = _dataArray[indexPath.row];
    
    cell.textLabel.text = type.text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    EquipmentCollectionViewController *equmentVC = [[EquipmentCollectionViewController alloc]initWithCollectionViewLayout:layout];
    
    EquipmentType *type = _dataArray[indexPath.row];
    equmentVC.tag = type.tag;
    equmentVC.titlename = type.text;
    [self.navigationController pushViewController:equmentVC animated:YES];
    
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
