//
//  AnnounceADTViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/29.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "AnnounceADTViewController.h"
#import "publicCell.h"
#import "AUdetailViewController.h"
@interface AnnounceADTViewController ()

@end

@implementation AnnounceADTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"公告审核";
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    if (cell == nil) {
        cell = [[publicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSString *titleText = @"公告标题";
    NSString *detailText = [NSString stringWithFormat:@"发布人:%@",@"农好强"];
    [cell setImageViewImage:[UIImage imageNamed:@"processAnnounce"] titleLabelText:titleText detailLabelText:detailText buttonText:@"审  核" target:self buttonAction:@selector(btnClick:)];
    
    return cell;
}

- (void)btnClick:(UIButton *)sender{
         
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AUdetailViewController *AUDVC = [AUdetailViewController new];
    [self.navigationController pushViewController:AUDVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
