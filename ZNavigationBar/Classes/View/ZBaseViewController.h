//
//  ZBaseViewController.h
//  ZNavigationBar
//
//  Created by 张国忠 on 2018/2/3.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZNavigationBar.h"

@interface ZBaseViewController : UIViewController

@property (nonatomic,strong,readonly) ZNavigationBar *zNavigationBar;
@property (nonatomic,copy) NSString *centerViewTitle;
@property (nonatomic,strong) UIView *centerView;

@property (nonatomic,assign) BOOL hiddenNavBar;
@property (nonatomic,strong) UIView *contentView;
@property (copy,nonatomic) void(^pushBackBlock)(UIViewController *currentVC);

- (void)showLoadView;
- (void)hideLoadView;

@end
