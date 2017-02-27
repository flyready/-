
//
//  ModelViewController.m
//  自定义动画
//
//  Created by Nicholas on 17/2/22.
//  Copyright © 2017年 Mr.zhang. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 130, 200)];
    [self.view addSubview:button];
}
- (void)dismissViewController
{
    [self.delegate modelVcDismiss:self];
}

@end
