//
//  dateTableViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/11/8.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "dataTableViewController.h"
#import "AppConstants.h"
#import "dataButton.h"

#import "KLWebViewController.h"
#import "KSWebViewController.h"
#import "KYWebViewController.h"
#import "JWWebViewController.h"
#import "ZLWebViewController.h"
@interface dataTableViewController ()<UIWebViewDelegate>
@property (nonatomic ,strong)  UIView *headerView;
@property (nonatomic ,strong)  UIWebView *webView;
@property (nonatomic ,strong)  UIView *footView;
@property (nonatomic ,strong)  UIView *opaqueView;
@property (nonatomic ,strong)  UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic ,strong)  NSArray *titleArr;
@property (nonatomic ,strong)  NSArray *imageArr;
@end

@implementation dataTableViewController

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"游客属性分析",@"客流分析",@"客源分析",@"驻留时长分析",@"境外游客分析"];
    }
    return _titleArr;
}

- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"attribute",@"traffic",@"source",@"reside",@"world"];
    }
    return _imageArr;
}

- (void)viewDidLoad {
    self.automaticallyAdjustsScrollViewInsets = false;
    [super viewDidLoad];
    
    [self creatHeadView];
    [self creatWebView];
    [self creatFootView];
}


- (void)creatHeadView{
    UIView *headView = [[UIView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, RELATIVE_HEIGHT(200))];
    
    UILabel *yesterdayNum = [[UILabel alloc] initWithFrame:xjw(30, 35, 80, 20)];
    yesterdayNum.text = @"68585";
    yesterdayNum.font = [UIFont systemFontOfSize:20.0];
    [headView addSubview:yesterdayNum];
    
    UILabel *yesterdayText = [[UILabel alloc] initWithFrame:ccr(30, GG_BOTTOM_Y(yesterdayNum) + 10, 80, 15)];
    yesterdayText.text = @"昨日客流";
    yesterdayText.textColor = [UIColor lightGrayColor];
    yesterdayText.font = [UIFont systemFontOfSize:15];
    [headView addSubview:yesterdayText];
    
    UIView *divider1 = [[UIView alloc] initWithFrame:ccr(GG_RIGHT_X(yesterdayNum) + 10, 35, 1, 45)];
    divider1.backgroundColor = [UIColor blackColor];
    [headView addSubview:divider1];
    
    UILabel *todayNum = [[UILabel alloc] initWithFrame:ccr(GG_RIGHT_X(divider1) + 30, 35, 80, 20)];
    todayNum.text = @"585456";
    todayNum.font = [UIFont systemFontOfSize:20.0];
    [headView addSubview:todayNum];
    
    UILabel *todayText = [[UILabel alloc] initWithFrame:ccr(todayNum.x, GG_BOTTOM_Y(todayNum) + 10, 80, 15)];
    todayText.text = @"今日客流";
    todayText.textColor = [UIColor lightGrayColor];
    todayText.font = [UIFont systemFontOfSize:15];
    [headView addSubview:todayText];
    
    UIView *divider2 = [[UIView alloc] initWithFrame:ccr(GG_RIGHT_X(todayNum) + 10, 35, 1, 45)];
    divider2.backgroundColor = [UIColor blackColor];
    [headView addSubview:divider2];
    
    UILabel *nowNum = [[UILabel alloc] initWithFrame:ccr(GG_RIGHT_X(divider2) + 30, 35, 80, 20)];
    nowNum.text = @"565623";
    nowNum.font = [UIFont systemFontOfSize:20.0];
    [headView addSubview:nowNum];
    
    UILabel *nowText = [[UILabel alloc] initWithFrame:ccr(nowNum.x, todayText.y, 80, 15)];
    nowText.text = @"实时客流";
    nowText.font = [UIFont systemFontOfSize:15.0];
    nowText.textColor = [UIColor lightGrayColor];
    [headView addSubview:nowText];
    
    self.headerView = headView;
}

