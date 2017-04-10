//
//  AppDelegate.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/9.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "AppDelegate.h"
#import "loginViewController.h"
#import "homeViewController.h"
#import "TabbarViewController.h"
#import "AppConstants.h"
#import "NavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

//@implementation NSURLRequest(DataController)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    TabbarViewController *tabbarVC = [TabbarViewController new];
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = tabbarVC;

    
    loginViewController *loginView = [loginViewController new];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = loginView;
    [self.window makeKeyAndVisible];
    
    //默认消息提醒switch的状态
    NSDictionary *dadSwitch = @{@"switchType":@YES};
    NSDictionary *LCSwitch = @{@"switchType":@YES};
    NSDictionary *HFSwitch = @{@"switchType":@NO};
    NSDictionary *GGSwitch = @{@"switchType":@NO};
    
    NSArray *arr = @[dadSwitch,LCSwitch,HFSwitch,GGSwitch];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:arr forKey:@"switchTP"];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end





