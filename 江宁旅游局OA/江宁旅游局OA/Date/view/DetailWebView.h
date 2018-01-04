//
//  DetailWebView.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2017/7/12.
//  Copyright © 2017年 xujw. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface DetailWebView : WKWebView <WKUIDelegate,WKNavigationDelegate>
@property (nonatomic ,strong)  UIView *opaqueView;
@property (nonatomic ,strong)  UIActivityIndicatorView *activityIndicatorView;
- (void)loadDataWithURL:(NSURL *)url;
@end
