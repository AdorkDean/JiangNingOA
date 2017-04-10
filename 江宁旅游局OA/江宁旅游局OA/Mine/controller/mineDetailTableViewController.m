//
//  mineDetailTableViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/3.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "mineDetailTableViewController.h"
#import "AppConstants.h"
@interface mineDetailTableViewController ()
@property (nonatomic ,strong)  NSArray *detailArr;
@end

@implementation mineDetailTableViewController

- (NSArray *)detailArr{
    if (!_detailArr) {
        _detailArr = @[@"姓名",@"手机",@"性别",@"部门",@"职务",@""];
    }
    return _detailArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.title = @"个人详情";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        NSArray *section1 = [self.detailArr subarrayWithRange:NSMakeRange(0, 3)];
        cell.textLabel.text = section1[indexPath.row];

    }else if (indexPath.section == 1){
        NSArray *section2 = [self.detailArr subarrayWithRange:NSMakeRange(3, 2)];
        cell.textLabel.text = section2[indexPath.row];
    }
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
