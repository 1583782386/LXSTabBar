//
//  LXSTabBar.m
//  自定义tabBar
//
//  Created by delegate on 2017/5/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "LXSTabBar.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
@interface LXSTabBar()

@property (nonatomic, weak) UIButton *plusBtn;

@end
@implementation LXSTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIButton *plusBtn = [[UIButton alloc] init];
        
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"fine"] forState:UIControlStateNormal];
        
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"fine_r"] forState:UIControlStateHighlighted];
        
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        
        [plusBtn addTarget:self action:@selector(plusBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}

/**
 *  加号按钮点击
 */
- (void)plusBtnClick
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)])
    {
        [self.myDelegate tabBarDidClickPlusButton:self];
    }
}

/**
 *  想要重新排布系统控件subview的布局，推荐重写layoutSubviews，在调用父类布局后重新排布。
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置加号按钮的位置
    self.plusBtn.centerX = self.width*0.5;
    self.plusBtn.centerY = self.height*0.5;
    
    // 2.设置其他tabbarButton的frame
    CGFloat tabBarButtonW = self.width / 5;
    
    CGFloat tabBarButtonIndex = 0;
    
    for (UIView *child in self.subviews)
    {
        
        Class class = NSClassFromString(@"UITabBarButton");
        
        if ([child isKindOfClass:class])
        {
            // 设置x
            child.x = tabBarButtonIndex * tabBarButtonW;
            
            // 设置宽度
            child.width = tabBarButtonW;
            
            // 增加索引
            tabBarButtonIndex++;
            
            if (tabBarButtonIndex == 2)
            {
                tabBarButtonIndex++;
            }
        }
    }
}




@end
