//
//  GRSegmentBar.h
//  SegmentBarModule_Example
//
//  Created by 冉东军 on 2020/2/8.
//  Copyright © 2020 1049646716@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRSegmentBarConfig.h"

NS_ASSUME_NONNULL_BEGIN
@class GRSegmentBar;
@protocol GRSegmentBarDelegate <NSObject>
/**
  代理方法，告诉外界，内部的点击数据
 
  @param segmentBar segmentBar
  @param toIndex    选中的索引(从0开始)
  @param fromIndex  上一个索引
 */
- (void)segmentBar: (GRSegmentBar *)segmentBar didSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex;

@end

@interface GRSegmentBar : UIView
/**
快速创建一个选项卡控件

@param frame frame

@return 选项卡控件
*/
+ (instancetype)segmentBarWithFrame: (CGRect)frame;
/** 数据源 */
@property (nonatomic, strong) NSArray <NSString *>*items;
/** 当前选中的索引, 双向设置 */
@property (nonatomic, assign) NSInteger selectIndex;
/** 代理 */
@property (nonatomic, weak) id<GRSegmentBarDelegate>delegate;
/** 更新状态 */
- (void)updateSegmentBarWithConfig: (void(^)(GRSegmentBarConfig *config))configBlock;

@end

NS_ASSUME_NONNULL_END