- (void)creatWebView{
    _webView = [[UIWebView alloc]initWithFrame:ccr(0, 0, SCREEN_WIDTH, RELATIVE_HEIGHT(530))];
    [_webView setUserInteractionEnabled:YES];//是否支持交互
    //[webView setDelegate:self];
    _webView.delegate=self;
    _webView.scrollView.bounces = NO;
    [_webView setOpaque:NO];//opaque是不透明的意思
    [_webView setScalesPageToFit:YES];//自动缩放以适应屏幕
    [self.view addSubview:_webView];
 

    //加载网页的方式
    //1.创建并加载远程网页
//    NSURL *url = [NSURL URLWithString:HTTP_CONECT(HTML_URL, @"/hadoopMainPage")];
    NSURL *url = [NSURL URLWithString:@"https://baidu.com/"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    //2.加载本地文件资源
    // NSURL *url = [NSURL fileURLWithPath:filePath];
     NSURLRequest *request = [NSURLRequest requestWithURL:url];
     [_webView loadRequest:request];
    //3.读入一个HTML，直接写入一个HTML代码
    //NSString *htmlPath = [[[NSBundle mainBundle]bundlePath]stringByAppendingString:@"webapp/loadar.html"];
    //NSString *htmlString = [NSString stringWithContentsOfURL:htmlPath encoding:NSUTF8StringEncoding error:NULL];
    //[webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:htmlPath]];

    _opaqueView = [[UIView alloc]initWithFrame:ccr(0, 0, SCREEN_WIDTH, RELATIVE_HEIGHT(530))];
    _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:ccr(0, 0, SCREEN_WIDTH, RELATIVE_HEIGHT(530))];
    [_activityIndicatorView setCenter:_opaqueView.center];
    [_activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [_opaqueView setBackgroundColor:XHColor(245, 245, 245)];
    //[_opaqueView setAlpha:0.2];
    [self.webView addSubview:_opaqueView];
    [_opaqueView addSubview:_activityIndicatorView];

    
    
}

#pragma mark -- WebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIndicatorView startAnimating];
    _opaqueView.hidden = NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicatorView stopAnimating];
    _opaqueView.hidden = YES;
}
/*
//UIWebView如何判断 HTTP 404 等错误
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSURL *url = [NSURL URLWithString:@"https://baidu.com"];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if ((([httpResponse statusCode]/100) == 2)) {
        // self.earthquakeData = [NSMutableData data];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        [ _webView loadRequest:[ NSURLRequest requestWithURL: url]];
        _webView.delegate = self;
    } else {
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:
                                  NSLocalizedString(@"HTTP Error",
                                                    @"Error message displayed when receving a connection error.")
                                                             forKey:NSLocalizedDescriptionKey];
        NSError *error = [NSError errorWithDomain:@"HTTP" code:[httpResponse statusCode] userInfo:userInfo];
        
        if ([error code] == 404) {
            NSLog(@"xx");
            _webView.hidden = YES;
        }
        
    }
}
*/


- (void)creatFootView{
    UIView *footView = [[UIView alloc] initWithFrame:ccr(0, 0, SCREEN_WIDTH, RELATIVE_HEIGHT(472))];
    for (int i = 0; i < 5; i ++) {
        CGFloat width = RELATIVE_WIDTH(250);
        CGFloat height = RELATIVE_HEIGHT(250);
        CGFloat y = RELATIVE_HEIGHT(20);
        
        dataButton *button = [dataButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        [button setImage:[UIImage imageNamed:self.imageArr[i]] forState:UIControlStateNormal];
        [button setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:XHColor(34, 35, 36) forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:RELATIVE_WIDTH(25)];
        button.frame = ccr(width * (i % 3),y + (i / 3) * height, width, height);
        
        [button addTarget:self action:@selector(clickDataButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        [footView addSubview:button];
        self.footView = footView;
    }
    
}

- (void)clickDataButtonAction:(UIButton *)sender{
    switch (sender.tag ) {
        case 100:{
            KSWebViewController *ksWeb = [KSWebViewController new];
            [self.navigationController pushViewController:ksWeb animated:YES];
            break;
        }
        case 101:{
            KLWebViewController *klWeb = [KLWebViewController new];
            [self.navigationController pushViewController:klWeb animated:YES];
            break;
        }
        case 102:{
            KYWebViewController *kyWeb = [KYWebViewController new];
            [self.navigationController pushViewController:kyWeb animated:YES];
            break;
        }
        case 103:{
            ZLWebViewController *zlWeb = [ZLWebViewController new];
            [self.navigationController pushViewController:zlWeb animated:YES];
            break;
        }
            
        case 104:{
            JWWebViewController *jwWeb = [JWWebViewController new];
            [self.navigationController pushViewController:jwWeb animated:YES];
            break;
        }
            
        default:
            break;
    }
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
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
        case 0:
            [cell.contentView addSubview:self.headerView];
            break;
            
        case 1:
            [cell.contentView addSubview:self.webView];
            break;
        
        case 2:
            [cell.contentView addSubview:self.footView];
            break;
        default:
            break;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    };
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return RELATIVE_HEIGHT(530);
    }else if (indexPath.section == 2){
        return RELATIVE_HEIGHT(504);
    }
    return RELATIVE_HEIGHT(180);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
