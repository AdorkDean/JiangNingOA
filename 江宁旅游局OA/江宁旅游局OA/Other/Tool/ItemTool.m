//
//  ItemTool.m
//  物联网后商机管理
//
//  Created by 欣华pro on 16/1/27.
//  Copyright © 2016年 欣华pro. All rights reserved.
//

#import "ItemTool.h"

@implementation ItemTool
 +(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
      [btn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [btn setTintColor:[UIColor whiteColor]];
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
