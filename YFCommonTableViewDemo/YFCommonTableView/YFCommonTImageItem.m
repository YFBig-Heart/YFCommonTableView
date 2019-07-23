//
//  YFCommonTImageItem.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/29.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFCommonTImageItem.h"

@implementation YFCommonTImageItem

+ (instancetype)initWithTitle:(NSString *)title andImage:(UIImage *)image {
    
    YFCommonTImageItem *item = [self itemWithTitle:title];
    
    item.image = image;
    
    return item;
}


@end
