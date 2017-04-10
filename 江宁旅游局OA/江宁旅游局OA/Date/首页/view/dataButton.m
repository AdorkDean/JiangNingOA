//
//  myButton.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/12.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "dataButton.h"

@implementation dataButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return self;
}

//http://m.open-open.com/m/code/view/1421811403312
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    return CGRectMake(0, RELATIVE_HEIGHT(124), self.frame.size.width, RELATIVE_HEIGHT(40));
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.width-RELATIVE_WIDTH(90))/2, RELATIVE_HEIGHT(35) , RELATIVE_WIDTH(90), RELATIVE_HEIGHT(90));
}

@end
