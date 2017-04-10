//
//  AppConstants.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/10.
//  Copyright © 2016年 xujw. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifdef DEBUG // 处于开发阶段
#define NSLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define NSLog(...)
#endif

#define NSLogFunc NSLog(@"%s", __func__)

#import "MBProgressHUD+MJ.h"
#import "UIView+Extension.h"
#import "UIColor+ZXLazy.h"

//#define BASE_URL @"http://218.94.213.34:18080/lyjoa"
#define BASE_URL @"http://192.168.1.48:8080/lyjoa/app"

#define HTML_URL @"http://192.168.1.48:8080/lyjoa/app/hadoop"


#define HTTP_CONECT(x,y) [NSString stringWithFormat:@"%@%@",x,y]

#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)


//RGB颜色
#define XHColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0  blue:(b)/255.0  alpha:1.0]
#define WIN_SIZE [UIScreen mainScreen].bounds.size
#define WIN_WIDTH [UIScreen mainScreen].bounds.size.width
#define WIN_HEIGHT [UIScreen mainScreen].bounds.size.height


// Frame的快捷操作
static inline CGFloat GG_X(UIView *view){ return view.frame.origin.x;}
static inline CGFloat GG_Y(UIView *view){ return view.frame.origin.y;}
static inline CGFloat GG_W(UIView *view){ return view.frame.size.width;}
static inline CGFloat GG_H(UIView *view){ return view.frame.size.height;}
static inline CGFloat GG_BOTTOM_Y(UIView *view){ return GG_Y(view) + GG_H(view);};
static inline CGFloat GG_RIGHT_X(UIView *view){ return GG_X(view) + GG_W(view);};

// 快捷方式
#define ccp(x,y) CGPointMake(x, y)
#define ccs(x,y) CGSizeMake(x, y)
#define ccr(x,y,w,h) CGRectMake(x,y,w,h)

#define xjw(x,y,w,h) CGRectMake(RELATIVE_WIDTH( 2 * x),RELATIVE_HEIGHT( 2 * y),RELATIVE_WIDTH(2 * w),RELATIVE_HEIGHT(2 * h))

#define BASE_WIDTH  750.0
#define BASE_HEIGHT 1334.0

#define RELATIVE_WIDTH(w) WIN_WIDTH/BASE_WIDTH * w
#define RELATIVE_HEIGHT(h) WIN_HEIGHT/BASE_HEIGHT * h


//----------方法简写-------
#define mAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define mWindow             [[[UIApplication sharedApplication] windows] lastObject]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]
#define mUserDefaults       [NSUserDefaults standardUserDefaults]
#define mNotificationCenter [NSNotificationCenter defaultCenter]

//G－C－D
#define kGCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define kGCDMain(block)       dispatch_async(dispatch_get_main_queue(),block)

//简单的以AlertView显示提示信息
#define mAlertView(title, msg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alert show];

//----------设备系统相关---------
#define mRetina   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define mIsiP5    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
#define mIsPad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define mIsiphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define mSystemVersion   ([[UIDevice currentDevice] systemVersion])
#define mCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define mAPPVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define mFirstLaunch     mAPPVersion     //以系统版本来判断是否是第一次启动，包括升级后启动。
#define mFirstRun        @"firstRun"     //判断是否为第一次运行，升级后启动不算是第一次运行


