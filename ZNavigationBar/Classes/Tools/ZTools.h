//
//  ZTools.h
//  ZNavigationBar
//
//  Created by 张国忠 on 2018/2/4.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ZTools : NSObject

@property (assign,nonatomic,readonly) BOOL isIphoneX;
@property (assign,nonatomic,readonly) BOOL isGt_ios_11;
@property (assign,nonatomic,readonly) CGFloat navBarHeight;

+ (instancetype)instance;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end
