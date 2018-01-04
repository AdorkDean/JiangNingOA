//
//  ItemTool.h
//  物联网后商机管理
//
//  Created by 欣华pro on 16/1/27.
//  Copyright © 2016年 欣华pro. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ItemTool : NSObject
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightImage:(NSString *)hightlightImage;
@end
