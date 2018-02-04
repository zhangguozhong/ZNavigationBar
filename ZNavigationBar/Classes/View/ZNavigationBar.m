//
//  ZNavigationBar.m
//  ZNavigationBar
//
//  Created by 张国忠 on 2018/2/3.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ZNavigationBar.h"
#import "ZTools.h"

@implementation ZNavigationBar

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat navBarHeight = [ZTools instance].navBarHeight;
    self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), navBarHeight);
    for (UIView *view in self.subviews) {
        NSString *strViewClass = NSStringFromClass(view.class);
        if ([strViewClass containsString:@"Background"]) {
            view.frame = self.bounds;
        }else if ([ZTools instance].isGt_ios_11 && [strViewClass containsString:@"ContentView"]){
            CGRect viewFrame = view.frame;
            viewFrame.origin.y = [ZTools instance].isIphoneX?44:20;
            viewFrame.size.height = CGRectGetHeight(self.bounds) - viewFrame.origin.y;
            view.frame = viewFrame;
        }
    }
}

@end
