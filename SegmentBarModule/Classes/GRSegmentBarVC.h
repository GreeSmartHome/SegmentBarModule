//
//  GRSegmentBarVC.h
//  SegmentBarModule_Example
//
//  Created by 冉东军 on 2020/2/9.
//  Copyright © 2020 1049646716@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRSegmentBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface GRSegmentBarVC : UIViewController
//选项卡
@property (nonatomic, strong) GRSegmentBar *segmentBar;

- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;
@end

NS_ASSUME_NONNULL_END
