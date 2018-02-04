//
//  ZTools.m
//  ZNavigationBar
//
//  Created by 张国忠 on 2018/2/4.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "ZTools.h"

@implementation ZTools

+ (instancetype)instance {
    static ZTools *instanceTools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instanceTools = [[self alloc] init];
    });
    return instanceTools;
}

- (BOOL)isIphoneX {
    return [UIScreen mainScreen].currentMode?CGSizeEqualToSize(CGSizeMake(1125, 2436), [UIScreen mainScreen].currentMode.size):NO;
}

- (BOOL)isGt_ios_11 {
    return [[UIDevice currentDevice].systemVersion compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending;
}

- (CGFloat)navBarHeight {
    return self.isIphoneX?88:64;
}

@end
