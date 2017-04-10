//
//  XjwDatePickerView.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/7.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XjwDatePickerView;

typedef void(^XjwDatePickerViewBlock)(XjwDatePickerView *datePickerView,NSString *choiceString);

@interface XjwDatePickerView : UIView
@property (nonatomic ,copy)  XjwDatePickerViewBlock callBack;


//@property (nonatomic ,copy)  NSString *province;
//@property (nonatomic ,strong)  NSDate *curDate;

+ (instancetype)XjwDatePickerWithHeadTitle:(NSString *)headTitle AndCall:(XjwDatePickerViewBlock)callBack;

//显示
-(void)show;
//销毁类
-(void)dismissPicker;

//- (void)showInView:(UIView *)view;
//- (void)hiddenPickerView;

@end
