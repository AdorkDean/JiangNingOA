//
//  sectionView.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/1.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "sectionView.h"
#import "AppConstants.h"
@implementation sectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        label = [[UILabel alloc] initWithFrame:ccr(5, 0, SCREEN_WIDTH, 20)];
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor grayColor];
        label.font=[UIFont boldSystemFontOfSize:10];
        
        self.frame = ccr(5, 5, SCREEN_WIDTH, 20);
        self.backgroundColor = XHColor(235, 235, 241);
        [self addSubview:label];
    }
    
    return self;
}


- (void)setLabelText:(NSString *)labelText{
    label.text = labelText;
}

@end
