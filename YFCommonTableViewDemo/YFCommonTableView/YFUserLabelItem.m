//
//  YFUserLabelItem.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/29.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFUserLabelItem.h"


@implementation YFUserLabelItem
+ (instancetype)itemWithIcon:(NSString *)icon labelItemWithTitle:(NSString *)title andValue:(NSString *)labelText {
    
    YFUserLabelItem *item = [YFUserLabelItem labelItemWithTitle:title andValue:labelText];
    
    item.icon = icon;
    
    return item;
}

+ (instancetype)labelItemWithTitle:(NSString *)title andValue:(NSString *)labelText {
    
    YFUserLabelItem *item = [YFUserLabelItem itemWithTitle:title];
    item.labelText = labelText;
    
    return item;
}


@end
