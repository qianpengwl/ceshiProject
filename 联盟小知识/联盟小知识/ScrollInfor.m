//
//  ScrollInfor.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "ScrollInfor.h"

@implementation ScrollInfor

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        self.ID  = value;
    }
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@",_ID];
}



@end
