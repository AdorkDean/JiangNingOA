//
//  AuditAssetsViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/12.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "AuditAssetsViewController.h"
#import "sectionView.h"
#import "IHKeyboardAvoiding.h"
@interface AuditAssetsViewController ()<UITextViewDelegate>
@property (nonatomic ,strong)  UITextView *detailTextView;
@property (nonatomic ,strong)  UILabel *placeholder;
@end

@implementation AuditAssetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"申领审核";
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)viewWillAppear:(BOOL)animated{
    //[IHKeyboardAvoiding setAvoidingView:self.view withTarget:self.detailTextView];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    switch (indexPath.section) {
        case 0:{
            cell.imageView.image = [UIImage imageNamed:@"items"];
            cell.textLabel.text = @"物品:";
            UITextView *itemsView = [[UITextView alloc] initWithFrame:ccr(105, 0, 260, 100)];
            [itemsView setEditable:NO];
            /*
            itemsView.layer.backgroundColor = [[UIColor clearColor] CGColor];
            
            itemsView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
            
            itemsView.layer.borderWidth = 1.0;
            
            itemsView.layer.cornerRadius = 8.0f;
            
            [itemsView.layer setMasksToBounds:YES];
           */
            [cell.contentView addSubview:itemsView];
        
            break;
        }
        case 1:
        {
            cell.imageView.image = [UIImage imageNamed:@"instructions"];
            cell.textLabel.text = @"说明:";
            UITextView *instruceView = [[UITextView alloc] initWithFrame:ccr(105, 0, 260, 100)];
            [instruceView setEditable:NO];
            /*
            instruceView.layer.backgroundColor = [[UIColor clearColor] CGColor];
            
            instruceView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
            
            instruceView.layer.borderWidth = 1.0;
            
            instruceView.layer.cornerRadius = 8.0f;
            
            [instruceView.layer setMasksToBounds:YES];
            */
            [cell.contentView addSubview:instruceView];
            break;
        }
        case 2:{
            cell.imageView.image = [UIImage imageNamed:@"person"];
            cell.textLabel.text = @"申领人:";
            UILabel *personLab = [[UILabel alloc] initWithFrame:xjw(120, 0, 260, 44)];
            personLab.text = @"农好帅";
            [cell.contentView addSubview:personLab];
            break;
        }
        case 3:{
            
            self.detailTextView = [[UITextView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, 100)];
            
            self.detailTextView.font = [UIFont systemFontOfSize:15];
            
            self.placeholder = [[UILabel alloc]initWithFrame:CGRectMake(3, 3, 200, 25)];
            self.placeholder.enabled = NO;
            self.placeholder.text = @"请输入审核意见"; 
            self.placeholder.font =  [UIFont systemFontOfSize:12];
            self.placeholder.textColor = XHColor(199, 200, 201);
            self.detailTextView.delegate = self;
            [self.detailTextView addSubview:self.placeholder];
            
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
            break;
        }
        default:
            break;
    }
    cell.selected = NO;
    return cell;
}

- (void)reject:(UIButton *)sender{
    
}

- (void)allow:(UIButton *)sender{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 100;
            break;
        case 1:
            return 100;
            break;
        case 3:
            return 100;
            break;
        default:
            return 44;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        return 20;
    }
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        sectionView *secView = [sectionView new];
        [secView setLabelText:@"审批意见"];
        return secView;
    }
    return NULL;
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
