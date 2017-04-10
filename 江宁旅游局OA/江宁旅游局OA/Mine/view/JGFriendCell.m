//
//  JGFriendCell.m
//
//  Created by xinhua on 16/8/14.
//  Copyright © 2016年 JUN. All rights reserved.
//

#import "JGFriendCell.h"
#import "JGFriend.h"
#import "AppConstants.h"
@implementation JGFriendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        iconImageView = [[UIImageView alloc] initWithFrame:ccr(5, 5, 30, 30)];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(GG_RIGHT_X(iconImageView) + 10, 10, 80, 15)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.x, GG_BOTTOM_Y(titleLabel) + 15, 80, 15)];
        detailLabel.font = [UIFont systemFontOfSize:15];
        phoneBtn = [[UIButton alloc] initWithFrame:ccr(SCREEN_WIDTH - 90, 25, 20, 20)];
        messageBtn = [[UIButton alloc] initWithFrame:ccr(SCREEN_WIDTH - 45, 25, 20, 20)];
        [self.contentView addSubview:iconImageView];
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:detailLabel];
        [self.contentView addSubview:phoneBtn];
        [self.contentView addSubview:messageBtn];
    }
    
    
    
    
    return self;
}

/*
- (void)setIconImageViewImage:(UIImage *)iconImage phoneImageViewImage:(UIImage *)phoneImage messageImageViewImage:(UIImage *)messageImage titleLabelText:(NSString *)titleLabelText detailLabelText:(NSString *)detailLabelText{
    iconImageView.image = iconImage;
    titleLabel.text = titleLabelText;
    detailLabel.text = detailLabelText;
    phoneImageView.image = [UIImage imageNamed:@"phone"];
    messageImageView.image = [UIImage imageNamed:@"message"];
}
*/
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"friend";
    JGFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[JGFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



- (void)setFriendData:(JGFriend *)friendData {
    
    _friendData = friendData;
    
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    self.textLabel.text = friendData.name;
    self.textLabel.textColor = [UIColor blackColor];
    self.detailTextLabel.text = friendData.phone;
    
   // phoneBtn.tag = indexPath.row;
    [phoneBtn setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    
    [phoneBtn addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventTouchUpInside];
    [messageBtn setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [messageBtn addTarget:self action:@selector(messageClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)phoneClick:(UIButton *)sender{
    
    mAlertView(@"我是打电话的",@"打电话");
}

- (void)messageClick:(UIButton *)sender{
    mAlertView(@"我是发信息的",@"发信息");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
