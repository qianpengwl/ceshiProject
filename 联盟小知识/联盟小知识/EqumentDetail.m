//
//  EqumentDetail.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "EqumentDetail.h"

@implementation EqumentDetail

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = [value intValue];
    }
}

@end
