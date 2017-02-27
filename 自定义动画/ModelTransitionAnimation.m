//
//  ModelTransitionAnimation.m
//  自定义动画
//
//  Created by Nicholas on 17/2/22.
//  Copyright © 2017年 Mr.zhang. All rights reserved.
//

#import "ModelTransitionAnimation.h"
#import "ModelViewController.h"
@implementation ModelTransitionAnimation
//动画持续时间，单位是秒
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}
//动画效果
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //通过键值UITranstionContexToViewControllerKey 获取需要呈现的视图控制器VC
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //得到toVc完全呈现后的frame
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVc];
    if ([toVc isKindOfClass:[ModelViewController class]]) {
        //需要呈现的视图是模态视图，此时将模态视图的frame放到屏幕下方，这样才能实现从下方弹出的效果
        toVc.view.frame = CGRectOffset(finalFrame, 0, [UIScreen mainScreen].bounds.size.height);
    }else
    {
        //需要呈现的视图是主视图，此时将主视图的frame 放到屏幕空间上方 这样才能实现从上方放下的效果
        toVc.view.frame = CGRectOffset(finalFrame, 0, -[UIScreen mainScreen].bounds.size.height);
    }
    //切换在containerView中完成，需要将toVc.view加到containerView中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    //开始动画  这里使用UIKit提供的弹簧效果动画
    //useingSpringWithDamping越接近1 弹性效果越不明显
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        toVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        //通知系统动画切换完成
        [transitionContext completeTransition:YES];
    }];
    
    
}






@end
