//
//  WebView.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2017/7/11.
//  Copyright © 2017年 xujw. All rights reserved.
//

#import "MiddleWebView.h"
@implementation MiddleWebView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self setUIDelegate:self];
        [self setNavigationDelegate:self];
        [self setMultipleTouchEnabled:YES];
        [self setAutoresizesSubviews:YES];
        [self.scrollView setAlwaysBounceVertical:YES];
        // 这行代码可以是侧滑返回webView的上一级，而不是跟控制器（*指针对侧滑有效）
        [self setAllowsBackForwardNavigationGestures:true];
        [self loadDate];
    }
    return self;
}

- (void)loadDate{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [self loadRequest:[NSURLRequest requestWithURL:url]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self loadRequest:request];
    
    _opaqueView = [[UIView alloc]initWithFrame:self.bounds];
    _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:self.bounds];
    [_activityIndicatorView setCenter:_opaqueView.center];
    [_activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [_opaqueView setBackgroundColor:XHColor(245, 245, 245)];
    //[_opaqueView setAlpha:0.2];
    [self addSubview:_opaqueView];
    [_opaqueView addSubview:_activityIndicatorView];
}

#pragma mark -- WKUIDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [_activityIndicatorView startAnimating];
    _opaqueView.hidden = NO;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [_activityIndicatorView stopAnimating];
    _opaqueView.hidden = YES;
}

-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}


- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}
@end
