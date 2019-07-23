//
//  YFCommonBaseTableVc.h
//  Petcome
//
//  Created by petcome on 2018/12/28.
//  Copyright © 2018 yunfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFCommonTableCell.h"
#import "YFCommonTItem.h"
#import "YFCommonTGroup.h"
#import "YFCommonArrowItem.h"
#import "YFCommonTLabelItem.h"
#import "YFCommonTImageItem.h"
#import "YFCommonTSaveItem.h"
NS_ASSUME_NONNULL_BEGIN


@interface YFCommonBaseTableVc : UIViewController

@property (nonatomic, strong)NSMutableArray *groups;

// 可以拿到放置在想要的图层,也可以外界直接赋值,没有赋值的话就自己创建
@property (nonatomic,strong) UITableView *tableView;



@end



NS_ASSUME_NONNULL_END
