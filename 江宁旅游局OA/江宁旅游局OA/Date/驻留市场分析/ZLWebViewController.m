//
//  ZLWebViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2017/1/3.
//  Copyright © 2017年 xujw. All rights reserved.
//

#import "ZLWebViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "DetailWebView.h"
@interface ZLWebViewController ()
@property (nonatomic ,strong)  DetailWebView *webView;
@property (nonatomic ,strong)  UIView *opaqueView;
@property (nonatomic ,strong)  UIActivityIndicatorView *activityIndicatorView;

@end

@implementation ZLWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"驻留时长分析";
    [self creatWebView];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) image:@"map" highlightImage:@"map_selected"];
}

- (void)pop{
    
}

- (void)creatWebView{
    DetailWebView *webView = [[DetailWebView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    NSURL *url = [NSURL URLWithString:@"https://baidu.com/"];
    [webView loadDataWithURL:url];
    [self.view addSubview:webView];
    self.webView = webView;
}

@end
