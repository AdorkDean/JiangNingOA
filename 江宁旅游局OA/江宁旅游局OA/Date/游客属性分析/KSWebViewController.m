//
//  KSWebViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2017/1/3.
//  Copyright © 2017年 xujw. All rights reserved.
//

#import "KSWebViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "dataDropDownView.h"
#import "DropViewController.h"
#import "DetailWebView.h"
@interface KSWebViewController ()<dataDropDownViewDelegate>
@property (nonatomic ,strong)  DetailWebView *webView;
@property (nonatomic ,strong)  UIView *opaqueView;
@property (nonatomic ,strong)  UIActivityIndicatorView *activityIndicatorView;
@end

@implementation KSWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"游客属性分析";
    [self creatWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop:) image:@"map"highlightImage:@"map_selected"];
}

- (void)pop:(UIButton *)sender{
    //1.创建下拉菜单
    dataDropDownView *dropView = [dataDropDownView view];
    dropView.delegate = self;
    //2.设置内容
    DropViewController *vc = [DropViewController new];
    vc.view.height = 180;
    vc.view.width = 200;
    dropView.contentController = vc;
    //3.显示
    [dropView showFrom:sender];
}

/**
 *  下拉菜单被销毁了
 */
- (void)dataDropDownViewDidShow:(dataDropDownView *)view
{
    
}

/**
 *  下拉菜单显示了
 */
- (void)dataDropDownViewDidDissmiss:(dataDropDownView *)view
{
    
}

- (void)creatWebView{
    DetailWebView *webView = [[DetailWebView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    NSURL *url = [NSURL URLWithString:@"https://baidu.com/"];
    [webView loadDataWithURL:url];
    [self.view addSubview:webView];
    self.webView = webView;
}

@end
