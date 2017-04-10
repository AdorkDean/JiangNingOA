//
//  LogCell.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/14.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogCell : UITableViewCell
{
    UILabel *titleLabel;
    UILabel *detailLabel;
    UIImageView *imageView;
    
}

- (void)setImageViewImage:(UIImage *)image titleLabelText:(NSString *)titleLabelText detailLabelText:(NSString *)detailLabelText;
@end
