//
//  lockTableViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/8.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "lockTableViewController.h"
#import "LKBubbleView.h"
@interface lockTableViewController ()
@property (nonatomic ,strong)  NSMutableArray *phoneArr;
@end

@implementation lockTableViewController

- (NSMutableArray *)phoneArr{
    if (!_phoneArr) {
        self.phoneArr = [NSMutableArray arrayWithObjects:@"iPhone 6s",@"iPhone 6", nil];
    }
    return _phoneArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.title = @"设备锁";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.phoneArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.phoneArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"iphone"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    // Create label with section title
    UILabel *label=[[UILabel alloc] init];
    label.frame=CGRectMake(5, 2, tableView.bounds.size.width, 20);
    //    label.backgroundColor=[UIColor clearColor];
    label.textColor = [UIColor grayColor];
    label.font=[UIFont boldSystemFontOfSize:10];
    if (section == 0) {
        label.text = @"左滑删除设备";
    }
    
    // Create header view and add label as a subview
    UIView *sectionView=[[UIView alloc] initWithFrame:CGRectMake(5, 5, tableView.bounds.size.width, 20)];
    sectionView.backgroundColor = XHColor(235, 235, 241);
    [sectionView addSubview:label];
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
//左滑删除
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//进入编辑模式，按下出现的编辑按钮后
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  WS(weakself);
    [tableView setEditing:NO animated:YES];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"你确定删除该设备" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
                UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
            
                [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                    textField.placeholder = @"请输入密码";
                    textField.textColor = [UIColor blackColor];
//                  textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//                  textField.borderStyle = UITextBorderStyleRoundedRect;
                    textField.secureTextEntry = YES;
                }];
                [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    NSArray *pwdArr = alertView.textFields;
                    NSLog(@"%@",pwdArr);
                    NSString *pwd = pwdArr[0];
                    NSLog(@"这是字符串嘛%@",pwd);
                    if ([pwd isEqual:@"123456"]) {
                        [self.phoneArr removeObjectAtIndex:indexPath.row];
                        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                    }else{
                        LKBubbleInfo *iconInfo = [[LKBubbleInfo alloc] init];
                        // 把图标数组里面设置只有一张图片即可单图固定图标
                        iconInfo.iconArray = @[[UIImage imageNamed: @"lkbubble-warning"]];
                        iconInfo.backgroundColor = [UIColor colorWithRed: 0.95 green:0.95 blue:0.95 alpha:1];
                        iconInfo.titleColor = [UIColor darkGrayColor];
                        iconInfo.locationStyle = BUBBLE_LOCATION_STYLE_BOTTOM;
                        iconInfo.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_LEFT_TITLE_RIGHT;
                        iconInfo.title = @"密码输入错误！";
                        iconInfo.proportionOfDeviation = 0.05;
                        iconInfo.bubbleSize = CGSizeMake(150, 30);
                        [[LKBubbleView defaultBubbleView] showWithInfo: iconInfo autoCloseTime: 2];
                        
                    }
                    
                }]];
            
                [alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            
                [self presentViewController:alertView animated:YES completion:nil];
            }]];
            
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

//修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}


//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end
