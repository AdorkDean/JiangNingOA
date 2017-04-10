//
//  LogListViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/14.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "LogListViewController.h"
#import "LogCell.h"
#import "LogDetailViewController.h"
#import "LogEditorViewController.h"
@interface LogListViewController ()

@end

@implementation LogListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"日志列表";
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"写日志" style:UIBarButtonItemStylePlain target:self action:@selector(checkBns)];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [super viewWillAppear:YES];
}

- (void)checkBns{
    LogEditorViewController *LEvc = [LogEditorViewController new];
    [self.navigationController pushViewController:LEvc animated:YES];
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
    LogCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LogCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSString *titleText = @"今天真是忙死了，连习近平都过来找我，真是烦的要死，真不知道该怎么办才好";
    NSString *detailText = @"2016.12.20";
    [cell setImageViewImage:[UIImage imageNamed:@"apply_icon"] titleLabelText:titleText detailLabelText:detailText];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LogDetailViewController *LDVC = [LogDetailViewController new];
    [self.navigationController pushViewController:LDVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
