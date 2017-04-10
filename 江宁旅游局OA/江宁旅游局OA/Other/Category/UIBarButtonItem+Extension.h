//
//  UIBarButtonItem+Extension.h
//  嗨众 微博
//
//  Created by 徐静文 on 15/12/7.
//  Copyright © 2015年 徐静文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage;
@end
