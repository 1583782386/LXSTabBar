//
//  LXSTabBarViewController.m
//  LXSTabBarDemo
//
//  Created by delegate on 2017/7/24.
//  Copyright © 2017年 松. All rights reserved.
//

#import "LXSTabBarViewController.h"
#import "ViewController.h"
#import "LXSTabBar.h"

@interface LXSTabBarViewController ()<LXSTabBarDelegate>

@end

@implementation LXSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self addChildVc:[[ViewController alloc] init] title:@"首页" image:@"fine" selectedImage:@"fine_r"];
    [self addChildVc:[[ViewController alloc] init] title:@"社区" image:@"fine" selectedImage:@"fine_r"];
    [self addChildVc:[[ViewController alloc] init] title:@"消息" image:@"fine" selectedImage:@"fine_r"];
    [self addChildVc:[[ViewController alloc] init] title:@"咨询" image:@"fine" selectedImage:@"fine_r"];
    
    LXSTabBar *tabBar = [[LXSTabBar alloc] init];
    
    //取消tabBar的透明效果
    tabBar.translucent = NO;
    tabBar.myDelegate = self;
    
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    //        childVc.view.backgroundColor = RandomColor; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    
    // 为子控制器包装导航控制器
    UINavigationController *navigationVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
}
- (void)tabBarDidClickPlusButton:(LXSTabBar *)tabBar
{
    NSLog(@"+++");
}
@end
