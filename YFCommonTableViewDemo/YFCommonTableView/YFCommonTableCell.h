//
//  YFCommonTableCell.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSeparationLineColor DefaultColor_Line

@class YFCommonTItem;

@interface YFCommonTableCell : UITableViewCell

@property (nonatomic, strong) YFCommonTItem *item;

// 创建cell,默认为Value1样式
+ (instancetype)settingViewCellTableView:(UITableView *)tableview;

+ (instancetype)settingViewCellTableView:(UITableView *)tableview withStyle:(UITableViewCellStyle)style;

#pragma mark - 分割线 （注：分割线和底部分割线只会显示一个，或两个都不显示）
// 分割线--x 对齐左侧第一个控件
- (void)showSeparationLine:(BOOL)show;
// 顶部分割线x 从0 开始
- (void)showSeparationTopLine:(BOOL)show;
// 底部部分割线x 从0 开始
- (void)showSeparationBottomLine:(BOOL)show;

// 默认不显示
@property (nonatomic, strong,readonly) UIView *bottomLineView; // 底部分割线

/** 底部分割线偏移量 */
@property (nonatomic, assign) UIEdgeInsets separationBottomLinerightOffset;
/** 底部分割线偏移量的高度： default=0.5*/
@property (nonatomic, assign)CGFloat separationBottomLineHeight;

/** textLabel上下偏移：正数向上偏移，负数向下偏移 */
@property (nonatomic, assign)CGFloat textLabelVOffset;
/** textLabel左右偏移：正数向右偏移，负数向左偏移*/
@property (nonatomic, assign)CGFloat textLabelHOffset;

/** detailLabel上下偏移：正数向上偏移，负数向下偏移 */
@property (nonatomic, assign)CGFloat detailLabelVOffset;
/** detailLabel左右偏移：正数向右偏移，负数向左偏移 */
@property (nonatomic, assign)CGFloat detailLabelHOffset;



@end
