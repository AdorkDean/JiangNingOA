//
//  homeViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/11.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "homeViewController.h"
#import "announcementView.h"
#import "newsView.h"
#import "anTableView.h"
#import "newsTableView.h"
#import "myButton.h"
#import "CalenderView.h"

#import "announceTableViewController.h"
#import "MeetingViewController.h"
#import "AssetsChooseViewController.h"
#import "ReturnAssetsViewController.h"

#import "LogListViewController.h"

@interface homeViewController ()<UIScrollViewDelegate>
@property (nonatomic ,strong)  UIScrollView *headView;
@property (nonatomic ,strong)  UISegmentedControl *segment;
@property (nonatomic ,strong)  UILabel *timeLabel;
@property (nonatomic ,strong)  UIImageView *anImageView;
@property (nonatomic ,strong)  UIImageView *newsImageView;
@property (nonatomic ,strong)  UITableView *anTableView;
@property (nonatomic ,strong)  UITableView *newsTableView;
@property (nonatomic ,strong)  UIButton *segementBtn1;
@property (nonatomic ,strong)  UIButton *segementBtn2;
@property (nonatomic ,strong)  NSArray *titleArr;
@property (nonatomic ,strong)  NSArray *imageArr;
@property (nonatomic ,strong)  UIView *workView;

@end

@implementation homeViewController

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"公    告",@"会议室申请",@"资产领用",@"资产返库",@"请    假",@"工作日志"];
    }
    return _titleArr;
}

- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"processAnnounce",@"meetingRoomReservation",@"fixedAssets",@"recipentsAssets",@"askLeave",@"log"];
    }
    return _imageArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    //self.view.backgroundColor = XHColor(235, 235, 241);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   // self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self creatUI];
    [self creatHeadView];
}

- (void)creatUI{
    UIScrollView *headView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, RELATIVE_HEIGHT(440))];
    headView.backgroundColor = [UIColor clearColor];
    headView.delegate = self;
    headView.bounces = NO;
    headView.pagingEnabled = YES;
    headView.directionalLockEnabled = YES;
   // headView.contentInset = UIEdgeInsetsMake(RELATIVE_HEIGHT(-40), 0,RELATIVE_WIDTH(-200), 0);
    headView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, RELATIVE_HEIGHT(440));
    headView.showsHorizontalScrollIndicator = NO;
    headView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:headView];
    self.headView = headView;
    //公告
    announcementView *announceView = [[announcementView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,RELATIVE_HEIGHT(440))];
    [self.headView addSubview:announceView];
    
    self.anImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"announce"]];
    self.anImageView.frame = xjw(10, 70, 130, 140);
    [announceView addSubview:self.anImageView];
    
    anTableView *anview = [[anTableView alloc] initWithFrame:xjw(135, 80, 230, 120)];
    [announceView addSubview:anview];
    
    //新闻
    newsView *newView = [[newsView alloc] initWithFrame:CGRectMake( SCREEN_WIDTH, 0, SCREEN_WIDTH, RELATIVE_HEIGHT(440))];
    [self.headView addSubview:newView];
    
    self.newsImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"announce"]];
    self.newsImageView.frame = xjw(10, 70, 130, 140);
    [newView addSubview:_newsImageView];
    
    newsTableView *newTableView = [[newsTableView alloc] initWithFrame:xjw(135, 80, 230, 120)];
    [newView addSubview:newTableView];
}


