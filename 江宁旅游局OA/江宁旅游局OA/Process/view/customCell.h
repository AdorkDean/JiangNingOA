//
//  customCell.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/19.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCell : UITableViewCell
{
    UILabel *titleLabel;
    UILabel *detailLabel;
    UIImageView *imageView;
}

- (void)setImageViewImage:(UIImage *)image titleLabelText:(NSString *)titleLabelText detailLabelText:(NSString *)detailLabelText;

@end
