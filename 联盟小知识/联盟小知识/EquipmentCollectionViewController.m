//
//  EquipmentCollectionViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "EquipmentCollectionViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "EqumentDetail.h"
#import "UIImageView+WebCache.h"
#import "EqumentCollectionViewCell.h"

#define Detail_URL @"http://lolbox.duowan.com/phone/apiZBItemList.php?"
#define Pic_URL @"http://img.lolbox.duowan.com/zb/"


@interface EquipmentCollectionViewController ()
@property (nonatomic,retain) NSMutableArray *detailArray;

@end

@implementation EquipmentCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self detailData];
    
    self.title = _titlename;
    
    [self.collectionView registerClass:[EqumentCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    


    
    // Do any additional setup after loading the view.
}

- (void)detailData{   
    
    NSString *urlString = [Detail_URL stringByAppendingFormat:@"tag=%@&v=108&OSType=iOS8.3&versionName=2.2.5",_tag];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
        NSArray * array = [NSArray arrayWithArray:responseObject];
        _detailArray = [NSMutableArray array];
        for (NSDictionary * dic in array) {
            EqumentDetail *detail = [EqumentDetail new];
            [detail setValuesForKeysWithDictionary:dic];
            [_detailArray addObject:detail];
            [self.collectionView reloadData];
        }
        
        for (EqumentDetail *detail in _detailArray) {
            NSLog(@"%@",detail);
        }

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        
        
    }];
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat weight = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(weight/5, weight/5+30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _detailArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EqumentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    EqumentDetail *detail = _detailArray[indexPath.row];
    NSString *detailPic = [Pic_URL stringByAppendingFormat:@"%d_64x64.png",detail.ID];
    
    [cell.picImg sd_setImageWithURL:[NSURL URLWithString:detailPic]];
    cell.textLabel.text = detail.text;
//    cell.backgroundColor = [UIColor blueColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
