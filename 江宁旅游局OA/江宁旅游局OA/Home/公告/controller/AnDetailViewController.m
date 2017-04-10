//
//  AnDetailViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/29.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "AnDetailViewController.h"
#import "AppConstants.h"
#import "IHKeyboardAvoiding.h"
#import "zySheetPickerView.h"
@interface AnDetailViewController ()
@property (nonatomic ,strong)  UIButton *seletedBtn;
@end

@implementation AnDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"公告详情";
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self seletedBtnView];
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
    UILabel *titleLabel= [[UILabel alloc] initWithFrame:ccr(5, 0, SCREEN_WIDTH, 44)];
    titleLabel.text = @"公告标题";
    UITextView *detailTextView = [[UITextView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, 200)];
    
    detailTextView.font = [UIFont systemFontOfSize:20];
    detailTextView.text = @"这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告这是一条测试公告";
    detailTextView.editable = NO;
    
    //首行缩进
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 3;    //行间距
    //    paragraphStyle.maximumLineHeight = 60;   /**最大行高*/
    paragraphStyle.firstLineHeadIndent = 30.f;    /**首行缩进宽度*/
    paragraphStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:18],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    detailTextView.attributedText = [[NSAttributedString alloc] initWithString:detailTextView.text attributes:attributes];
    
    switch (indexPath.section) {
        case 0:
             [cell.contentView addSubview:titleLabel];
            break;
        case 1:
            [cell.contentView addSubview:detailTextView];
            break;
        case 2:
            [cell.contentView addSubview:self.seletedBtn];
            break;
        case 3:{
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:{
            return 44;
            break;
        }
        case 1:{
            return 200;
            break;
        }
        default:
            break;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)seletedBtnView{
    self.seletedBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,44)];
    [self.seletedBtn setImage:[UIImage imageNamed:@"comboDownArrow.png"] forState:UIControlStateNormal];
    [self.seletedBtn setImageEdgeInsets:UIEdgeInsetsMake(2, 210, 2, 30)];
    self.seletedBtn.backgroundColor = [UIColor whiteColor];
    [self.seletedBtn setTitleColor:XHColor(110, 112, 119) forState:UIControlStateNormal];
    [self.seletedBtn setTitle:@"公告类型" forState:UIControlStateNormal];
    [self.seletedBtn addTarget:self action:@selector(selectedBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)selectedBtnClick{
    NSArray * str  = @[@"科室公告",@"全体公告"];
    zySheetPickerView *pickerView = [zySheetPickerView ZYSheetStringPickerWithTitle:str andHeadTitle:@"公告类型" Andcall:^(zySheetPickerView *pickerView, NSString *choiceString) {
        [self.seletedBtn setTitle:choiceString forState:UIControlStateNormal];
        [pickerView dismissPicker];
    }];
    [pickerView show];
}




@end
