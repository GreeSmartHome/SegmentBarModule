//
//  GRSegmentBarConfig.m
//  SegmentBarModule_Example
//
//  Created by 冉东军 on 2020/2/9.
//  Copyright © 2020 1049646716@qq.com. All rights reserved.
//

#import "GRSegmentBarConfig.h"

@implementation GRSegmentBarConfig
+ (instancetype)defaultConfig {
    
    GRSegmentBarConfig *config = [[GRSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:16];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraW = 10;
    
    return config;
    
}

#pragma mark -链式编程
- (GRSegmentBarConfig * _Nonnull (^)(UIColor * _Nonnull))itemNColor{
    return ^(UIColor *color){
        self.itemNormalColor = color;
        return self;
    };
}

-(GRSegmentBarConfig * _Nonnull (^)(UIColor * _Nonnull))itemSColor{
    return ^(UIColor *color) {
        self.itemSelectColor = color;
        return self;
    };
}

- (GRSegmentBarConfig * _Nonnull (^)(CGFloat))itemEWidth{
    return ^(CGFloat width){
        self.indicatorExtraW = width;
        return self;
    };
}

- (GRSegmentBarConfig * _Nonnull (^)(UIColor * _Nonnull))itemBgColor{
    return ^(UIColor *color) {
        self.segmentBarBackColor = color;
        return self;
    };
}
@end
