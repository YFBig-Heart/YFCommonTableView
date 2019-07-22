//
//  YFUserCenterCell.m
//  CoolTennisBall
//
//  Created by Coollang on 16/8/25.
//  Copyright © 2016年 CoolLang. All rights reserved.
//

#import "YFUserCenterCell.h"
#import "YFUserItem.h"
#import "YFUserArrowItem.h"
#import "UIFont+yf_Font.h"
#import "YFUserSaveItem.h"
#import "YFUserLabelItem.h"
#import "YFUserImageItem.h"
//#import <SDWebImage/UIImageView+WebCache.h>
//#import <SDWebImage/SDImageCache.h>
#import "YFCommonTableView.h"


@interface UIView (yf_viewFrame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;

@end

@interface YFUserCenterCell ()

// 开关
@property (nonatomic, strong) UISwitch *accessorySwitch;
// 箭头
@property (nonatomic, strong) UIImageView *accessoryArrow;
// label
@property (nonatomic, strong) UILabel *accessoryLabel;

@property (nonatomic, strong)UIView *lineView;

/** 打钩 */
@property (nonatomic, strong) UIImageView *selectImageView;

@property (nonatomic, strong) UIImageView *rightImageView; // 右侧的图片

@property (nonatomic, strong) UIView *topLineView; // 顶部分割线
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation YFUserCenterCell


+ (instancetype)settingViewCellTableView:(UITableView *)tableview withStyle:(UITableViewCellStyle)style {
    static NSString *ID = @"setting";
    YFUserCenterCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[YFUserCenterCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    
    return cell;
}

+ (instancetype)settingViewCellTableView:(UITableView *)tableview {
    return [self settingViewCellTableView:tableview withStyle:UITableViewCellStyleValue1];
}

// 设置cell的样式
- (void)setupCell {
    self.textLabel.textColor = _item.titleColor;
    self.textLabel.font = [UIFont pingFangSCFont:PingFangSCMedium size:14];
    self.backgroundColor = [UIColor whiteColor];
    
    self.detailTextLabel.textColor = _item.subTitleColor;
    self.detailTextLabel.font =  [UIFont pingFangSCFont:PingFangSCRegular size:14];
    self.textLabel.numberOfLines = 0;
    self.detailTextLabel.numberOfLines = 0;
    
    if (_item.cellState == kCellStateUnenable) {
        self.imageView.image = [YFUserCenterCell image:[UIImage imageNamed:_item.icon] WithTintColor:[UIColor grayColor] blendMode:kCGBlendModeSoftLight alpha:1.0];
        self.textLabel.textColor = [UIColor grayColor];
        self.detailTextLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0];
        if(_accessoryArrow != nil){
            _accessoryArrow.image = [UIImage imageNamed:@"rightArrow_gray"];
        }
    }else {
        if(_accessoryArrow != nil){

            _accessoryArrow.image =[UIImage imageNamed:@"rightArrow_gray"];
        }
    }
}
- (void)setItem:(YFUserItem *)item {
    _item = item;
    // 设置数据
    if(item.icon) {
        UIImage *image = [UIImage imageNamed:item.icon];
        self.imageView.image = image;
    }
    // 如果是开关就设置成不能被选中
    self.selectionStyle = [item isKindOfClass:[YFUserLabelItem class]] ? UITableViewCellSelectionStyleNone : UITableViewCellSelectionStyleDefault;
   
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    
    if ([item isKindOfClass:[YFUserArrowItem class]]) {
        _accessoryArrow.hidden = NO;
        self.accessoryView = [self accessoryArrow];
    }else {
        if (_accessoryArrow != nil) {
            _accessoryArrow.hidden = YES;
            [_accessoryArrow removeFromSuperview];
            _accessoryArrow = nil;
            self.accessoryArrow = nil;
        }
    }
    if ([item isKindOfClass:[YFUserSaveItem class]]){
        YFUserSaveItem *itemSave = (YFUserSaveItem *)item;
        [self updateSelectImageView];
        [itemSave addObserver:self forKeyPath:@"isSelected" options:NSKeyValueObservingOptionNew context:nil];
    }else {
        if (_selectImageView != nil) {
            [_selectImageView removeFromSuperview];
            _selectImageView = nil;
        }
    }
    if ([item isKindOfClass:[YFUserLabelItem class]]){
        // 给label赋值
        YFUserLabelItem *itemLabel = (YFUserLabelItem *)item;
        self.accessoryLabel.text = itemLabel.labelText;
    }else {
        if (_accessoryLabel != nil) {
            [_accessoryLabel removeFromSuperview];
            _accessoryLabel = nil;
        }
    }
    
    if ([item isKindOfClass:[YFUserImageItem class]]){
        [self rightImageView];
        YFUserImageItem *itemImage = (YFUserImageItem *)item;
        self.rightImageView.image = itemImage.image;
        _rightImageView.hidden = NO;

    }else {
        if (_rightImageView != nil) {
            _rightImageView.hidden = YES;
            [_rightImageView removeFromSuperview];
            _rightImageView = nil;
        }
    }
    [self setupCell];
}

- (UIImageView *)accessoryArrow {
    if (_accessoryArrow == nil) {
        _accessoryArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow_gray"]];
    }
    return _accessoryArrow;
}
- (UILabel *)accessoryLabel {
    if (_accessoryLabel == nil) {
        _accessoryLabel = [[UILabel alloc] init];
        // 设置字体大小
        _accessoryLabel.font = [UIFont pingFangSCFont:PingFangSCRegular size:14];
        _accessoryLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0];
        _accessoryLabel.textAlignment = NSTextAlignmentLeft;
        _accessoryLabel.numberOfLines = 0;
        [self.contentView addSubview:_accessoryLabel];
        [_accessoryLabel sizeToFit];
    }
    return _accessoryLabel;
}

