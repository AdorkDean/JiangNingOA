//
//  nameBookTableViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/3.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "nameBookTableViewController.h"
#import "JGFriend.h"
#import "JGFriendGroup.h"
#import "JGFriendCell.h"
#import "JGHeaderView.h"
#import "AppConstants.h"
@interface nameBookTableViewController ()<JGHeaderViewDelegate>
@property (nonatomic, strong) NSArray *groups;
@end

@implementation nameBookTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //每一行cell 的高度
  //  self.tableView.rowHeight = 50;
    //每一组头部控件的高度
   // self.tableView.sectionHeaderHeight = 44;
    
    self.navigationItem.title = @"通讯录";
}

- (void)viewWillAppear:(BOOL)animated{
     [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (NSArray *)groups {
    
    if (!_groups) {
        
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
        NSMutableArray *groupArr = [NSMutableArray array];
        for (NSDictionary *dict in dictArr) {
            JGFriendGroup *group = [JGFriendGroup groupWithDict:dict];
            [groupArr addObject:group];
        }
        _groups = groupArr;
    }
    return _groups;
}
//是否隐藏状态栏（草泥马找半天）
- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark - 数据源方法 -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    JGFriendGroup *group = self.groups[section];
    return (group.isOpend ? group.friends.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //1. 创建cell
    JGFriendCell *cell = [JGFriendCell cellWithTableView:tableView];
    
    //2. 设置cell的数据
    JGFriendGroup *group = self.groups[indexPath.section];
    cell.friendData = group.friends[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    //1. 创建头部控件
    JGHeaderView *header = [JGHeaderView headerViewWithTableView:tableView];
    header.delegate = self;
    
    //2. 给header设置数据（传模型）
    header.group = self.groups[section];
    
    //    NSLog(@"%p  - %ld",header, (long)section);
    
    return header;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

#pragma mark - JGHeaderView代理方法
- (void)headerViewDidClickedNameView:(JGHeaderView *)headerView {
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
