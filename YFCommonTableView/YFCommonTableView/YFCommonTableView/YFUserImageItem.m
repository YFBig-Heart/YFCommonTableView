//
//  YFUserImageItem.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/29.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFUserImageItem.h"

@implementation YFUserImageItem

+ (instancetype)initWithTitle:(NSString *)title andImage:(UIImage *)image {
    
    YFUserImageItem *item = [self itemWithTitle:title];
    
    item.image = image;
    
    return item;
}

+ (instancetype)initWithTitle:(NSString *)title andImagePath:(NSString *)imagePath {
    YFUserImageItem *item = [self itemWithTitle:title];
    
    item.imagePath = imagePath;
    
    return item;
}

@end
