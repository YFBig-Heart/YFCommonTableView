//
//  YFUserGroup.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFUserGroup : NSObject

// 所有的Item
@property (nonatomic, strong)NSMutableArray *items;

// 组的头部标题
@property (nonatomic, copy) NSString *headerTitle;
// 组的脚步标题
@property (nonatomic, copy) NSString *footerTitle;

/** 组的头部视图的高度 */
@property (nonatomic, assign) CGFloat headHeight;
/** 组的足部视图的高度 */
@property (nonatomic, assign) CGFloat footHeight;


@end
