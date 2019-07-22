//
//  UIFont+YFFont.m
//  Petcome
//
//  Created by petcome on 2018/12/27.
//  Copyright © 2018 yunfei. All rights reserved.
//

#import "UIFont+yf_Font.h"

@implementation UIFont (yf_Font)


+ (UIFont *)systemFontOfSize_6:(CGFloat)size
{
    UIFont *font = nil;

    CGFloat scale = [UIScreen mainScreen].bounds.size.width/375.0;
    if (scale > 1.1 && scale < 1.2)
    {
        scale = 1.05;
    }
    else if (scale > 1.2)
    {
        scale = 1.1;
    }

    font = [UIFont systemFontOfSize:size*scale];

    return font;
}
+(UIFont *)italicFontWithFontName:(NSString *)fontName fontSize:(CGFloat)fontSize italicDegree:(CGFloat)italicDegree
{
    CGAffineTransform matrix =  CGAffineTransformMake(1, 0, tanf(italicDegree * (CGFloat)M_PI / 180), 1, 0, 0);

    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :fontName matrix :matrix];

    return [UIFont fontWithDescriptor :desc size :fontSize];
}

+(UIFont *)italicFontWithItalicDegree:(CGFloat)italicDegree font:(UIFont *)font
{
    CGAffineTransform matrix =  CGAffineTransformMake(1, 0, tanf(italicDegree * (CGFloat)M_PI / 180), 1, 0, 0);

    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :font.fontName matrix :matrix];

    return [UIFont fontWithDescriptor :desc size :font.pointSize];
}


+ (UIFont *)pingFangSCFont:(PingFangSCFont)type size:(float)size {
    /*
     PingFangSC-Medium,
     PingFangSC-Semibold,
     PingFangSC-Light,
     PingFangSC-Ultralight,
     PingFangSC-Regular,
     PingFangSC-Thin
     */
    CGFloat scale = (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)/375.0);
    if (scale > 1.1 && scale < 1.2)
    {
        scale = 1.05;
    }
    else if (scale > 1.2)
    {
        scale = 1.1;
    }
    UIFont *systemFont = [UIFont systemFontOfSize:scale *size];
    NSString *fontName = @"PingFangSC-Regular";
    switch (type) {
        case PingFangSCMedium:{
            fontName = @"PingFangSC-Medium";
        }
            break;
        case PingFangSCSemibold:{
            fontName = @"PingFangSC-Semibold";
        }
            break;
        case PingFangSCLight:{
            fontName = @"PingFangSC-Light";
        }
            break;
        case PingFangSCUltralight:{
            fontName = @"PingFangSC-Ultralight";
        }
            break;
        case PingFangSCThin:{
            fontName = @"PingFangSC-Thin";
        }
            break;
        default:{
            fontName = @"PingFangSC-Regular";
        }
            break;
    }
    // 对字体大小进行设配
    UIFont *font = [UIFont fontWithName:fontName size:size * scale];
    if(font == nil){
        font =systemFont;
    }
    return font;
}

+ (UIFont *)DINCondensedBoldWithSize:(float)size {
    CGFloat scale = (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)/375.0);
    if (scale > 1.1 && scale < 1.2)
    {
        scale = 1.05;
    }
    else if (scale > 1.2)
    {
        scale = 1.1;
    }
    UIFont *font = [UIFont fontWithName:@"DINCondensed-Bold" size:size * scale];
    return font;
}

@end
