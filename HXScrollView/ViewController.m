//
//  ViewController.m
//  HXScrollView
//
//  Created by XIU-Developer on 2016/10/3.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *scrollView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 添加Pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [scrollView addGestureRecognizer:pan];
    
    //添加一个子控件
    UISwitch *switchView = [[UISwitch alloc] init];
    [scrollView addSubview:switchView];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    // 获取手指的偏移量
    CGPoint transP = [pan translationInView:pan.view];
    
    // 修改bounds
    CGRect bounds = _scrollView.bounds;
    bounds.origin.y -= transP.y;
    _scrollView.bounds = bounds;
    [pan setTranslation:CGPointZero inView:pan.view];
}

@end
