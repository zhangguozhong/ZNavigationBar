//
//  ZTempViewController.m
//  ZNavigationBar
//
//  Created by 张国忠 on 2018/2/3.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ZTempViewController.h"

@interface ZTempViewController ()<UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ZTempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.zNavigationBar.barTintColor = [UIColor greenColor];
    self.centerViewTitle = @"这是第二个";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.pushBackBlock = ^(UIViewController *currentVC) {
        [currentVC.navigationController popViewControllerAnimated:YES];
    };
    [self.contentView addSubview:_tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showLoadView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self hideLoadView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"有点意思";
    return cell;
}

@end
