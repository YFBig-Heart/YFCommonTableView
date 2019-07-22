//
//  YFUserImageItem.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/29.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFUserItem.h"

@interface YFUserImageItem : YFUserItem

#pragma mark - 图片和图片路径二选其一,有image就不会加载imagePath的图片
/** 图片 */
@property (nonatomic, strong)UIImage *image;

/** 图片路径 */
@property (nonatomic, copy)NSString *imagePath;

/** 图片位置，不设置的话默认靠右 */
@property (nonatomic,assign)CGRect imageFrame;

/** 圆角 */
@property (nonatomic,assign)CGFloat cornerRadius;
@property (nonatomic,assign)CGFloat boderWidth;
@property (nonatomic,assign)UIColor *boderColor;


+ (instancetype)initWithTitle:(NSString *)title andImage:(UIImage *)image;
+ (instancetype)initWithTitle:(NSString *)title andImagePath:(NSString *)imagePath;


@end
