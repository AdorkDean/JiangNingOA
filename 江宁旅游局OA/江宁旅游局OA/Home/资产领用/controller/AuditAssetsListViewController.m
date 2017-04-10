//
//  AuditAssetsListViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/12.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "AuditAssetsListViewController.h"
#import "publicCell.h"
#import "AuditAssetsViewController.h"
@interface AuditAssetsListViewController ()

@end

@implementation AuditAssetsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"领用审核列表";
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

    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    publicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell ==nil) {
        cell = [[publicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSString *titleText = [NSString stringWithFormat:@"申领物品:%@",@"桌子，椅子"];
    NSString *detailText = [NSString stringWithFormat:@"申领时间:%@",@"2016-10-21 9:00 - 10:00"];
    [cell setImageViewImage:[UIImage imageNamed:@"apply_icon"] titleLabelText:titleText detailLabelText:detailText buttonText:@"审   核" target:self buttonAction:@selector(btnClick)];
    
    return cell;
}

- (void)btnClick{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AuditAssetsViewController *AAvc = [AuditAssetsViewController new];
    [self.navigationController pushViewController:AAvc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
