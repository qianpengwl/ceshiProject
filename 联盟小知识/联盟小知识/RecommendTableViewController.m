//
//  RecommendTableViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "RecommendTableViewController.h"
#import "UIImageView+WebCache.h"

#import "Recommend.h"
#import "DetailViewController.h"
#define Recommend_URL @"http://box.dwstatic.com/apiHeroBestGroup.php?v=108&OSType=iOS8.3"
#import "ShowTableViewCell.h"



@interface RecommendTableViewController ()
@property (nonatomic,retain)NSMutableArray *dataArray;
@end

@implementation RecommendTableViewController
static NSString *identifier = @"cellReuse";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐";
    [self dataParese];
    
    [self.tableView registerClass:[ShowTableViewCell class] forCellReuseIdentifier:identifier];
    
}

- (void)dataParese{
    //1.创建url
    NSURL *url = [[NSURL alloc]initWithString:Recommend_URL];
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
                Recommend *recommend = [Recommend new];
                [recommend setValuesForKeysWithDictionary:dic];
                [_dataArray addObject:recommend];
            }
            for (Recommend *recommend in _dataArray) {
                NSLog(@"%@",recommend);
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
    ShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    Recommend *recommend = _dataArray[indexPath.row];
    
    cell.recommend = recommend;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailViewController *detailVC = [[DetailViewController alloc]initWithStyle:(UITableViewStyleGrouped)];
    Recommend *recommend = _dataArray[indexPath.row];
    detailVC.titles = recommend.title;
    detailVC.recommend = recommend;
    
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    return weight/6+150;
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
