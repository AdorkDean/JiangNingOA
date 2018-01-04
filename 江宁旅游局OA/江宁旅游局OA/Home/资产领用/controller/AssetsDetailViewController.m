//
//  AssetsDetailViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/12.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "AssetsDetailViewController.h"
#import "zySheetPickerView.h"
@interface AssetsDetailViewController ()<UITextFieldDelegate>
@property (nonatomic ,strong)  UIButton *categoryBtn;
@property (nonatomic ,strong)  UIButton *itemsBtn;
@property (nonatomic ,strong)  UITextView *itemsView;
@property (nonatomic ,strong)  UITextField *numTextField;
@end

@implementation AssetsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"资产领用填写";
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self clickCategoryBtn];
    [self clickItemsBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 7;
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
            cell.imageView.image = [UIImage imageNamed:@"category"];
            cell.textLabel.text = @"类别:";
            [cell.contentView addSubview:_categoryBtn];
            break;
        }
        case 1:{
            cell.imageView.image = [UIImage imageNamed:@"items"];
            cell.textLabel.text = @"物品:";
            [cell.contentView addSubview:_itemsBtn];
            
            break;
        }
        case 2:{
            cell.imageView.image = [UIImage imageNamed:@"number"];
            cell.textLabel.text = @"数量:";
            self.numTextField = [[UITextField alloc] initWithFrame:xjw(110, 0, 250, 44)];
            self.numTextField.placeholder = @"请输入数量";
            self.numTextField.textAlignment = NSTextAlignmentRight;            self.numTextField.keyboardType = UIKeyboardTypeNumberPad;
            [cell.contentView addSubview:self.numTextField];
            break;
        }
        case 3:{
            UIButton *rejectBtn = [[UIButton alloc] initWithFrame:CGRectMake(RELATIVE_WIDTH(40), RELATIVE_HEIGHT(4), RELATIVE_WIDTH(300), RELATIVE_HEIGHT(80))];
            rejectBtn.backgroundColor = XHColor(245, 116, 131);
            [rejectBtn.layer setCornerRadius:8.0];
            [rejectBtn setTitle:@"清      空" forState:UIControlStateNormal];
            [rejectBtn addTarget:self action:@selector(empty) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *allowBtn = [[UIButton alloc] initWithFrame:CGRectMake(rejectBtn.width + RELATIVE_WIDTH(100), RELATIVE_HEIGHT(4), rejectBtn.width, RELATIVE_HEIGHT(80))];
            allowBtn.backgroundColor = XHColor(45, 163, 205);
            [allowBtn.layer setCornerRadius:8.0];
            [allowBtn setTitle:@"添      加" forState:UIControlStateNormal];
            [allowBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:rejectBtn];
            [cell.contentView addSubview:allowBtn];
            
            break;
        }
        case 4:{
            self.itemsView = [[UITextView alloc] initWithFrame:ccr(10, 0, SCREEN_WIDTH - 20, 100)];
            [self.itemsView setEditable:NO];
            
            self.itemsView.layer.backgroundColor = [[UIColor clearColor] CGColor];
            
            self.itemsView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
            
            self.itemsView.layer.borderWidth = 1.0;
            
            self.itemsView.layer.cornerRadius = 8.0f;
            
            [self.itemsView.layer setMasksToBounds:YES];
            
            [cell.contentView addSubview:self.itemsView];
            break;
        }
        case 5:{
            cell.imageView.image = [UIImage imageNamed:@"instructions"];
            cell.textLabel.text = @"说明:";
            UITextView *instruceView = [[UITextView alloc] initWithFrame:ccr(105, 0, 260, 100)];

            instruceView.layer.backgroundColor = [[UIColor clearColor] CGColor];
            
            instruceView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
            
            instruceView.layer.borderWidth = 1.0;
            
            instruceView.layer.cornerRadius = 8.0f;
            
            [instruceView.layer setMasksToBounds:YES];
            [cell.contentView addSubview:instruceView];
            break;
        }
        
        
        case 6:{
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 0, SCREEN_WIDTH - 60, 40)];
            btn.backgroundColor = XHColor(245, 116, 131);
            [btn setTitle:@"提 交 审 核" forState:UIControlStateNormal];
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
    cell.selectionStyle = NO;
    
    return cell;
}

- (void)clickCategoryBtn{
    self.categoryBtn = [[UIButton alloc] initWithFrame:xjw(260, 0, 100, 44)];
    self.categoryBtn.backgroundColor = [UIColor whiteColor];
    [self.categoryBtn setTitle:@"请选择类型" forState: UIControlStateNormal];
    [self.categoryBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.categoryBtn addTarget:self action:@selector(categoryBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)categoryBtnClick{
    NSArray *str = @[@"桌子",@"电脑",@"打印机"];
    zySheetPickerView *pickerView = [zySheetPickerView ZYSheetStringPickerWithTitle:str andHeadTitle:@"类型" Andcall:^(zySheetPickerView *pickerView, NSString *choiceString) {
        [self.categoryBtn setTitle:choiceString forState:UIControlStateNormal];
        [pickerView dismissPicker];
    }];
    [pickerView show];
    
}

- (void)clickItemsBtn{
    self.itemsBtn = [[UIButton alloc] initWithFrame:xjw(260, 0, 100, 44)];
    self.itemsBtn.backgroundColor = [UIColor whiteColor];
    [self.itemsBtn setTitle:@"请选择物品" forState: UIControlStateNormal];
    [self.itemsBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.itemsBtn addTarget:self action:@selector(itemsBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)itemsBtnClick{
    NSArray *str = @[@"桌子",@"电脑",@"打印机"];
    zySheetPickerView *pickerView = [zySheetPickerView ZYSheetStringPickerWithTitle:str andHeadTitle:@"物品名称" Andcall:^(zySheetPickerView *pickerView, NSString *choiceString) {
        [self.itemsBtn setTitle:choiceString forState:UIControlStateNormal];
        [pickerView dismissPicker];
    }];
    [pickerView show];
}
//清空按钮
- (void)empty{
    self.itemsView.text = @"";
}
//添加按钮
- (void)add{
    self.itemsView.text = [NSString stringWithFormat:@"%@×%@ ",self.itemsBtn.titleLabel.text,self.numTextField.text];
}
//提交审核按钮
- (void)clickBtn{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 4) {
        return 100;
    }else if (indexPath.section == 5){
        return 100;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

@end
