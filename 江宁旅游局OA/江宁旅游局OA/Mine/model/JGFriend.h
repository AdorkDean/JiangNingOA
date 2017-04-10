//
//  JGFriend.h
//  QQ列表
//
//  Created by 郭军 on 16/8/14.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGFriend : NSObject

/** 图像  */
@property (nonatomic, copy) NSString *icon;
/** 名字  */
@property (nonatomic, copy) NSString *name;
/** 手机号码  */
@property (nonatomic, copy) NSString *phone;

+ (instancetype)friendWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
