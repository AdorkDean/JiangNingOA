//
//  publicCell.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/10.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface publicCell : UITableViewCell
{
    UILabel *titleLabel;
    UILabel *detailLabel;
    UIImageView *imageView;
    
}
@property (nonatomic ,strong)  UIButton *btn;

- (void)setImageViewImage:(UIImage *)image titleLabelText:(NSString *)titleLabelText detailLabelText:(NSString *)detailLabelText buttonText:(NSString *)btnText target:(id)target buttonAction:(SEL)btnClick;
@end
