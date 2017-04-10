//
//  MeetingAuditViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/12.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "MeetingAuditViewController.h"
#import "AppConstants.h"
#import "sectionView.h"
@interface MeetingAuditViewController ()<UITextViewDelegate>
@property (nonatomic ,strong)  UITableView *auditTextView;
@end

@implementation MeetingAuditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"会议室申请审核";
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

    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    switch (indexPath.section) {
        case 0:{
            cell.imageView.image = [UIImage imageNamed:@"time"];
            cell.textLabel.text = @"时间:";
            UILabel *timeLab = [[UILabel alloc] initWithFrame:xjw(105, 0, 260, 44)];
            NSString *timeStr = [NSString stringWithFormat:@"%@ - %@",@"12.04 12:12",@"12.04 12:30"];
            timeLab.text = timeStr;
            [cell.contentView addSubview:timeLab];
            break;
        }
        case 1:{
            cell.imageView.image = [UIImage imageNamed:@"place"];
            cell.textLabel.text = @"地点:";
            UILabel *placeLab = [[UILabel alloc] initWithFrame:xjw(105, 0, 260, 44)];
            placeLab.text = @"三楼会议室";
            [cell.contentView addSubview:placeLab];
            break;
        }
        case 2:{
            cell.imageView.image = [UIImage imageNamed:@"peopleNum"];
            cell.textLabel.text = @"人数:";
            UILabel *peopleLab = [[UILabel alloc] initWithFrame:xjw(105, 0, 260, 44)];
            peopleLab.text = @"10";
            [cell.contentView addSubview:peopleLab];
            break;
        }
        case 3:{
            cell.imageView.image = [UIImage imageNamed:@"main"];
            cell.textLabel.text = @"主题:";
            UILabel *mainLab = [[UILabel alloc] initWithFrame:xjw(105, 0, 260, 44)];
            mainLab.text = @"会议主题";
            [cell.contentView addSubview:mainLab];
            break;
        }
        case 4:{
            
            break;
        }
        case 5:{
            UIButton *rejectBtn = [[UIButton alloc] initWithFrame:CGRectMake(RELATIVE_WIDTH(40), RELATIVE_HEIGHT(4), RELATIVE_WIDTH(300), RELATIVE_HEIGHT(80))];
            rejectBtn.backgroundColor = XHColor(245, 116, 131);
            [rejectBtn.layer setCornerRadius:8.0];
            [rejectBtn setTitle:@"驳      回" forState:UIControlStateNormal];
            [rejectBtn addTarget:self action:@selector(reject:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *allowBtn = [[UIButton alloc] initWithFrame:CGRectMake(rejectBtn.width + RELATIVE_WIDTH(100), RELATIVE_HEIGHT(4), rejectBtn.width, RELATIVE_HEIGHT(80))];
            allowBtn.backgroundColor = XHColor(45, 163, 205);
            [allowBtn.layer setCornerRadius:8.0];
            [allowBtn setTitle:@"通      过" forState:UIControlStateNormal];
            [allowBtn addTarget:self action:@selector(allow:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:rejectBtn];
            [cell.contentView addSubview:allowBtn];
            break;
        }
        default:
            break;
    }
    cell.selectionStyle = NO;
    return cell;
}

- (void)reject:(UIButton *)sender{
    
}

- (void)allow:(UIButton *)sender{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 4) {
        return 20;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 4) {
        return 200;
    }
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 4) {
        sectionView *secView = [sectionView new];
        [secView setLabelText:@"审批意见"];
        return secView;
    }
    return NULL;
}

//点击return 按钮 去掉
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.auditTextView resignFirstResponder];
    return YES;
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   [self.auditTextView resignFirstResponder];
}

@end
