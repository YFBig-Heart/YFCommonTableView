//
//  YFCommonTLabelItem.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/29.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFCommonTLabelItem.h"


@implementation YFCommonTLabelItem
+ (instancetype)itemWithIcon:(NSString *)icon labelItemWithTitle:(NSString *)title andValue:(NSString *)labelText {
    
    YFCommonTLabelItem *item = [YFCommonTLabelItem labelItemWithTitle:title andValue:labelText];
    
    item.icon = icon;
    
    return item;
}

+ (instancetype)labelItemWithTitle:(NSString *)title andValue:(NSString *)labelText {
    
    YFCommonTLabelItem *item = [YFCommonTLabelItem itemWithTitle:title];
    item.labelText = labelText;
    
    return item;
}


@end
