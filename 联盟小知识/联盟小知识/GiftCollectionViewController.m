//
//  GiftCollectionViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "GiftCollectionViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "Gift.h"
#import "GiftCollectionCell.h"
#import "UIImageView+WebCache.h"
#import "GiftReusableView.h"
#import "GiftDetail.h"

@interface GiftCollectionViewController ()
@property (nonatomic,retain) NSArray *dataArray;
@property (nonatomic,retain) NSMutableArray *aArray;
@property (nonatomic,retain) NSMutableArray *dArray;
@property (nonatomic,retain) NSMutableArray *gArray;
@end

@implementation GiftCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString *headerIdentifier = @"headerReuse";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[GiftCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //注册增补视图
     [self.collectionView registerClass:[GiftReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    [self dataParese];
    
    // Do any additional setup after loading the view.
}

- (void)dataParese{
    
    
    NSString * newsURL = @"http://lolbox.duowan.com/phone/apiGift.php?OSType=iOS8.3&v=108";
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:newsURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingAllowFragments) error:nil];
        NSArray *array = [NSArray array];
        NSLog(@"成功了");
        self.aArray = [NSMutableArray arrayWithCapacity:5];
        self.dArray = [NSMutableArray arrayWithCapacity:5];
        self.gArray = [NSMutableArray arrayWithCapacity:5];
        
        if ((array = dic[@"a"])) {
            for (NSDictionary *dic in array) {
                Gift *gift = [Gift new];
                [gift setValuesForKeysWithDictionary:dic];
                [_aArray addObject:gift];
            }
            [self.collectionView reloadData];
        }
        if ((array = dic[@"d"])) {
            for (NSDictionary *dic in array) {
                Gift *gift = [Gift new];
                [gift setValuesForKeysWithDictionary:dic];
                [_dArray addObject:gift];
            }
            [self.collectionView reloadData];
        }
        if ((array = dic[@"g"])) {
            for (NSDictionary *dic in array) {
                Gift *gift = [Gift new];
                [gift setValuesForKeysWithDictionary:dic];
                [_gArray addObject:gift];
            }
            [self.collectionView reloadData];
        }
       
        self.dataArray = @[_aArray,_dArray,_gArray];
        
        
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败了,%@",error);
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

    return _dataArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        
        return _aArray.count;
        
    }else if (section == 1){
        return _dArray.count;
        
    }else
        
        return _gArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GiftCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    Gift *gift = [Gift new];
    if (indexPath.section == 0) {
        gift = _aArray[indexPath.row];
        cell.nameLabel.text = gift.name;
        [cell.picImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/gifts/%@.png",gift.ID]]];
    }else if (indexPath.section == 1){
        gift = _dArray[indexPath.row];
        cell.nameLabel.text = gift.name;
        [cell.picImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/gifts/%@.png",gift.ID]]];
    }else if (indexPath.section == 2){
        gift = _gArray[indexPath.row];
        cell.nameLabel.text = gift.name;
        [cell.picImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/gifts/%@.png",gift.ID]]];
    }
    
    
    
    return cell;
}
//返回增补视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
        //从重用池里面取出来
        GiftReusableView *headerReuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        //返回增补视图
        if (indexPath.section == 0) {
            headerReuseView.backgroundColor = [UIColor redColor];
            headerReuseView.titleLabel.text = @"攻击";
        }else if (indexPath.section == 1){
            headerReuseView.backgroundColor = [UIColor blueColor];
            headerReuseView.titleLabel.text = @"防御";
            headerReuseView.titleLabel.textColor = [UIColor yellowColor];
        }else{
            headerReuseView.backgroundColor = [UIColor greenColor];
            headerReuseView.titleLabel.text = @"通用";
        }
        
        return headerReuseView;
    
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GiftDetail *giftDetail = [[GiftDetail alloc]init];
    Gift *gift = [Gift new];
    if (indexPath.section == 0) {
        gift = _aArray[indexPath.row];
        giftDetail.gift = gift;
    }else if (indexPath.section == 1){
        gift = _dArray[indexPath.row];
        giftDetail.gift = gift;
    }else if (indexPath.section == 2){
        gift = _gArray[indexPath.row];
        giftDetail.gift = gift;
    }

    
    
    [self.navigationController pushViewController:giftDetail animated:YES];
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
