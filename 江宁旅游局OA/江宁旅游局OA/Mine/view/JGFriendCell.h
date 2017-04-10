//
//  JGFriendCell.h
//  QQ列表
//
//  Created by xinhua on 16/8/14.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGFriend;

@interface JGFriendCell : UITableViewCell

{
    UILabel *titleLabel;
    UILabel *detailLabel;
    UIImageView *iconImageView;
    UIButton *phoneBtn;
    UIButton *messageBtn;
}
/*
- (void)setIconImageViewImage:(UIImage *)iconImage phoneImageViewImage:(UIImage *)phoneImage messageImageViewImage:(UIImage *)messageImage titleLabelText:(NSString *)titleLabelText detailLabelText:(NSString *)detailLabelText;
*/
+ (instancetype)cellWithTableView:(UITableView *)tableView;

// friend是C++的关键字,不能用friend作为属性名
/** 模型  */
@property (nonatomic, strong)JGFriend *friendData;

@end
