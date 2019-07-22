//
//  UIFont+YFFont.h
//  Petcome
//
//  Created by petcome on 2018/12/27.
//  Copyright © 2018 yunfei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : int {
    PingFangSCRegular = 0,     // 常规体
    PingFangSCUltralight = 1,  // 极细体
    PingFangSCThin = 2,        // 纤细体
    PingFangSCLight = 3,       // 细体
    PingFangSCMedium = 4,      // 中黑体
    PingFangSCSemibold = 5,    // 中粗体
} PingFangSCFont;

@interface UIFont (yf_Font)

+(UIFont *)italicFontWithFontName:(NSString *)fontName fontSize:(CGFloat)fontSize italicDegree:(CGFloat)italicDegree;

+(UIFont *)italicFontWithItalicDegree:(CGFloat)italicDegree font:(UIFont *)font;
/// 进行屏幕适配的font
+ (UIFont *)systemFontOfSize_6:(CGFloat)size;

+ (UIFont *)pingFangSCFont:(PingFangSCFont)type size:(float)size;

+ (UIFont *)DINCondensedBoldWithSize:(float)size;

@end

NS_ASSUME_NONNULL_END
