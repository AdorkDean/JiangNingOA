//
//  MTREditViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/12/6.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "MTREditViewController.h"
#import "AppConstants.h"
#import "XjwDatePickerView.h"
@interface MTREditViewController ()<UITextFieldDelegate>
@property (nonatomic ,strong)  UIButton *startBtn;
@property (nonatomic ,strong)  UIButton *endBtn;
@property (nonatomic, strong) NSString *startDataString;
@property (nonatomic, strong) NSString *endDataString;
@property (nonatomic ,strong)  UITextField *placeTextField;
@property (nonatomic ,strong)  UITextField *peopleTextField;
@property (nonatomic ,strong)  UITextField *mainTextField;
@end

@implementation MTREditViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"会议室申请";
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
/*
//开始编辑
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    [_startCuiPickerView showInView:self.view];
    //[_endCuiPickerView showInView:self.view];
}

//赋值给textField
-(void)didFinishPickView:(NSString *)date
{

        self.startDataString = date;
        _startTextField.text = date;
    
//    self.endDataString = date;
//    _endTextField.text = date;
}
*/

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
            case 0:{
                cell.imageView.image = [UIImage imageNamed:@"time"];
                cell.textLabel.text = @"时间:";
                
                self.startBtn = [[UIButton alloc] initWithFrame:xjw(110, 1, 100, 44)];
                self.startBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.startBtn setTitle:@"开始时间" forState:UIControlStateNormal];
                [self.startBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self.startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
                
                self.endBtn = [[UIButton alloc] initWithFrame:xjw(230, 1, 100, 44)];
                self.endBtn.titleLabel.font = [UIFont systemFontOfSize:15];
                [self.endBtn setTitle:@"结束时间" forState:UIControlStateNormal];
                [self.endBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self.endBtn addTarget:self action:@selector(endBtnClick) forControlEvents:UIControlEventTouchUpInside];
  /*
                _startCuiPickerView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 250);
                _endCuiPickerView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 250);
                [_startCuiPickerView setTitleLabText:@"开始时间"];
                [_endCuiPickerView setTitleLabText:@"结束时间"];
                
                _startCuiPickerView.myTextField = _startTextField;
                _endCuiPickerView.myTextField = _endTextField;
                
                _startCuiPickerView.delegate = self;
                _startCuiPickerView.curDate = [NSDate date];
                [self.view addSubview:_startCuiPickerView];
                
                _endCuiPickerView.delegate = self;
                _endCuiPickerView.curDate = [NSDate date];
                [self.view addSubview:_endCuiPickerView];
  */
                
                UIView *lineView = [[UIView alloc] initWithFrame:xjw(215, 21.5, 10, 1)];
                lineView.backgroundColor = [UIColor grayColor];
                
                
                [cell.contentView addSubview:self.startBtn];
                [cell.contentView addSubview:lineView];
                [cell.contentView addSubview:self.endBtn];
                break;
            }
            case 1:{
                cell.imageView.image = [UIImage imageNamed:@"place"];
                cell.textLabel.text = @"地点:";
                UITextField *placeTextField = [[UITextField alloc] initWithFrame:ccr(RELATIVE_WIDTH(220), RELATIVE_HEIGHT(2), RELATIVE_WIDTH(500), RELATIVE_WIDTH(88))];
                placeTextField.delegate = self;
                placeTextField.placeholder = @"请输入地点";
                self.placeTextField = placeTextField;
                [cell.contentView addSubview:placeTextField];
                break;
            }
            case 2:{
                cell.imageView.image = [UIImage imageNamed:@"peopleNum"];
                cell.textLabel.text = @"人数:";
                UITextField *peopleTextField = [[UITextField alloc] initWithFrame:ccr(RELATIVE_WIDTH(220), RELATIVE_HEIGHT(2), RELATIVE_WIDTH(500), RELATIVE_WIDTH(88))];
                peopleTextField.keyboardType = UIKeyboardTypeNumberPad;
                peopleTextField.placeholder = @"请输入人数";
                peopleTextField.delegate = self;
                self.peopleTextField = peopleTextField;
                [cell.contentView addSubview:peopleTextField];
                break;
            }
            case 3:{
                cell.imageView.image = [UIImage imageNamed:@"main"];
                cell.textLabel.text = @"主题:";
                UITextField *mainTextField = [[UITextField alloc] initWithFrame:ccr(RELATIVE_WIDTH(220), RELATIVE_HEIGHT(2), RELATIVE_WIDTH(500), RELATIVE_WIDTH(88))];
                mainTextField.placeholder = @"请输入主题";
                mainTextField.delegate = self;
                self.mainTextField = mainTextField;
                [cell.contentView addSubview:mainTextField];
                break;
            }
            case 4:{
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

- (void)clickBtn{
    
}

- (void)startBtnClick{
    NSLog(@"点击了按钮");
    XjwDatePickerView *pickerView = [XjwDatePickerView XjwDatePickerWithHeadTitle:@"开始时间" AndCall:^(XjwDatePickerView *datePickerView, NSString *choiceString) {
        [self.startBtn setTitle:choiceString forState:UIControlStateNormal];
    }];
    [pickerView show];
}

- (void)endBtnClick{
    NSLog(@"点击了按钮");
    XjwDatePickerView *pickerView = [XjwDatePickerView XjwDatePickerWithHeadTitle:@"结束时间" AndCall:^(XjwDatePickerView *datePickerView, NSString *choiceString) {
        [self.endBtn setTitle:choiceString forState:UIControlStateNormal];
        [pickerView dismissPicker];
    }];
    [pickerView show];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 4) {
        return 30;
    }
    return 10;
}

//点击return 按钮 去掉
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_placeTextField resignFirstResponder];
    [_peopleTextField resignFirstResponder];
    [_mainTextField resignFirstResponder];
    return YES;
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_placeTextField resignFirstResponder];
    [_peopleTextField resignFirstResponder];
    [_mainTextField resignFirstResponder];
}

@end
