//
//  LogCell.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/14.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "LogCell.h"
@implementation LogCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(GG_RIGHT_X(imageView) + 10, 10, 300, 15)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.x, GG_BOTTOM_Y(titleLabel) + 13, 200, 13)];
        detailLabel.font = [UIFont systemFontOfSize:13];
        
        
        [self.contentView addSubview:imageView];
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:detailLabel];
    }
    return self;
}


- (void)setImageViewImage:(UIImage *)image titleLabelText:(NSString *)titleLabelText detailLabelText:(NSString *)detailLabelText{
    imageView.image = image;
    titleLabel.text = titleLabelText;
    detailLabel.text = detailLabelText;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
