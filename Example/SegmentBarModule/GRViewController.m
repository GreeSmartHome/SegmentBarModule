//
//  GRViewController.m
//  SegmentBarModule
//
//  Created by 1049646716@qq.com on 02/08/2020.
//  Copyright (c) 2020 1049646716@qq.com. All rights reserved.
//

#import "GRViewController.h"
#import <GRSegmentBarVC.h>

@interface GRViewController ()
@property (nonatomic, weak) GRSegmentBarVC *segmentBarVC;

@end

@implementation GRViewController
- (GRSegmentBarVC *)segmentBarVC {
    if (!_segmentBarVC) {
        GRSegmentBarVC *vc = [[GRSegmentBarVC alloc] init];
        [self addChildViewController:vc];
        _segmentBarVC = vc;
    }
    return _segmentBarVC;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

//    GRSegmentBar *segmentBar = [GRSegmentBar segmentBarWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 40)];
//    segmentBar.backgroundColor = [UIColor brownColor];
//    segmentBar.delegate = self;
//    [self.view addSubview:segmentBar];
    //    segmentBar.items = @[@"专辑", @"声音", @"下载中", @"专辑", @"声音", @"下载中", @"专辑", @"声音", @"下载中", @"专辑", @"声音", @"下载中"];
    
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    self.navigationItem.titleView = self.segmentBarVC.segmentBar;
    
    self.segmentBarVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentBarVC.view];
    NSArray *items = @[@"推荐", @"咨询"];
    
    // 在contentView, 展示子控制器的视图内容
    
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor whiteColor];
    
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor lightGrayColor];
    
//    UIViewController *vc3 = [UIViewController new];
//    vc3.view.backgroundColor = [UIColor yellowColor];
    
    [_segmentBarVC setUpWithItems:items childVCs:@[vc1,vc2]];
    
    //自定义状态
    [self.segmentBarVC.segmentBar updateSegmentBarWithConfig:^(GRSegmentBarConfig * _Nonnull config) {
        //config.segmentBarBackColor = [UIColor grayColor];
        //链式编程
//        config.itemNColor([UIColor redColor]).itemSColor([UIColor orangeColor]).itemEWidth(30);
    }];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
