//
//  YFCommonArrowItem.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFCommonArrowItem.h"

@implementation YFCommonArrowItem
+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title andTarget:(Class)target {
    YFCommonArrowItem *item = [self itemWithIcon:icon andTitle:title];
    item.target = target;
    return item;
}

+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title andSubTitle:(NSString *)subTitle andTarget:(Class)target {
    YFCommonArrowItem *item = [self itemWithIcon:icon andTitle:title];
    item.subTitle = subTitle;
    item.target = target;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title andTarget:(Class)target {
    YFCommonArrowItem *item = [self itemWithIcon:nil andTitle:title];
    item.target = target;
    return item;
}
@end
