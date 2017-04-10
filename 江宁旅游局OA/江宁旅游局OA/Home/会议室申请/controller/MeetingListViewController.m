//
//  MeetingListViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/2.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "MeetingListViewController.h"
#import "publicCell.h"
#import "MTREditViewController.h"
@interface MeetingListViewController ()

@end

@implementation MeetingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"会议室申请列表";
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"申请" style:UIBarButtonItemStylePlain target:self action:@selector(checkBtn)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [super viewWillAppear:YES];
}

- (void)checkBtn{
    MTREditViewController *mtreVC = [MTREditViewController new];
    [self.navigationController pushViewController:mtreVC animated:YES];
    
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
    cell.tag = indexPath.section;
    NSString *titleText = [NSString stringWithFormat:@"地点:%@",@"三楼会议室"];
    NSString *detailText = [NSString stringWithFormat:@"时间:%@",@"2016-10-21 9:00 - 10:00"];
    SEL btnClick = @selector(btnClick);
    [cell setImageViewImage:[UIImage imageNamed:@"apply_icon"] titleLabelText:titleText detailLabelText:detailText buttonText:@"提交审核" target:self buttonAction:btnClick];
    return cell;
}

- (void)btnClick{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MTREditViewController *mtreVC = [MTREditViewController new];
    [self.navigationController pushViewController:mtreVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
