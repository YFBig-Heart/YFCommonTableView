//
//  YFUserSaveItem.h
//  CoolTennisBall
//
//  Created by Coollang on 16/8/26.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFUserItem.h"

@interface YFUserSaveItem : YFUserItem

/** 是否选中*/
@property (nonatomic, assign)BOOL isSelected;

/** 选中状态的图片：有默认值 */
@property (nonatomic, copy) NSString *selectImageName;
/** 未选中的状态图片:有默认值 */
@property (nonatomic, copy)NSString *unSelectImageName;

- (instancetype)initWithTitle:(NSString *)title withSelect:(BOOL)select;

+ (instancetype)itemWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle withSelect:(BOOL)select;

@end
