//
//  JWWebViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2017/1/3.
//  Copyright © 2017年 xujw. All rights reserved.
//

#import "JWWebViewController.h"
#import "AppConstants.h"
#import "UIBarButtonItem+Extension.h"
@interface JWWebViewController ()<UIWebViewDelegate>
@property (nonatomic ,strong)  UIWebView *webView;
@property (nonatomic ,strong)  UIView *opaqueView;
@property (nonatomic ,strong)  UIActivityIndicatorView *activityIndicatorView;
@end

@implementation JWWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"境外游客分析";
    [self creatWebView];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)pop{
    
}

- (void)creatWebView{
    _webView = [[UIWebView alloc]initWithFrame:ccr(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_webView setUserInteractionEnabled:YES];//是否支持交互
    _webView.delegate=self;
    _webView.scrollView.bounces = NO;
    [_webView setOpaque:NO];//opaque是不透明的意思
    [_webView setScalesPageToFit:YES];//自动缩放以适应屏幕
    [self.view addSubview:_webView];
    
    
    //加载网页的方式
    //1.创建并加载远程网页
    NSURL *url = [NSURL URLWithString:HTTP_CONECT(HTML_URL, @"/jwyk")];
    // NSURL *url = [NSURL URLWithString:@"https://baidu.com/"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    //2.加载本地文件资源
    // NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    //3.读入一个HTML，直接写入一个HTML代码
    //NSString *htmlPath = [[[NSBundle mainBundle]bundlePath]stringByAppendingString:@"webapp/loadar.html"];
    //NSString *htmlString = [NSString stringWithContentsOfURL:htmlPath encoding:NSUTF8StringEncoding error:NULL];
    //[webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:htmlPath]];
    
    _opaqueView = [[UIView alloc]initWithFrame:ccr(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:ccr(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_activityIndicatorView setCenter:_opaqueView.center];
    [_activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [_opaqueView setBackgroundColor:XHColor(245, 245, 245)];
    //[_opaqueView setAlpha:0.2];
    [self.webView addSubview:_opaqueView];
    [_opaqueView addSubview:_activityIndicatorView];
    
    
    
}

#pragma mark -- WebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIndicatorView startAnimating];
    _opaqueView.hidden = NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicatorView startAnimating];
    _opaqueView.hidden = YES;
}

@end
