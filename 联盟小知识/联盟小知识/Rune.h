//
//  Rune.h
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rune : NSObject


@property (nonatomic,retain) NSString *Name; //名字
@property (nonatomic,retain) NSString *Alias;
@property (nonatomic,retain) NSString *lev1;
@property (nonatomic,retain) NSString *lev2;
@property (nonatomic,retain) NSString *lev3;
@property (nonatomic,retain) NSString *iplev1;
@property (nonatomic,retain) NSString *iplev2;
@property (nonatomic,assign) NSInteger *iplev3;
@property (nonatomic,retain) NSString *Prop; //效果
@property (nonatomic,assign) NSInteger *Type;
@property (nonatomic,retain) NSString *Img;





@end
