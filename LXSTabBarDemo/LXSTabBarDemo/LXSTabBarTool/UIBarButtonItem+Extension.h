//
//  UIBarButtonItem+Extension.h
//  自定义tabBar
//
//  Created by delegate on 2017/5/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTargat:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;


@end
