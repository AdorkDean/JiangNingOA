//
//  adwView.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/18.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol adwViewDelegate <NSObject>

- (void)clickADWsection:(NSIndexPath *)indexpath;

@end

@interface adwView : UITableView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,weak) id <adwViewDelegate> adwDelegate;

@end
