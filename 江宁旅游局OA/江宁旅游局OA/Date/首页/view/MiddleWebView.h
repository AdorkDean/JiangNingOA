//
//  MiddleWebView.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2017/7/11.
//  Copyright © 2017年 xujw. All rights reserved.
//

#import <WebKit/WebKit.h>
@interface MiddleWebView : WKWebView<WKNavigationDelegate,WKUIDelegate>
@property (nonatomic ,strong)  UIView *opaqueView;
@property (nonatomic ,strong)  UIActivityIndicatorView *activityIndicatorView;
@end
