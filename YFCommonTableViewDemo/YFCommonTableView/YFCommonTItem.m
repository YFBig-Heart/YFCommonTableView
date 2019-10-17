//
//  YFCommonTItem.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFCommonTItem.h"

@implementation YFCommonTItem

- (instancetype)init {
    if (self = [super init]) {
        [self baseConfig];
    }
    return self;
}
- (void)baseConfig {
    self.titleColor = [UIColor colorWithRed:((float)((0x141414 & 0xFF0000) >> 16))/255.0 green:((float)((0x141414 & 0xFF00) >> 8))/255.0 blue:((float)(0x141414 & 0xFF))/255.0 alpha:1.0];
    self.subTitleColor = [UIColor darkTextColor];
    self.cellStyle = UITableViewCellStyleValue1;

}

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
        [self baseConfig];
    }
    return self;
}
+ (instancetype)itemWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (instancetype)initWithIcon:(NSString *)icon andTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
        self.icon = icon;
        [self baseConfig];
    }
    return self;
}
+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title {
    return [[self alloc] initWithIcon:icon andTitle:title];
}

+ (instancetype)itemWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle {
    YFCommonTItem *item = [self itemWithIcon:nil andTitle:title];
    item.subTitle = subTitle;
    return item;
}


@end