- (UIImageView *)selectImageView {
    if (_selectImageView == nil) {
        _selectImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"msg_box_choose_before"]];
        [self.contentView addSubview:_selectImageView];
        [_selectImageView sizeToFit];
        _selectImageView.right = 16;
        _selectImageView.centerY = self.contentView.centerY;
    }
    return _selectImageView;
}

- (void)updateSelectImageView {
    if ([self.item isKindOfClass:[YFUserSaveItem class]]) {
        YFUserSaveItem *itemSave = (YFUserSaveItem *)self.item;
        if (itemSave.isSelected) {
            self.selectImageView.image = [UIImage imageNamed:itemSave.selectImageName];
        }else {
            self.selectImageView.image = [UIImage imageNamed:itemSave.unSelectImageName];
        }
    }
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"isSelected"]) {
        [self updateSelectImageView];
    }
}

- (void)dealloc {
//    YFLog(@"YFUserCenterCellDealloc");
    if ([self.item isKindOfClass:[YFUserSaveItem class]]) {
       [self.item removeObserver:self forKeyPath:@"isSelected"];
    }
}

- (UIImageView *)rightImageView {
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:_rightImageView];
    }
    return _rightImageView;
}



#pragma mark 添加分隔线
// 分割线--x 对齐左侧第一个控件
- (UIView *)lineView {
    if(_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kLightGrayBgColor;
        _lineView.hidden = YES;
        [self.contentView addSubview:_lineView];
    }
    return _lineView;
}
// 底部分割线--x 从0 开始
- (UIView *)bottomLineView {
    if (_bottomLineView == nil) {
        _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 50 - 1, [UIScreen mainScreen].bounds.size.width, 1.0)];
        _bottomLineView.backgroundColor = kLightGrayBgColor;
        [self.contentView addSubview:_bottomLineView];
    }
    return _bottomLineView;
}
// 顶部分割线x 从0 开始
- (UIView *)topLineView {
    if (_topLineView == nil) {
        _topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1)];
        _topLineView.backgroundColor = kLightGrayBgColor;
        [self.contentView addSubview:_topLineView];
    }
    return _topLineView;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    _selectImageView.right = 16;
    _selectImageView.centerY = self.contentView.centerY;

    _accessoryLabel.right = 16;
    _accessoryLabel.centerY = self.contentView.centerY;
    
    self.bottomLineView.top = self.bounds.size.height - 1;
    // 设置分隔线的frame
    if (self.item.icon) {
        self.lineView.left = self.imageView.left;
    }else {
        self.lineView.left = self.textLabel.left;
    }
    
    self.lineView.top = self.bounds.size.height - 1;
    self.lineView.width = self.bounds.size.width;
    self.lineView.height = 1;
    if ([self.item isKindOfClass:[YFUserImageItem class]]) {
        YFUserImageItem *imageItem = (YFUserImageItem *)self.item;
        _rightImageView.frame = imageItem.imageFrame;
        [_rightImageView sizeToFit];
        if (imageItem.imageFrame.size.width+imageItem.imageFrame.size.height == 0) {
            _rightImageView.y = (self.height - _rightImageView.height)*0.5;
            _rightImageView.x = self.width - _rightImageView.width - 20;
            _rightImageView.layer.cornerRadius = imageItem.cornerRadius;
            _rightImageView.layer.borderColor = imageItem.boderColor.CGColor;
            _rightImageView.layer.borderWidth = imageItem.boderWidth;
            [_rightImageView.layer setMasksToBounds:imageItem.cornerRadius > 0];
        }
    }
    [self adjustUI];
}

