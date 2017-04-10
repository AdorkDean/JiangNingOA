//
//  DropViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2017/1/4.
//  Copyright © 2017年 xujw. All rights reserved.
//

#import "DropViewController.h"

@interface DropViewController ()
@property (nonatomic ,strong)  NSArray *localArr;
@end

@implementation DropViewController

- (NSArray *)localArr{
    if (!_localArr) {
        _localArr = @[@"明文化村",@"牛首山旅游区",@"银杏湖休闲度假景区",@"黄龙岘",@"石塘人家",@"大塘金", @"紫清湖生态旅游温泉度假区"];
    }
    return _localArr;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor grayColor];
    //去掉右边的滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
   // self.tableView.scrollEnabled = NO;
    [self.tableView setSeparatorColor:[UIColor darkGrayColor]];
    //改变分割线的颜色必须要加上这一句！！！！！
    [ self.tableView setSeparatorInset : UIEdgeInsetsZero ];
    //self.tableView.separatorInset = UIEdgeInsetsMake(0,20, 0, 20);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  self.localArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.contentView.backgroundColor = [UIColor grayColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize: 13];
    cell.textLabel.text = self.localArr[indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 26;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *localName = self.localArr[indexPath.row];
    NSLog(@"%@",localName);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
