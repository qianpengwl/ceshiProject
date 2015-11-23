//
//  HeroDetail.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "HeroDetail.h"

@implementation HeroDetail


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.heroDescription = value;
    }else if ([key isEqualToString:@"id"]){
        self.ID = value;
    }
    
}


@end
