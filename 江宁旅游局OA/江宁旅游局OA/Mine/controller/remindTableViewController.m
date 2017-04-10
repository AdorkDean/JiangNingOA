//
//  remindTableViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/7.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "remindTableViewController.h"
#import "AppConstants.h"
@interface remindTableViewController ()
@property (nonatomic ,strong)  NSArray *nameArr;
@property (nonatomic ,strong)  NSArray *imgArr;
@property (nonatomic ,strong)  UISwitch *switchView;
@property (nonatomic ,assign)  BOOL bool1;

@end

@implementation remindTableViewController

- (NSArray *)nameArr{
    if (!_nameArr) {
        self.nameArr = @[@"流程提醒",@"回复提醒",@"公告提醒"];
    }
    return _nameArr;
}

- (NSArray *)imgArr{
    if (!_imgArr) {
        self.imgArr = @[@"liucheng",@"huifu",@"gonggao"];
    }
    return _imgArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //去除底部多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.title = @"提醒设置";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 65, RELATIVE_HEIGHT(14), RELATIVE_WIDTH(200), RELATIVE_HEIGHT(60))];
            [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:switchView];
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            NSMutableArray *Arr = [NSMutableArray arrayWithArray:[user objectForKey:@"switchTP"]];
            _bool1 = Arr[0];
            _switchView.on = _bool1;
            cell.imageView.image = [UIImage imageNamed:@"tixing"];
            cell.textLabel.text = @"消息提醒";
        }
    }else if (indexPath.section == 1){
        _switchView = [[UISwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 65, RELATIVE_HEIGHT(14), RELATIVE_WIDTH(200), RELATIVE_HEIGHT(60))];
        [_switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        [cell.contentView addSubview:_switchView];
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSMutableArray *Arr = [NSMutableArray arrayWithArray:[user objectForKey:@"switchTP"]];
       
        switch (indexPath.row) {
            case 0:
                _switchView.on = Arr[1];
                break;
            case 1:
                _switchView.on = Arr[2];
                break;
            case 2:
                _switchView.on = Arr[3];
                break;
            default:
                break;
        }
        cell.imageView.image = [UIImage imageNamed:self.imgArr[indexPath.row]];
        cell.textLabel.text = self.nameArr[indexPath.row];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)switchAction:(id)sender{
   // _bool1 = !_bool1;
    
   // [NSUserDefaults standardUserDefaults] setBool:<#(BOOL)#> forKey:@"switchTP"];
    
    
   // _switchView.on = _bool1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
