//
//  LogEditorViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/22.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "LogEditorViewController.h"
#import "AppConstants.h"
@interface LogEditorViewController ()<UITextViewDelegate>
@property (nonatomic ,strong)  UITextView *detailTextView;
@property (nonatomic ,strong)  UILabel *placeholder;

@end

@implementation LogEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"日志详情";
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
    return 4;
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
            cell.textLabel.text = @"日期:";
            
            UILabel *dateLab = [[UILabel alloc] initWithFrame:xjw(105, 0, 200, 44)];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM月dd日"];
            NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
            dateLab.text = dateString;
            [cell.contentView addSubview:dateLab];
            break;
        }
        case 1:{
            cell.imageView.image = [UIImage imageNamed:@"apply_icon"];
            cell.textLabel.text = @"日志内容";
            break;
        }
        case 2:{
            self.detailTextView = [[UITextView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, 100)];
            
            self.detailTextView.font = [UIFont systemFontOfSize:15];
            
            self.placeholder = [[UILabel alloc]initWithFrame:CGRectMake(3, 3, 200, 25)];
            self.placeholder.enabled = NO;
            self.placeholder.text = @"请输入日志内容";
            self.placeholder.font =  [UIFont systemFontOfSize:12];
            self.placeholder.textColor = XHColor(199, 200, 201);
            self.detailTextView.delegate = self;
            [self.detailTextView addSubview:self.placeholder];
            
            [cell.contentView addSubview:self.detailTextView];
            
            break;
        }
        case 3:{
            UIButton *saveBtn = [[UIButton alloc] initWithFrame:xjw(20, 0, 335, 44)];
            saveBtn.backgroundColor = XHColor(45, 163, 205);
            [saveBtn.layer setCornerRadius:8.0];
            [saveBtn setTitle:@"保      存" forState:UIControlStateNormal];
            [saveBtn addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:saveBtn];
            break;
        }
        default:
            break;
    }
    cell.selectionStyle = NO;
    return cell;
}

- (void)save:(UIButton *)sender{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 0;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return 200;
    }
    return 44;
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.detailTextView resignFirstResponder];
}

- (void) textViewDidChange:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [self.placeholder setHidden:NO];
    }else{
        [self.placeholder setHidden:YES];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
