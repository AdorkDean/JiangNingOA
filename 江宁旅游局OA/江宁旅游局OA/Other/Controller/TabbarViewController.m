//
//  TabbarViewController.m
//  物联网后商机管理
//
//  Created by 欣华pro on 16/1/26.
//  Copyright © 2016年 欣华pro. All rights reserved.
//

#import "TabbarViewController.h"
#import "homeViewController.h"
#import "progressViewController.h"
#import "dataTableViewController.h"
#import "messageViewController.h"
#import "mineViewController.h"
#import "NavigationController.h"
@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.delegate = self;
    // 1.  初始化子控制器
    homeViewController *home  = [homeViewController new];
    [self addchildVC:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    progressViewController *proVC = [progressViewController new];
    [self addchildVC:proVC title:@"工作" image:@"tabbar_work" selectedImage:@"tabbar_work_selected"];
    
    dataTableViewController *dateVC = [dataTableViewController new];
    [self addchildVC:dateVC title:@"" image:@"tabbar_date" selectedImage:@"tabbar_date_selected"];

//    mailViewController *mailVC = [mailViewController new];
//    [self addchildVC:mailVC title:@"邮件" image:@"tabbar_mail" selectedImage:@"tabbar_mail_selected"];
    
    messageViewController *msgVC = [messageViewController new];
    [self addchildVC:msgVC title:@"消息" image:@"tabbar_mail" selectedImage:@"tabbar_mail_selected"];

    
    mineViewController *mineVC = [mineViewController new];
    [self addchildVC:mineVC title:@"我的" image:@"tabbar_mine" selectedImage:@"tabbar_mine_selected"];
    
      //  2.更换系统自带的tabbar
//        self.tabBar = [tabbar alloc] init];
//    tabbar *tabBar = [[tabbar alloc] init];
//    tabBar.delegate =self;
//    [self setValue:tabBar forKeyPath:@"tabBar"];
//    HWTabBar *tabBar = [[HWTabBar alloc] init];
//    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    
    
}

-(void)addchildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    //    设置子控制器的文字和图片
        childVC.tabBarItem.title = title;
      //  childVC.navigationItem.title = @"返回";
    //    childVC.navigationItem.title = title;
   // childVC.title = title;//同时设置tabbar和navigationBar的文字
    childVC.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //不让图片进行系统渲染  UIImageRenderingModeAlwaysOriginal
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //    设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    
    selectedTextAttrs[NSForegroundColorAttributeName] = XHColor(31, 41, 48);
    
    textAttrs[NSForegroundColorAttributeName] = XHColor(255, 255, 255);
    
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateSelected];
    
    [childVC.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    //    添加子控制器
    NavigationController *navi = [[NavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:navi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
/*
#pragma mark - HWTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
{
    dateTableViewController *dateVC = [[dateTableViewController alloc] init];
    
    [self.navigationController pushViewController:dateVC animated:YES];
    
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:dateVC];
    [self presentViewController:nav animated:YES completion:nil];
}
*/
//双击tabbarItem返回最上面并且刷新
//-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    if (viewController.tabBarItem.tag == 3) {
//        UINavigationController *navigation =(UINavigationController *)viewController;
//        mailViewController *mailVC = (mailViewController *)navigation.topViewController;
//        [mailVC refresh];
//    }
//}
//禁止tab多次点击
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    UIViewController *tbselect=tabBarController.selectedViewController;
    if([tbselect isEqual:viewController]){
        return NO;
    }
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
