//
//  announceTableViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/10.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "announceTableViewController.h"
#import "publicCell.h"
#import "AnnounceADTViewController.h"
#import "AnDetailViewController.h"
@interface announceTableViewController ()

@end

@implementation announceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公告列表";
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = XHColor(224, 224, 224);
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"审核" style:UIBarButtonItemStylePlain target:self action:@selector(checkBns)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [super viewWillAppear:YES];
}

- (void)checkBns{
    AnnounceADTViewController *AnAdtVC = [AnnounceADTViewController new];
    [self.navigationController pushViewController:AnAdtVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    publicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[publicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.btn.tag = indexPath.row;
    NSString *titleText = @"公告标题";
    NSString *detailText = [NSString stringWithFormat:@"发布人:%@",@"农好强"];
    [cell setImageViewImage:[UIImage imageNamed:@"processAnnounce"] titleLabelText:titleText detailLabelText:detailText buttonText:@"提交审核" target:self buttonAction:@selector(btnClick:)];
    return cell;
    
}

//点击cell当中的按钮来跳转页面，跟点击cell的效果是一样的
- (void)btnClick:(UIButton *)sender{
    AnDetailViewController *detailVC = [AnDetailViewController new];
//    bnsSubModel *newModel = self.bnsSubArr[sender.tag];
//    exVC.buziId  = newModel.buziId;
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AnDetailViewController *detailVC = [AnDetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

@end
