//
//  LoginModel.h
//
//  Created by jsycgsj on 15/12/4.
//  Copyright © 2015年 JSYC-iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrUserModel.h"
@interface LoginModel : NSObject <NSCoding>

@property(nonatomic,copy) NSString *sessionId;
@property(nonatomic,copy) NSString *massage;
@property (nonatomic ,copy)  NSString *userId;
@property (nonatomic ,strong)  CurrUserModel *currUser;



+ (instancetype)sessionIdWithDict:(NSDictionary *)dict;

@end
