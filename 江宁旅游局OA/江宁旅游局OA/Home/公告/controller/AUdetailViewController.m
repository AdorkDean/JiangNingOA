//
//  AUdetailViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/30.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "AUdetailViewController.h"
#import "sectionView.h"
#import "IHKeyboardAvoiding.h"
@interface AUdetailViewController ()<UITextViewDelegate>
@property (nonatomic ,strong)  UITextView *detailTextView;
@end

@implementation AUdetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公告审核";
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

    return 5;
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
        case 0:
            cell.textLabel.text = @"公告标题";
            break;
        case 1:
            cell.textLabel.text = @"科室公告";
            break;
        case 2:{
            UITextView *detailTextView = [[UITextView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, 200)];
            
            detailTextView.font = [UIFont systemFontOfSize:20];
            detailTextView.text = @"这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告";
            detailTextView.editable = NO;
            [cell.contentView addSubview:detailTextView];
            break;
        }
        case 3:{
            self.detailTextView.delegate = self;
           // [IHKeyboardAvoiding setAvoidingView:self.view withTarget:self.detailTextView];
            self.detailTextView = [[UITextView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, 100)];
            
            self.detailTextView.font = [UIFont systemFontOfSize:20];
            [cell.contentView addSubview:self.detailTextView];
            break;
        }
        case 4:{
            
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
        }
            break;
            
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:{
            return 44;
            break;
        }
        case 1:{
            return 44;
            break;
        }
        case 2:
            return 200;
            break;
        case 3:
            return 100;
            break;
        default:
            break;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:{
            sectionView *secView = [sectionView new];
            [secView setLabelText:@"公告标题"];
            return secView;
            break;
        }
        case 1:{
            sectionView *secView = [sectionView new];
            [secView setLabelText:@"公告类型"];
            return secView;
            break;
        }
        case 2:{
            sectionView *secView = [sectionView new];
            [secView setLabelText:@"公告内容"];
            return secView;
            break;
        }
        case 3:{
            sectionView *secView = [sectionView new];
            [secView setLabelText:@"审批意见"];
            return secView;
            break;
        }
        default:
            return NULL;
            break;
    }
/*
    // Create label with section title
    UILabel *label=[[UILabel alloc] init];
    label.frame=CGRectMake(5, 2, tableView.bounds.size.width, 20);
    //    label.backgroundColor=[UIColor clearColor];
    label.textColor = [UIColor grayColor];
    label.font=[UIFont boldSystemFontOfSize:10];
    if (section == 0) {
        label.text = @"公告标题";
    }
    
    // Create header view and add label as a subview
    UIView *sectionView=[[UIView alloc] initWithFrame:CGRectMake(5, 5, tableView.bounds.size.width, 20)];
    sectionView.backgroundColor = XHColor(235, 235, 241);
    [sectionView addSubview:label];
    return sectionView;
*/
}

//点击return 按钮 去掉键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.detailTextView resignFirstResponder];
    return YES;
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.detailTextView resignFirstResponder];
}


@end
