//
//  YFUserSaveItem.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/26.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFUserSaveItem.h"

@implementation YFUserSaveItem

- (instancetype)initWithIcon:(NSString *)icon andTitle:(NSString *)title {
    if (self = [super init]) {
        self.title = title;
        self.icon = icon;
        self.selectImageName = @"login_select_dot";
        self.unSelectImageName = @"login_unselect_dot";
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title withSelect:(BOOL)select {
    YFUserSaveItem *saveItem = [[YFUserSaveItem alloc] initWithTitle:title];
    saveItem.isSelected = select;
    return saveItem;
}

+ (instancetype)itemWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle withSelect:(BOOL)select {
    YFUserSaveItem *saveItem = [YFUserSaveItem itemWithTitle:title andSubTitle:subTitle];
    saveItem.isSelected = select;
    return saveItem;
}

@end
