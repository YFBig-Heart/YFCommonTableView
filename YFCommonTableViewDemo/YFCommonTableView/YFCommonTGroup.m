//
//  YFCommonTGroup.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFCommonTGroup.h"

@implementation YFCommonTGroup
- (instancetype)init {
    if (self = [super init]) {
        self.headHeight = kSectionHeadViewHeight;
        self.headerTitleColor = [UIColor colorWithRed:((float)((0xaaaaaa & 0xFF0000) >> 16))/255.0 green:((float)((0xaaaaaa & 0xFF00) >> 8))/255.0 blue:((float)(0xaaaaaa & 0xFF))/255.0 alpha:1.0];
        self.footerTitleColor = self.headerTitleColor;

        self.footerBgColor = [UIColor colorWithRed:((float)((0xEDF1F2 & 0xFF0000) >> 16))/255.0 green:((float)((0xEDF1F2 & 0xFF00) >> 8))/255.0 blue:((float)(0xEDF1F2 & 0xFF))/255.0 alpha:1.0];
        self.headerBgColor = self.footerBgColor;
        self.footHeight = -0.000001;
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
