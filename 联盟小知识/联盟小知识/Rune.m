//
//  Rune.m
//  联盟小知识
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 qianpeng.com. All rights reserved.
//

#import "Rune.h"

@implementation Rune

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


- (NSString *)description{
    
    return [NSString stringWithFormat:@"%@--%@--%@--%@",_Name,_iplev1,_iplev2,_Prop];
}

@end
