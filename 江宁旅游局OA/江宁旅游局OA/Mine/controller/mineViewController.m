//
//  mineViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/13.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "mineViewController.h"
#import "loginViewController.h"
#import "mineDetailTableViewController.h"
#import "nameBookTableViewController.h"
#import "remindTableViewController.h"
#import "lockTableViewController.h"
#import "HYAlertView.h"
@interface mineViewController ()

@end

@implementation mineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我 的";
    self.tableView.separatorStyle = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 5;
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
        case 0:{
            UIImage *icon = [UIImage imageNamed:@"userBoy"];
            CGSize itemSize = CGSizeMake(60, 60);
            UIGraphicsBeginImageContextWithOptions(itemSize, NO ,0.0);
            CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
            [icon drawInRect:imageRect];
            cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *user = [defaults objectForKey:@"userName"];
            
            cell.textLabel.text = user;
            cell.textLabel.font = [UIFont systemFontOfSize:20];
             cell.accessoryType = UITableViewCellStyleValue1;
            break;
        }
        case 1:{
            UIImage *icon = [UIImage imageNamed:@"communication"];
            cell.imageView.size = CGSizeMake(30, 30);
            cell.imageView.image = icon;
            cell.textLabel.text = @"通讯录";
            cell.accessoryType = UITableViewCellStyleValue1;
            
            break;
        }
        case 2:{
            UIImage *icon = [UIImage imageNamed:@"remind"];
            cell.imageView.image = icon;
            cell.textLabel.text = @"提醒设置";
            cell.accessoryType = UITableViewCellStyleValue1;
            
            break;
        }
        case 3:{
            UIImage *icon = [UIImage imageNamed:@"equipment"];
            cell.imageView.image = icon;
            cell.textLabel.text = @"设备锁";
            cell.accessoryType = UITableViewCellStyleValue1;
            
            break;
        }
        case 4:{
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 0, SCREEN_WIDTH - 60, 40)];
            btn.backgroundColor = XHColor(245, 116, 131);
            [btn setTitle:@"退 出 登 录" forState:UIControlStateNormal];
            [btn.layer setMasksToBounds:YES];
            [btn.layer setCornerRadius:8.0];
            btn.titleLabel.textColor = [UIColor whiteColor];
            [cell.contentView addSubview:btn];
            [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
        default:
            break;
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)clickBtn{
    HYAlertView *alertView = [[HYAlertView alloc] initWithTitle:@"友情提醒" message:@"确认退出当前用户吗？" buttonTitles:@"取消", @"确定", nil];
    //alertView.alertViewStyle = sender.tag;
    [alertView showWithCompletion:^(HYAlertView *alertView, NSInteger selectIndex) {
        if (selectIndex == 0) {
            // NSLog(@"点击了%d", (int)selectIndex);
        }else if (selectIndex == 1){
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            mineDetailTableViewController *detailVC = [mineDetailTableViewController new];
            [self.navigationController pushViewController:detailVC animated:YES];
            break;
        }
        case 1:{
            nameBookTableViewController *nameVc = [nameBookTableViewController new];
            [self.navigationController pushViewController:nameVc animated:YES];
            break;
        }
        case 2:{
            remindTableViewController *remindVC = [remindTableViewController new];
            [self.navigationController pushViewController:remindVC animated:YES];
            break;
        }
        case 3:{
            lockTableViewController *lockVC = [lockTableViewController new];
            [self.navigationController pushViewController:lockVC animated:YES];
            break;
        }
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }
    return 44;
    
}
@end
