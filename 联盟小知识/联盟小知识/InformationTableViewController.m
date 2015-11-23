//
//  InformationTableViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "InformationTableViewController.h"
#define BASE_URL @"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=headlineNews&p=1"
#import "Information.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+WebCache.h"
#import "ScrollInfor.h"
#import "InformationTableViewCell.h"
#import "FXLabel.h"





@interface InformationTableViewController ()<UIScrollViewDelegate>
@property (nonatomic,retain) NSMutableArray *dataArray;
@property (nonatomic,retain) NSMutableArray *ScrollArray;
@property (nonatomic,retain) UIScrollView *scroll;
@property (nonatomic,retain) UIPageControl *page;
@property (nonatomic,retain) NSTimer *timer;
@end


@implementation InformationTableViewController

static NSString *ident = @"cell";

- (void)dataParser{
    NSString * newsURL = @"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=headlineNews&p=1";
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:newsURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingAllowFragments) error:nil];
        NSArray *array = [NSArray array];
        if ((array = dic[@"data"])) {
            self.dataArray = [NSMutableArray arrayWithCapacity:5];
            for (NSDictionary *dic in array) {
                Information *infor = [Information new];
                [infor setValuesForKeysWithDictionary:dic];
                [_dataArray addObject:infor];
            }
            
                [self.tableView reloadData];
            
        }
           if ((array = dic[@"headerline"])){
            self.ScrollArray = [NSMutableArray arrayWithCapacity:5];
            for (NSDictionary *dic in array) {
                ScrollInfor *scinfor = [ScrollInfor new];
                [scinfor setValuesForKeysWithDictionary:dic];
                [_ScrollArray addObject:scinfor];
            }
               [self.tableView reloadData];
            for (ScrollInfor *scinfor in _ScrollArray) {
                NSLog(@"%@",scinfor);
            }
               
               [self.tableView reloadData];
        }
        
        CGFloat weight = [UIScreen mainScreen].bounds.size.width;
        //头视图
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, weight, 200)];
        self.tableView.tableHeaderView = headerView;
        //滑动视图
        self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, weight, 160)];
        _scroll.contentSize = CGSizeMake(weight*5, 0);
        _scroll.pagingEnabled = YES;
        self.scroll.bounces = NO;
        [headerView addSubview:_scroll];
        //设置代理
        self.scroll.delegate = self;
        for (int i = 0; i < self.ScrollArray.count; i++) {
            ScrollInfor *scinfor = self.ScrollArray[i];
            UIImageView *ImgV = [[UIImageView alloc]initWithFrame:CGRectMake(weight*i, 0, weight, 160)];
            [ImgV sd_setImageWithURL:[NSURL URLWithString:scinfor.photo]];
            [_scroll addSubview:ImgV];            
        }
        
        //试图控制器
        self.page = [[UIPageControl alloc]initWithFrame:CGRectMake(weight/3*2, 120, weight/3, 30)];
        _page.numberOfPages = 5;
        _page.pageIndicatorTintColor = [UIColor whiteColor];
        _page.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        self.scroll.contentOffset = CGPointMake(self.scroll.contentOffset.x, 0);
        _page.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.1];
        [_page addTarget:self action:@selector(pageControl:) forControlEvents:(UIControlEventValueChanged)];
        [headerView addSubview:_page];
       
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nexImage:) userInfo:nil repeats:YES];
        ;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
      
       
    }];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
//    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
//    FXLabel *titleLabel = [[FXLabel alloc]init];
//    titleLabel.frame = CGRectMake(0,-50, weight/3+20, 50);
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.text = @"英雄联盟";
//    titleLabel.shadowBlur = 20.0f;
//    titleLabel.innerShadowColor = [UIColor yellowColor];
//    titleLabel.innerShadowOffset = CGSizeMake(1, 1);
//    titleLabel.gradientStartColor = [UIColor redColor];
//    titleLabel.gradientEndColor = [UIColor yellowColor];
//    titleLabel.gradientStartPoint = CGPointMake(0.0f, 0.0f);
//    titleLabel.gradientEndPoint = CGPointMake(1.0f, 0.0f);
//    self.navigationItem.titleView = titleLabel;
//    self.navigationItem.titleView.frame = CGRectMake(50, -80, weight/4, 50);
    self.title = @"资讯";
        //解析资讯
    [self dataParser];
    
    [self.tableView registerClass:[InformationTableViewCell class] forCellReuseIdentifier:ident];
    
    
    
    
   
}



//计时器
-(void)nexImage:(NSTimer *)sender{
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    static int i = 0;
    i ++;
    if (i>4) {
        i=0;
    }
    [_scroll setContentOffset:CGPointMake(weight*i, 0)];
    _page.currentPage = i;
    
}
#pragma mark ----UIScrollViewDelegate
- (void)pageControl:(UIPageControl *)sender{
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    NSInteger currentPage = sender.currentPage;
    self.scroll.contentOffset = CGPointMake(weight*currentPage, 0);
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    NSInteger currentPage = self.scroll.contentOffset.x/weight;
    self.page.currentPage = currentPage;
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
    InformationTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ident];
    Information *infor = _dataArray[indexPath.row];
    
    cell.title.text = infor.title;
    cell.contentLabel.text = infor.content;
    [cell.picImg sd_setImageWithURL:[NSURL URLWithString:infor.photo]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
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