//头部视图
- (void)creatHeadView{
    //选择按钮
    UISegmentedControl *segement = [[UISegmentedControl alloc] initWithItems:@[@"公 告",@"新 闻"]];
    segement.selectedSegmentIndex = 0;
    [segement addTarget:self action:@selector(segmentBtnClick) forControlEvents:UIControlEventValueChanged];
    segement.tintColor = [UIColor whiteColor];
    segement.frame = xjw(15, 0, 200, 40);
    _segment = segement;
    [self.view addSubview:self.segment];
    
    self.segementBtn1 = [[UIButton alloc] initWithFrame:xjw(82, 12, 16, 16)];
    [self.segementBtn1 setBackgroundImage:[UIImage imageNamed:@"dropBtn1"] forState:UIControlStateNormal];
    [self.segementBtn1 setBackgroundImage:[UIImage imageNamed:@"dropBtn2"] forState:UIControlStateSelected];
    [self.segementBtn1 addTarget:self action:@selector(clickSegement1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.segementBtn1];
    
    //时间label
    UIView *workView = [[UIView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, RELATIVE_HEIGHT(460))];
    UILabel *time = [[UILabel alloc] initWithFrame:xjw(_segment.x + _segment.width + 15, 0, 140, 40)];
    time.textAlignment = NSTextAlignmentCenter;
    time.font = [UIFont systemFontOfSize:RELATIVE_HEIGHT(36)];
    //time.backgroundColor = [UIColor redColor];
    time.textColor = [UIColor whiteColor];
   // NSData *currentDate = [NSData data];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY年MM月dd日"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    time.text = dateString;
    _timeLabel = time;
    [self.view addSubview:_timeLabel];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:xjw(10, 10, 40, 10)];
    lab.font = [UIFont systemFontOfSize:10.0f];
    lab.textColor = XHColor(87, 88, 89);
    lab.text = @"工作区";
    [workView addSubview:lab];
    for (int i = 0; i < 6; i ++) {
        CGFloat width = RELATIVE_WIDTH(250);
        CGFloat height = RELATIVE_HEIGHT(200);
        CGFloat y = GG_BOTTOM_Y(lab) + RELATIVE_HEIGHT(20);
        
        myButton *button = [myButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        [button setImage:[UIImage imageNamed:self.imageArr[i]] forState:UIControlStateNormal];
        [button setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:XHColor(34, 35, 36) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:RELATIVE_WIDTH(25)];
        button.frame = ccr(width * (i % 3),y + (i / 3) * height, width, height);
        
        [button addTarget:self action:@selector(clickFunctionButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        [workView addSubview:button];
        self.workView = workView;
        
    }
    
}




- (void)clickSegement1:(UIButton *)sender{
    
    
}

- (void)clickFunctionButtonAction:(UIButton *)button{
    switch (button.tag ) {
        case 100:{
            announceTableViewController *announceVC = [announceTableViewController new];
            [self.navigationController pushViewController:announceVC animated:YES];
            self.navigationController.navigationBarHidden = NO;
            break;
        }
        case 101:{
            MeetingViewController *meetVC = [MeetingViewController new];
            [self.navigationController pushViewController:meetVC animated:YES];
            self.navigationController.navigationBarHidden = NO;
            break;
        }
        case 102:{
            AssetsChooseViewController *aclVC= [AssetsChooseViewController new];
            [self.navigationController pushViewController:aclVC animated:YES];
            self.navigationController.navigationBarHidden = NO;
            break;
        }
        case 103:{
            ReturnAssetsViewController *RAVC= [ReturnAssetsViewController new];
            [self.navigationController pushViewController:RAVC animated:YES];
            self.navigationController.navigationBarHidden = NO;
            break;
        }
        case 104:
            NSLog(@"这是请假");
            break;
            
        case 105:{
            LogListViewController *LLvc = [LogListViewController new];
            [self.navigationController pushViewController:LLvc animated:YES];
            self.navigationController.navigationBarHidden = NO;
            break;
        }
        default:
            break;
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    self.segment.selectedSegmentIndex = offset/SCREEN_WIDTH;
}


- (void)segmentBtnClick{
    
    self.headView.contentOffset = CGPointMake(self.segment.selectedSegmentIndex * SCREEN_WIDTH, 0);
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:YES];
}


#pragma mark -- UITableViewDateSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        [cell.contentView addSubview:self.headView];
    }else if (indexPath.section == 1){
        UILabel *lab = [[UILabel alloc] initWithFrame:xjw(10, 10, 80, 10)];
        lab.font = [UIFont systemFontOfSize:10.0f];
        lab.textColor = XHColor(87, 88, 89);
        lab.text = @"工作日志";
        [cell.contentView addSubview:lab];
        CalenderView *calender = [[CalenderView alloc]initWithFrame:CGRectMake(RELATIVE_WIDTH(20), RELATIVE_HEIGHT(60), SCREEN_WIDTH - 20, ((SCREEN_WIDTH - 20) / 7) * 5 + 50)];
        [cell.contentView addSubview:calender];
        
    }else if (indexPath.section == 2){
        
            [cell.contentView addSubview:self.workView];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return RELATIVE_HEIGHT(680);
    }else if (indexPath.section == 2){
        return RELATIVE_HEIGHT(460);
    }
    return RELATIVE_HEIGHT(400);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
