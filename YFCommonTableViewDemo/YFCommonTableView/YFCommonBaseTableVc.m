//
//  YFCommonBaseTableVc.m
//  Petcome
//
//  Created by petcome on 2018/12/28.
//  Copyright © 2018 yunfei. All rights reserved.
//

#import "YFCommonBaseTableVc.h"
#import "YFCommonTableView.h"



#define kyfbgWhite_LightGrayBgColor [UIColor colorWithRed:((float)((0xEDF1F2 & 0xFF0000) >> 16))/255.0 green:((float)((0xEDF1F2 & 0xFF00) >> 8))/255.0 blue:((float)(0xEDF1F2 & 0xFF))/255.0 alpha:1.0]

@interface YFCommonBaseTableVc ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YFCommonBaseTableVc

- (void)viewDidLoad {
    [super viewDidLoad];
    if( @available(iOS 11.0, *)){
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setTableviewStyle];
}

#pragma mark 设置tableView的样式
- (void)setTableviewStyle {
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    // 下面两个人一设置一个就可以
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
    // 去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YFCommonTGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    YFCommonTGroup *group = self.groups[indexPath.section];
    YFCommonTItem *item = group.items[indexPath.row];
    YFCommonTableCell *cell = [YFCommonTableCell settingViewCellTableView:tableView withStyle:item.cellStyle];
    cell.item = item;
    if (indexPath.row == group.items.count - 1) {
        [cell showSeparationBottomLine:NO];
    }else {
        [cell showSeparationBottomLine:YES];
    }
    return cell;
}

// 选中的哪一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 取出对应的模型数据
    YFCommonTGroup *group = self.groups[indexPath.section];
    YFCommonTItem *item = group.items[indexPath.row];

    // 2.判断有没有block,有的话就执行
    if (item.block) {
        item.block(item, indexPath);
        return;
    }
    // 3.跳转
    if ([item isKindOfClass:[YFCommonArrowItem class]]) {
        // 强转
        YFCommonArrowItem *arrowItem = (YFCommonArrowItem *)item;
        // 判断target是否有值
        if (arrowItem.target) {
            Class class = arrowItem.target;
            UIViewController *vc = [[class alloc] init];
            // 设置头部标题
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }

}

#pragma mark 返回组不或者时尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self.groups[section] footerTitle];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YFCommonTGroup *group = self.groups[section];
    if (group.headerTitle.length > 0) {
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, group.headHeight)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 20, headView.bounds.size.height)];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = group.headerTitleColor;
        label.text = group.headerTitle;
        [headView addSubview:label];
        headView.backgroundColor = group.headerBgColor;
        return headView;
    }else {
        return [[UIView alloc] init];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    YFCommonTGroup *group = self.groups[section];
    return group.headHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    YFCommonTGroup *group = self.groups[section];
    if (group.footerTitle.length > 0 ) {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, group.headHeight)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width - 20, footerView.bounds.size.height)];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = group.footerTitleColor;
        label.text = group.footerTitle;
        [footerView addSubview:label];
        footerView.backgroundColor = group.footerBgColor;
        return footerView;
    }else {
        return [[UIView alloc] init];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    YFCommonTGroup *group = self.groups[section];
    return group.footHeight;
}

#pragma mark - setter & getter
- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.frame = self.view.bounds;
    }
    return _tableView;
}


@end
