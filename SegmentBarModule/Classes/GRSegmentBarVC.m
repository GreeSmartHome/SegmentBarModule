//
//  GRSegmentBarVC.m
//  SegmentBarModule_Example
//
//  Created by 冉东军 on 2020/2/9.
//  Copyright © 2020 1049646716@qq.com. All rights reserved.
//

#import "GRSegmentBarVC.h"

#import "UIView+SegmentBar.h"

@interface GRSegmentBarVC ()<GRSegmentBarDelegate,UIScrollViewDelegate>

//控制器容器视图
@property (nonatomic, strong) UIScrollView *contentView;

@end

@implementation GRSegmentBarVC

- (GRSegmentBar *)segmentBar{
    if (!_segmentBar) {
        _segmentBar = [GRSegmentBar segmentBarWithFrame:CGRectZero];
        _segmentBar.backgroundColor = [UIColor brownColor];
        _segmentBar.delegate = self;
        [self.view addSubview:_segmentBar];
    }
    return _segmentBar;
}

- (UIScrollView *)contentView{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc]init];
        _contentView.delegate = self;
        _contentView.pagingEnabled = YES;
        [self.view addSubview:_contentView];
    }
    return _contentView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
}
#pragma mark - 接口
- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs
{
    NSAssert(items.count != 0 || items.count == childVCs.count, @"个数不一致, 请自己检查");
    
    self.segmentBar.items = items;
    //移除
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    //添加子控制器 在contentView, 展示子控制器的视图内容
    for (UIViewController *VC in childVCs) {
        [self addChildViewController:VC];
    }

    self.contentView.contentSize = CGSizeMake(items.count * self.view.width, 0);
    
    self.segmentBar.selectIndex = 0;
}

#pragma mark -选项卡代理方法
- (void)segmentBar:(GRSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    NSLog(@"%zd----%zd", fromIndex, toIndex);
    [self showChildVCViewsAtIndex:toIndex];
}

- (void)showChildVCViewsAtIndex: (NSInteger)index {
    
    if (self.childViewControllers.count == 0 || index < 0 || index > self.childViewControllers.count - 1) {
        return;
    }
    
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.contentView.width, 0, self.contentView.width, self.contentView.height);
    [self.contentView addSubview:vc.view];
    
    // 滚动到对应的位置
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0) animated:YES];
    
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 计算最后的索引
    NSInteger index = self.contentView.contentOffset.x / self.contentView.width;
    
    //    [self showChildVCViewsAtIndex:index];
    self.segmentBar.selectIndex = index;
    
}

#pragma mark - 布局
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    //目的是为了把控制器和选项卡分离开来
    if (self.segmentBar.superview == self.view) {
        self.segmentBar.frame = CGRectMake(0, 60, self.view.width, 35);
        
        CGFloat contentViewY = self.segmentBar.y + self.segmentBar.height;
        CGRect contentFrame = CGRectMake(0, contentViewY, self.view.width, self.view.height - contentViewY);
        self.contentView.frame = contentFrame;
        self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);

        return;
    }
    
    
    CGRect contentFrame = CGRectMake(0, 0,self.view.width,self.view.height);
    self.contentView.frame = contentFrame;
     self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    
}

@end
