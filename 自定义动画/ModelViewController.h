//
//  ModelViewController.h
//  自定义动画
//
//  Created by Nicholas on 17/2/22.
//  Copyright © 2017年 Mr.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModelViewController;
@protocol ModelViewControllerDelegate <NSObject>
- (void)modelVcDismiss:(ModelViewController *)modelVc;


@end
@interface ModelViewController : UIViewController
@property (nonatomic,assign)id <ModelViewControllerDelegate>delegate;
@end
