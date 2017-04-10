//
//  ReturnAssetsViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/27.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "ReturnAssetsViewController.h"
#import "ReturnAssetsListViewController.h"
#import "AuditReturnAssetsListViewController.h"
@interface ReturnAssetsViewController ()

@end

@implementation ReturnAssetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"资产返库";
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    switch (indexPath.section) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"apply"];
            cell.textLabel.text = @"申请记录";
            cell.accessoryType = UITableViewCellStyleValue1;
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"audit"];
            cell.textLabel.text = @"申请审核";
            cell.accessoryType = UITableViewCellStyleValue1;
            break;
        case 2:
            cell.selectionStyle = NO;
            break;
        default:
            break;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            ReturnAssetsListViewController *RASVC = [ReturnAssetsListViewController new];
            [self.navigationController pushViewController:RASVC animated:YES];
        }
            break;
        case 1:{
            AuditReturnAssetsListViewController*ARALVC = [AuditReturnAssetsListViewController new];
            [self.navigationController pushViewController:ARALVC animated:YES];
        }
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
