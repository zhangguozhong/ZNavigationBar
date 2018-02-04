//
//  ZBaseViewController.m
//  ZNavigationBar
//
//  Created by 张国忠 on 2018/2/3.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ZBaseViewController.h"
#import "ZTools.h"

@interface ZBaseViewController ()
@property (nonatomic,strong,readwrite) ZNavigationBar *zNavigationBar;
@property (nonatomic,strong,readwrite) UINavigationItem *zNavigationItem;
@property (nonatomic,assign) CGFloat zNavBarHeight;
@end

@implementation ZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zNavigationBar = [[ZNavigationBar alloc] init];
    self.zNavBarHeight = [ZTools instance].navBarHeight;
    self.hiddenNavBar = NO;
    self.zNavigationItem = [[UINavigationItem alloc] init];
    [self.zNavigationBar pushNavigationItem:_zNavigationItem animated:NO];
    [self.view addSubview:self.zNavigationBar];
    [self.view addSubview:self.contentView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.navigationController.viewControllers.count > 1) {
        UIBarButtonItem *pushBackBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pushBackAction:)];
        pushBackBtn.tintColor = [UIColor blackColor];
        [_zNavigationItem setLeftBarButtonItem:pushBackBtn animated:NO];
    }else{
        _zNavigationItem.leftBarButtonItem = nil;
    }
}

- (void)setHiddenNavBar:(BOOL)hiddenNavBar {
    _hiddenNavBar = hiddenNavBar;
    _zNavigationBar.hidden = hiddenNavBar;
    if (hiddenNavBar) {
        self.contentView.frame = self.view.bounds;
    }else{
        self.contentView.frame = CGRectMake(0, _zNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-_zNavBarHeight);
    }
}

- (void)setCenterViewTitle:(NSString *)centerViewTitle{
    _centerViewTitle = centerViewTitle;
    if (centerViewTitle) {
        UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
        titleView.text = centerViewTitle;
        titleView.textAlignment = NSTextAlignmentCenter;
        titleView.font = [UIFont systemFontOfSize:18];
        _zNavigationItem.titleView = titleView;
    }
}

- (void)pushBackAction:(UIBarButtonItem *)sender {
    if (_pushBackBlock) {
        _pushBackBlock(self);
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)showLoadView {
    NSLog(@"显示加载款");
}

- (void)hideLoadView {
    NSLog(@"隐藏加载款");
}

- (UIView *)contentView {
    if (!_contentView) {
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _zNavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT-_zNavBarHeight)];
        contentView.backgroundColor = [UIColor whiteColor];
        _contentView = contentView;
    }
    return _contentView;
}

@end
