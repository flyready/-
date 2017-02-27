//
//  NavigationTransitionAnimation.m
//  自定义动画
//
//  Created by Nicholas on 17/2/22.
//  Copyright © 2017年 Mr.zhang. All rights reserved.
//

#import "NavigationTransitionAnimation.h"

@implementation NavigationTransitionAnimation
//动画持续时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.9;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //通过键值UITransitionContextToViewControllerKey获取西药呈现的视图控制器
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //获取退出的控制器
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toVc.view];
    
    //设置需要呈现的视图控制器透明
    [toVc.view setAlpha:0];
    //设置需要呈现的视图控制器位于左侧屏幕外 且大小为0.1倍 这样才有左侧推入屏幕 且逐渐变大的动画效果
    toVc.view.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0), 0.1, 0.1);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       //将需要退出的试图控制器移出右侧屏幕外 且大小为原来的0.1倍
        fromVc.view.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0), 0.1, 0.1) ;
        fromVc.view.alpha = 0;
        toVc.view.transform = CGAffineTransformIdentity;
        toVc.view.alpha = 1;
        
    } completion:^(BOOL finished) {
        //动画结束后属性设置为初始值
        fromVc.view.transform = CGAffineTransformIdentity;
        fromVc.view.alpha = 1;
        //通知系统动画切换成功
        [transitionContext completeTransition:YES];
        
    }];
    
    
    
}


@end
