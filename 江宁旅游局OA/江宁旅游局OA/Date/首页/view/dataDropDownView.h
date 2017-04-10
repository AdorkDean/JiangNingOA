//
//  dataDropDownView.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2017/1/4.
//  Copyright © 2017年 xujw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class dataDropDownView;

@protocol dataDropDownViewDelegate <NSObject>

@optional

- (void)dataDropDownViewDidDissmiss:(dataDropDownView *)view;

- (void)dataDropDownViewDidShow:(dataDropDownView *)view;

@end

@interface dataDropDownView : UIView

@property (nonatomic ,weak) id<dataDropDownViewDelegate> delegate;

+ (instancetype)view;

/**
 *  显示
 */
- (void)showFrom:(UIView *)from;
/**
 *  销毁
 */
- (void)dismiss;
/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;
/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;

@end
