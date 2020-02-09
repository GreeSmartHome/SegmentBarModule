//
//  GRSegmentBarConfig.h
//  SegmentBarModule_Example
//
//  Created by 冉东军 on 2020/2/9.
//  Copyright © 2020 1049646716@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GRSegmentBarConfig : NSObject

+ (instancetype)defaultConfig;

/** 背景颜色 */
@property (nonatomic, strong) UIColor *segmentBarBackColor;
/** 文字普通颜色 */
@property (nonatomic, strong) UIColor *itemNormalColor;
/** 文字选中颜色 */
@property (nonatomic, strong) UIColor *itemSelectColor;
/** 文字字体大小 */
@property (nonatomic, strong) UIFont *itemFont;
/** 下划线颜色 */
@property (nonatomic, strong) UIColor *indicatorColor;
/** 下划线高度 */
@property (nonatomic, assign) CGFloat indicatorHeight;
/** 下划线宽度扩展 */
@property (nonatomic, assign) CGFloat indicatorExtraW;

// 链式编程写法

@property (nonatomic, strong, readonly) GRSegmentBarConfig *(^itemNColor)(UIColor *color);
@property (nonatomic, strong, readonly) GRSegmentBarConfig *(^itemSColor)(UIColor *color);
@property (nonatomic, strong, readonly) GRSegmentBarConfig *(^itemBgColor)(UIColor *color);
@property (nonatomic, strong, readonly) GRSegmentBarConfig *(^itemEWidth)(CGFloat width);

// 链式编程的改法
//- (GRSegmentBarConfig *(^)(UIColor *color))itemNC;
//- (GRSegmentBarConfig *(^)(UIColor *color))itemSC;

@end

NS_ASSUME_NONNULL_END
