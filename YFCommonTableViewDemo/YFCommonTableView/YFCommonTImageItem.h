//
//  YFCommonTImageItem.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/29.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFCommonTItem.h"

@interface YFCommonTImageItem : YFCommonTItem

/** 图片 */
@property (nonatomic, strong)UIImage *image;

/** 图片位置，不设置的话默认靠右 */
@property (nonatomic,assign)CGRect imageFrame;

/** 圆角 */
@property (nonatomic,assign)CGFloat cornerRadius;
@property (nonatomic,assign)CGFloat boderWidth;
@property (nonatomic,assign)UIColor *boderColor;


+ (instancetype)initWithTitle:(NSString *)title andImage:(UIImage *)image;




@end
