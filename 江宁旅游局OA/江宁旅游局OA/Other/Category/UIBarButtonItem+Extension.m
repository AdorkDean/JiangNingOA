//
//  UIBarButtonItem+Extension.m
//  嗨众 微博
//
//  Created by 徐静文 on 15/12/7.
//  Copyright © 2015年 徐静文. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "AppConstants.h"
@implementation UIBarButtonItem (Extension)
/**
 *  创建一个item
 *
 *  @param target         点击item后调用哪个对象的方法
 *  @param action         点击item后调用target的哪个方法
 *  @param image          图片
 *  @param highlightImage 高亮图片
 *
 *  @return 创建完的item
 */
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    //   设置右侧item的尺寸
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}
@end
