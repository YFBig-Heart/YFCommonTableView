//
//  YFCommonBaseController.h
//  Petcome
//
//  Created by petcome on 2018/12/28.
//  Copyright © 2018 yunfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFUserCenterCell.h"
#import "YFUserItem.h"
#import "YFUserGroup.h"
#import "YFUserArrowItem.h"
#import "YFUserLabelItem.h"
#import "YFUserImageItem.h"
#import "YFUserSaveItem.h"
NS_ASSUME_NONNULL_BEGIN


@interface YFCommonBaseController : UIViewController

@property (nonatomic, strong)NSMutableArray *groups;

// 可以拿到放置在想要的图层,也可以外界直接赋值,没有赋值的话就自己创建
@property (nonatomic,strong) UITableView *tableView;



@end



NS_ASSUME_NONNULL_END
