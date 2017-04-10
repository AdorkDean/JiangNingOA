//
//  hbcView.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/18.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol hbcViewDelegate <NSObject>

- (void)clickHBCsection:(NSIndexPath *)indexpath;

@end

@interface hbcView : UITableView <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,weak) id <hbcViewDelegate>hbcDelegate;

@end
