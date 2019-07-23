//
//  YBIBFileManager.h
//  YBImageBrowserDemo
//
//  Created by 杨波 on 2018/8/29.
//  Copyright © 2018年 杨波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YFCommonTableView_loadImg : NSObject

/**
 Get the default bundle.
 */
+ (NSBundle *)yf_ImageBrowserBundle;

/**
 Get 'UIImage' from the default bundle.
 */
+ (UIImage *)yf_getImageWithName:(NSString *)name;

@end
