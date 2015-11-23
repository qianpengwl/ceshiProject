//
//  CallSkillCollectionViewController.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "CallSkillCollectionViewController.h"
#import "CallSkill.h"
#import "CallSkillCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "CallSkillDetailView.h"

@interface CallSkillCollectionViewController ()
@property (nonatomic,retain) NSMutableArray *dataArray;
@end

@implementation CallSkillCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[CallSkillCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self dataParese];
    
    
    // Do any additional setup after loading the view.
}

- (void)dataParese{
    //1.创建url
    NSURL *url = [[NSURL alloc]initWithString:@"http://lolbox.duowan.com/phone/apiSumAbility.php?OSType=iOS8.3&v=108"];
    //2.创建响应对象(请求对象)
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //3.建立会话
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (data != nil) {
            self.dataArray = [NSMutableArray arrayWithCapacity:5];
            for (NSDictionary *dic in array) {
                CallSkill  *callskill = [CallSkill new];
                [callskill setValuesForKeysWithDictionary:dic];
                [_dataArray addObject:callskill];
            }
            
            [self.collectionView reloadData];
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

    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CallSkillCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    CallSkill *callskill = _dataArray[indexPath.row];
    
    cell.nameLabel.text = callskill.name;
    
    [cell.picImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",callskill.ID]]];
    
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CallSkillDetailView *callSkillDetail = [[CallSkillDetailView alloc]init];
    
    CallSkill *callskill = _dataArray[indexPath.row];
    
    callSkillDetail.callSkill = callskill;
    
    [self.navigationController pushViewController:callSkillDetail animated:YES];
    
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
