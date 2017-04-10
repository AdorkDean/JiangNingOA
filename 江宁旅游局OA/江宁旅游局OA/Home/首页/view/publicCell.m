//
//  publicCell.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/10.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "publicCell.h"
#import "AppConstants.h"
@implementation publicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(GG_RIGHT_X(imageView) + 10, 10, 300, 15)];
        titleLabel.font = [UIFont systemFontOfSize:15];
        detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.x, GG_BOTTOM_Y(titleLabel) + 13, 200, 13)];
        detailLabel.font = [UIFont systemFontOfSize:13];
        
        _btn = [[UIButton alloc] initWithFrame:ccr(SCREEN_WIDTH - 75, 27, 60, 20)];
        _btn.backgroundColor = XHColor(239, 91, 112);
        _btn.tintColor = [UIColor whiteColor];
        _btn.titleLabel.font = [UIFont systemFontOfSize:10];
        _btn.layer.cornerRadius = 5.0;
//        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:imageView];
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:detailLabel];
        [self.contentView addSubview:_btn];
    }
    return self;
}




- (void)setImageViewImage:(UIImage *)image titleLabelText:(NSString *)titleLabelText detailLabelText:(NSString *)detailLabelText buttonText:(NSString *)btnText target:(id)target buttonAction:(SEL)btnClick{
    imageView.image = image;
    titleLabel.text = titleLabelText;
    detailLabel.text = detailLabelText;
    [_btn  addTarget:target action:btnClick forControlEvents:UIControlEventTouchUpInside];
    [_btn setTitle:btnText forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
