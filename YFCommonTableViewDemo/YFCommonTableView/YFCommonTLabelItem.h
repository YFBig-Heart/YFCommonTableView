//
//  YFCommonTLabelItem.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/29.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFCommonTItem.h"

@interface YFCommonTLabelItem : YFCommonTItem
// label 中的值
@property (nonatomic, copy)NSString *labelText;

+ (instancetype)labelItemWithTitle:(NSString *)title andValue:(NSString *)labelText;

+ (instancetype)itemWithIcon:(NSString *)icon labelItemWithTitle:(NSString *)title andValue:(NSString *)labelText;

@end
