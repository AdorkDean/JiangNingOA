//
//  LoginModel.m
//  YC-ZHSQ-WY
//
//  Created by jsycgsj on 15/12/4.
//  Copyright © 2015年 JSYC-iOS. All rights reserved.
//

#import "LoginModel.h"


@implementation LoginModel

+ (instancetype)sessionIdWithDict:(NSDictionary *)dict{
    LoginModel *logModel = [[self alloc] init];
    logModel.sessionId = dict[@"sessionId"];
    logModel.currUser = dict[@"currUser"];
    return logModel;
}



/**
 *  说明哪些对象 能存进沙盒
 *
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.sessionId forKey:@"sessionId"];
    [encoder encodeObject:self.currUser forKey:@"currUser"];
}

-(instancetype)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.sessionId = [decoder decodeObjectForKey:@"sessionId"];
        self.currUser.userName = [decoder decodeObjectForKey:@"currUser"];
    }
    return self;
}
@end
