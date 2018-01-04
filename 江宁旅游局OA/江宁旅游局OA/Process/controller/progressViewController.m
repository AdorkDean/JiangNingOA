//
//  progressViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/10.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "progressViewController.h"
#import "XLScrollViewer.h"
#import "wfaView.h"
#import "adwView.h"
#import "hbcView.h"
@interface progressViewController ()<wfaViewDelegate,adwViewDelegate,hbcViewDelegate>

@end

@implementation progressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    CGRect rect = [[UIApplication sharedApplication] statusBarFrame];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    wfaView *WFAvc = [[wfaView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    WFAvc.wfaDelegate = self;
    adwView *ADWvc = [[adwView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    ADWvc.adwDelegate = self;
    hbcView *HBCvc = [[hbcView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    HBCvc.hbcDelegate = self;
    //把视图和标题放入数组
    NSArray *viewNames = @[WFAvc,ADWvc,HBCvc];
    NSArray *buttonNames = @[@"待 审 核",@"处 理 中",@"已 完 成"];
    
    XLScrollViewer *scroll = [XLScrollViewer scrollWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withViews:viewNames withButtonNames:buttonNames withThreeAnimation:211];
    
    
    scroll.xl_topBackImage = [UIImage imageNamed:@"navi"];
    //scroll.xl_topBackColor = XHColor(52, 182, 211);
    scroll.xl_buttonColorNormal = XHColor(30, 39, 48);
    scroll.xl_buttonColorSelected = XHColor(255, 255, 255);
    
    //可通过加View给两个选项按钮直接加分割线
    [self.view addSubview:scroll];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)clickWFAsection:(NSIndexPath *)indexpath{
    
}

- (void)clickADWsection:(NSIndexPath *)indexpath{
    
}

-(void)clickHBCsection:(NSIndexPath *)indexpath{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
