//
//  wfaView.h
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/18.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol wfaViewDelegate <NSObject>

- (void)clickWFAsection:(NSIndexPath *)indexpath;

@end

@interface wfaView : UITableView <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,weak) id <wfaViewDelegate> wfaDelegate;

@end
