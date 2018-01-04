//
//  messageViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/19.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "messageViewController.h"
@interface messageViewController ()
/// 上一个cell的下标
@property (nonatomic, assign) long lastCellIndex;
/// tableview是否已经显示完毕
@property (nonatomic, assign) BOOL isApper;

@end

@implementation messageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消 息";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //去掉tableView的横线
    self.tableView.separatorStyle = NO;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    self.isApper = true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil)
    {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //cell.backgroundColor = XHColor(237, 237, 237);
    }
    
   // UILabel *timeLab = [[UILabel alloc] initWithFrame:xjw(SCREEN_WIDTH / 2 - 55, 10, 110, 10)];
    UILabel *timeLab = [[UILabel alloc] initWithFrame:ccr(SCREEN_WIDTH / 2 - 75, RELATIVE_HEIGHT(20), RELATIVE_WIDTH(300), RELATIVE_HEIGHT(20))];
    timeLab.textAlignment = NSTextAlignmentCenter;
    timeLab.text = @"2016-11-1 20:30:36";
    timeLab.textColor = [UIColor whiteColor];
    timeLab.font = [UIFont systemFontOfSize:10.0f];
    timeLab.backgroundColor = XHColor(110, 111, 112);
    [cell.contentView addSubview:timeLab];
    
    UIImageView *msg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"msg"]];
    //msg.frame = xjw(5, 30, SCREEN_WIDTH - 10,110);
    msg.frame = ccr(RELATIVE_WIDTH(30), RELATIVE_HEIGHT(60), SCREEN_WIDTH - 30,RELATIVE_HEIGHT(220));
    UILabel *lab = [[UILabel alloc] initWithFrame:xjw(10, 40, 300, 30)];
    lab.text = @"这是一条消息";
    [msg addSubview:lab];
    [cell.contentView addSubview:msg];
   // cell.textLabel.text=@"我是一条消息";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


//上下拉粘滞效果
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ((indexPath.row > self.lastCellIndex && self.isApper)||(indexPath.row < self.lastCellIndex && self.isApper)) {
        CATransform3D rotation;
        //可以拉下的距离 20
        rotation =CATransform3DMakeTranslation(0.0, 40, 0.0);
        //        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 1;
        cell.layer.transform = rotation;
        rotation.m43 = 1.0/ -600;
        
        [UIView beginAnimations:@"rotation" context:NULL];
        [UIView setAnimationDuration:1];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [UIView commitAnimations];
        
        //黏滞时间  animateWithDuration:1
        [UIView animateWithDuration:1 animations:^{
            cell.layer.transform = CATransform3DIdentity;
            cell.alpha = 1;
            cell.layer.shadowOffset = CGSizeMake(0, 0);
        }];
    }
    self.lastCellIndex = indexPath.section;
}


/*
//转动效果
//tableView的代理方法。
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
      //转动特效
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;

    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);


    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];



    [UIView animateWithDuration:0.5 animations:^{
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
    }];

}
*/


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RELATIVE_HEIGHT(300);
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
