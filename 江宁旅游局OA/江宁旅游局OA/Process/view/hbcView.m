//
//  hbcView.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/18.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "hbcView.h"
#import "customCell.h"
@implementation hbcView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.separatorStyle = UITableViewCellAccessoryNone;
    }
    return self;
}

#pragma mark -- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    customCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[customCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    switch (indexPath.section) {
        case 0:{
            
            [cell setImageViewImage:[UIImage imageNamed:@"processAnnounce"] titleLabelText:@"公 告" detailLabelText:@"共8条数据"];
            
            break;
        }
            
        case 1:{
            [cell setImageViewImage:[UIImage imageNamed:@"meetingRoomReservation"] titleLabelText:@"会议室申请" detailLabelText:@"共10条数据"];
            break;
        }
            
        case 2:{
            [cell setImageViewImage:[UIImage imageNamed:@"fixedAssets"] titleLabelText:@"资产领用" detailLabelText:@"共10条数据"];
            break;
        }
        case 4:{
            [cell setImageViewImage:[UIImage imageNamed:@"askLeave"] titleLabelText:@"请 假" detailLabelText:@"共10条数据"];
            break;
        }
        default:
            break;
        case 3:{
            [cell setImageViewImage:[UIImage imageNamed:@"recipentsAssets"] titleLabelText:@"资产返库" detailLabelText:@"共10条数据"];
            break;
        }
    }
    cell.selectionStyle = NO;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 4) {
        return 10;
    }
    return 0;
}
@end
