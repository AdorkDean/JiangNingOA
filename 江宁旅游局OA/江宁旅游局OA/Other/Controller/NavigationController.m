//
//  NavigationController.m
//  物联网后商机管理
//
//  Created by 欣华pro on 16/1/26.
//  Copyright © 2016年 欣华pro. All rights reserved.
//

#import "NavigationController.h"
#import "ItemTool.h"
#import "UIBarButtonItem+Extension.h"
@interface NavigationController ()

@end

@implementation NavigationController

 
+ (void)initialize{


}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
     [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navi"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count  >  0) {//这时push进来的控制器viewcontroller不是第一个子控制器
        //自动现实和隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        //设置导航栏上面的内容
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highlightImage:@"navigationbar_back_highlighted"];
    }
    //把super 这句放下面 可以让viewcontroller可以覆盖上面设置爱的leftBarButtonItem
    [super pushViewController:viewController animated:YES];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
