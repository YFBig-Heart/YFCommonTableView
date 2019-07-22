//
//  YFUserArrowItem.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFUserArrowItem.h"

@implementation YFUserArrowItem
+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title andTarget:(Class)target {
    YFUserArrowItem *item = [self itemWithIcon:icon andTitle:title];
    item.target = target;
    return item;
}

+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title andSubTitle:(NSString *)subTitle andTarget:(Class)target {
    YFUserArrowItem *item = [self itemWithIcon:icon andTitle:title];
    item.subTitle = subTitle;
    item.target = target;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title andTarget:(Class)target {
    YFUserArrowItem *item = [self itemWithIcon:nil andTitle:title];
    item.target = target;
    return item;
}
@end
