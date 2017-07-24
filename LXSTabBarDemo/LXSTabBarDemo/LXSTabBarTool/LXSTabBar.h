//
//  LXSTabBar.h
//  自定义tabBar
//
//  Created by delegate on 2017/5/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXSTabBar;

@protocol LXSTabBarDelegate <NSObject>

@optional

-(void)tabBarDidClickPlusButton:(LXSTabBar *)tabBar;

@end


@interface LXSTabBar : UITabBar

@property (nonatomic,weak) id<LXSTabBarDelegate> myDelegate;


@end
