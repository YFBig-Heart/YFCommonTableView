//
//  YFCommonTItem.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kCellStateNormal,   // 正常样式
    kCellStateUnenable, // 失效样式
} kCellState;

@interface YFCommonTItem : NSObject

/** 图片名称 */
@property (nonatomic, copy)NSString *icon;
/** 标题 */
@property (nonatomic, copy)NSString *title;
/** title颜色 默认0x434053 */
@property (nonatomic,strong)UIColor *titleColor;

/** 详细标题 */
@property (nonatomic, copy)NSString *subTitle;

/** subTitle 颜色 默认0x434053 */
@property (nonatomic,strong)UIColor *subTitleColor;

/** cell 的样式,默认Value1 */
@property (nonatomic,assign)UITableViewCellStyle cellStyle;

#pragma mark - 附加
/** 失效状态 */
@property (nonatomic, assign) kCellState cellState;
/** 失效图标:无图标时会改变icon的亮度 */
@property (nonatomic, copy) NSString *unenableIcon;

/** 用来搭载一些值 */
@property (nonatomic, strong) id argument;


/**
 *  点击执行的block
 */
@property (nonatomic, copy) void (^block)(YFCommonTItem *itemT,NSIndexPath *indexpath);

- (instancetype)initWithTitle:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title;

- (instancetype)initWithIcon:(NSString *)icon andTitle:(NSString *)title;
+ (instancetype)itemWithIcon:(NSString *)icon andTitle:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle;

@end
