//
//  YFUserGroup.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFUserGroup.h"

@implementation YFUserGroup
- (instancetype)init {
    if (self = [super init]) {
        self.headHeight = -0.001;
    }
    return self;
}
- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}


@end