- (void)adjustUI {
    self.bottomLineView.height = (self.separationBottomLineHeight <= 0 || self.separationBottomLineHeight > self.height) ? 0.5:self.separationBottomLineHeight;
    
    if (![NSStringFromUIEdgeInsets(_separationBottomLinerightOffset) isEqualToString:NSStringFromUIEdgeInsets(UIEdgeInsetsZero)]) {
        self.bottomLineView.left= self.bottomLineView.left+ self.separationBottomLinerightOffset.left;
        self.bottomLineView.width = (self.bottomLineView.width - self.separationBottomLinerightOffset.right);
        self.bottomLineView.left= self.bottomLineView.left+ self.separationBottomLinerightOffset.left;
        self.bottomLineView.top = self.bottomLineView.top + self.separationBottomLinerightOffset.top - self.separationBottomLinerightOffset.bottom;
    }
    
    self.textLabel.top -= self.textLabelVOffset;
    self.detailTextLabel.top -= self.detailLabelVOffset;
    self.textLabel.left+= self.textLabelHOffset;
    self.detailTextLabel.left+= self.detailLabelHOffset;
    
}


- (void)showLine:(BOOL)show {
    self.lineView.hidden = !show;
    self.bottomLineView.hidden = show;
}
- (void)showSectionSepTopLineView:(BOOL)show {
    self.topLineView.hidden = !show;
}

// 分割线--x 对齐左侧第一个控件
- (void)showSeparationLine:(BOOL)show {
    self.lineView.hidden = !show;
    if (show && self.bottomLineView.hidden == NO) {
        self.bottomLineView.hidden = YES;
    }
}
// 顶部分割线x 从0 开始
- (void)showSeparationTopLine:(BOOL)show {
    self.topLineView.hidden = !show;
}
// 底部部分割线x 从0 开始
- (void)showSeparationBottomLine:(BOOL)show {
    self.bottomLineView.hidden = !show;
    if (show && self.lineView.hidden == NO) {
        self.lineView.hidden = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    // Configure the view for the selected state
    [super setSelected:selected animated:animated];
}


+ (UIImage *)image:(UIImage *)image WithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha {

    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    UIRectFill(bounds);
    if (alpha < 0 || alpha > 1) {
        alpha = 1.0;
    }
    //Draw the tinted image in context
    [image drawInRect:bounds blendMode:blendMode alpha:alpha];
    if (blendMode != kCGBlendModeDestinationIn) {
        [image drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:alpha];
    }
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}


@end



@implementation UIView (yf_viewFrame)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setTop:(CGFloat)t
{
    self.frame = CGRectMake(self.left, t, self.width, self.height);
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setBottom:(CGFloat)b
{
    self.frame = CGRectMake(self.left, b - self.height, self.width, self.height);
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLeft:(CGFloat)l
{
    self.frame = CGRectMake(l, self.top, self.width, self.height);
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setRight:(CGFloat)r
{
    self.frame = CGRectMake(r - self.width, self.top, self.width, self.height);
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}


@end
