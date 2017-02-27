//
//  ViewController.m
//  自定义动画
//
//  Created by Nicholas on 17/2/22.
//  Copyright © 2017年 Mr.zhang. All rights reserved.
//

#import "ViewController.h"
#import "ModelViewController.h"
#import "ModelTransitionAnimation.h"
//如果需要使用自定义动画 视图需要实现UIViewControllerTransitioningDelegate协议

@interface ViewController ()<ModelViewControllerDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) ModelTransitionAnimation *animation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animation = [[ModelTransitionAnimation alloc] init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:button];
}
- (void)pushViewController
{
    ModelViewController *modelVc = [[ModelViewController alloc] init];
    modelVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    modelVc.delegate = self;
    modelVc.transitioningDelegate = self;
    [self presentViewController:modelVc animated:YES completion:nil];
}
- (void)modelVcDismiss:(ModelViewController *)modelVc
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return _animation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return _animation;
}


@end
