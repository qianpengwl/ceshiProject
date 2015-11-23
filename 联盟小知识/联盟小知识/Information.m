//
//  Information.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "Information.h"

@implementation Information

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
    
    
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@",_title];
}

@end
