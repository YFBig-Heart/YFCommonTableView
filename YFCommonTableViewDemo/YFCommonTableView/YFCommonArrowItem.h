//
//  YFCommonArrowItem.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFCommonTItem.h"

@interface YFCommonArrowItem : YFCommonTItem

/**
 *  要跳转的控制器
 */
@property (nonatomic, assign) Class target;

+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title andTarget:(Class)target;

+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title andSubTitle:(NSString *)subTitle andTarget:(Class)target;

+ (instancetype)itemWithTitle:(NSString *)title andTarget:(Class)target;

@end
