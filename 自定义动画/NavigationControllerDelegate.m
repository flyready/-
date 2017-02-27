
//
//  NavigationControllerDelegate.m
//  自定义动画
//
//  Created by Nicholas on 17/2/22.
//  Copyright © 2017年 Mr.zhang. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "NavigationTransitionAnimation.h"
@interface NavigationControllerDelegate ()
@property (weak, nonatomic) IBOutlet UINavigationController *navigationController;
@property (nonatomic,strong) NavigationTransitionAnimation *animation;

@end
@implementation NavigationControllerDelegate
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.animation = [[NavigationTransitionAnimation alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return _animation;
    }
    return nil;
}



@end
