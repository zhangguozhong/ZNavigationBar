//
//  ZNavigationController.m
//  ZNavigationBar
//
//  Created by 张国忠 on 2018/2/3.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ZNavigationController.h"

@interface ZNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation ZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak ZNavigationController *weakObject = self;
    [self setNavigationBarHidden:YES animated:NO];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakObject;
        self.delegate = weakObject;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate {
    // Enable the gesture again once the new controller is shown
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

#pragma mark UINavigationControllerDelegate
// 我们差不多能猜到是因为手势冲突导致的，那我们就先让 ViewController 同时接受多个手势吧。
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.childViewControllers count] == 1) {
        return NO;
    }
    return YES;
}

// 我们差不多能猜到是因为手势冲突导致的，那我们就先让 ViewController 同时接受多个手势吧。
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
//运行试一试，两个问题同时解决，不过又发现了新问题，手指在滑动的时候，被 pop 的 ViewController 中的 UIScrollView 会跟着一起滚动，这个效果看起来就很怪（知乎日报现在就是这样的效果），而且也不是原始的滑动返回应有的效果，那么就让我们继续用代码来解决吧
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]];
}

@end
