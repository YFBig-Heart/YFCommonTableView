//
//  YFCommonTGroup.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSectionHeadViewHeight 8

@interface YFCommonTGroup : NSObject

// 所有的Item
@property (nonatomic, strong)NSMutableArray *items;

// 组的头部标题
@property (nonatomic, copy) NSString *headerTitle;
// 有默认颜色--  0xaaaaaa
@property (nonatomic,strong)UIColor *headerTitleColor;
// 组的脚步标题
@property (nonatomic, copy) NSString *footerTitle;
// 有默认颜色--  0xaaaaaa
@property (nonatomic,strong)UIColor *footerTitleColor;

// 有默认颜色 -- 0xEDF1F2
@property (nonatomic,strong)UIColor *headerBgColor;
// 有默认颜色 -- 0xEDF1F2
@property (nonatomic,strong)UIColor *footerBgColor;

/** 组的头部视图的高度默认8 */
@property (nonatomic, assign) CGFloat headHeight;
/** 组的足部视图的高度默认-0.000001 */
@property (nonatomic, assign) CGFloat footHeight;

@end
