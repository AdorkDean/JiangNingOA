//
//  loginViewController.m
//  江宁旅游局OA
//
//  Created by 欣华pro on 2016/10/19.
//  Copyright © 2016年 xujw. All rights reserved.
//

#import "loginViewController.h"
#import "TabbarViewController.h"
#import "JMAnimationButton.h"
#import "LKBubbleView.h"
#import "MBProgressHUD.h"
#import "JWHttpTool.h"
#import "AFNetworking.h"
#import "KeychainItemWrapper.h"
#import "IHKeyboardAvoiding.h"
#import "LoginModel.h"
#import "MJExtension.h"
@interface loginViewController () <JMAnimationButtonDelegate,UITextFieldDelegate>
@property (nonatomic ,strong)  UIImageView *loginView;
@property (nonatomic ,strong)  UIImageView *iocnView;
@property (nonatomic ,strong)  UIImageView *accountView;
@property (nonatomic ,strong)  UIImageView *pwdView;
@property (nonatomic ,strong)  UIImageView *inputView1;
@property (nonatomic ,strong)  UIImageView *inputView2;
@property (nonatomic ,strong)  UITextField *accTextFiled;
@property (nonatomic ,strong)  UITextField *pwdTextFiled;
@property (nonatomic ,weak)  JMAnimationButton *loginBtn;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITextField appearance]setTintColor:[UIColor whiteColor]];
    [self creatUI];
    
    self.accTextFiled.delegate = self;
    self.pwdTextFiled.delegate = self;
    [IHKeyboardAvoiding setAvoidingView:self.view withTarget:self.accTextFiled];
    [IHKeyboardAvoiding setAvoidingView:self.view withTarget:self.pwdTextFiled];
    [self.view endEditing:YES];
    [self getPwd];
}

//读取保存的用户名
- (void)getPwd{
    KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 通过同样的标志创建keychain
    // 获取对应Key里保存的用户名和密码
    NSString *username = [keychain objectForKey:(__bridge id)(kSecAttrAccount)];
    NSString *password = [keychain objectForKey:(__bridge id)(kSecValueData)];
    // 显示
    self.accTextFiled.text = username;
    self.pwdTextFiled.text = password;
    
}
//保存用户名
- (void)getUserMsg{
    NSString *username = self.accTextFiled.text;// 获取输入的用户名
    NSString *password = self.pwdTextFiled.text;// 获取输入的密码
    if (![username isEqualToString:@""] && ![password isEqualToString:@""]) {// 非空则保存
        KeychainItemWrapper *keychain = [[KeychainItemWrapper alloc] initWithIdentifier:@"Login" accessGroup:nil];// 1
        //         [keychain setObject:ServiceName forKey:(id)kSecAttrService];
        [keychain setObject:username forKey:(__bridge id)(kSecAttrAccount)];// 2
        [keychain setObject:password forKey:(__bridge id)(kSecValueData)];// 3
    }
}


- (void)creatUI{
    self.loginView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.loginView.image = [UIImage imageNamed:@"login3"];
    [self.view addSubview:self.loginView];
    
    self.iocnView = [[UIImageView alloc] initWithFrame:ccr(RELATIVE_WIDTH(236), RELATIVE_HEIGHT(148), RELATIVE_WIDTH(300), RELATIVE_HEIGHT(300))];
    self.iocnView.image = [UIImage imageNamed:@"iocn_white"];
    [self.view addSubview:self.iocnView];
    
    self.accountView = [[UIImageView alloc] initWithFrame:ccr(RELATIVE_WIDTH(80), GG_BOTTOM_Y(self.iocnView) + RELATIVE_HEIGHT(40), RELATIVE_WIDTH(60), RELATIVE_HEIGHT(60))];
    self.accountView.image = [UIImage imageNamed:@"account"];
    [self.view addSubview:self.accountView];
    
    self.accTextFiled = [[UITextField alloc] initWithFrame:ccr(GG_RIGHT_X(self.accountView) + RELATIVE_WIDTH(10), self.accountView.y, RELATIVE_WIDTH(500), RELATIVE_HEIGHT(60))];
    self.accTextFiled.textColor = [UIColor whiteColor];
    self.accTextFiled.placeholder = @"请输入账号";
    //关闭首个字母大写
    self.accTextFiled.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.accTextFiled.font = [UIFont systemFontOfSize:20];
    self.accTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.accTextFiled];
    
    
    self.inputView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.accountView.x, GG_BOTTOM_Y(self.accountView) + RELATIVE_HEIGHT(30), RELATIVE_WIDTH(600), RELATIVE_HEIGHT(3))];
    self.inputView1.backgroundColor = [UIColor whiteColor];
   
    [self.view addSubview:self.inputView1];
    
    self.pwdView = [[UIImageView alloc] initWithFrame:ccr(self.accountView.x , GG_BOTTOM_Y(self.inputView1) + RELATIVE_HEIGHT(80), RELATIVE_WIDTH(60), RELATIVE_HEIGHT(60))];
    self.pwdView.image = [UIImage imageNamed:@"pwd"];
    [self.view addSubview:self.pwdView];
    
    self.pwdTextFiled = [[UITextField alloc] initWithFrame:ccr(GG_RIGHT_X(self.pwdView) + RELATIVE_WIDTH(10), self.pwdView.y, RELATIVE_WIDTH(500), RELATIVE_HEIGHT(60))];
    self.pwdTextFiled.textColor = [UIColor whiteColor];
    self.pwdTextFiled.placeholder = @"请输入密码";
    self.pwdTextFiled.secureTextEntry = YES;
    self.pwdTextFiled.font = [UIFont systemFontOfSize:20];
     self.pwdTextFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.pwdTextFiled];
    
    self.inputView2 = [[UIImageView alloc] initWithFrame:ccr(self.pwdView.x, GG_BOTTOM_Y(self.pwdView) + RELATIVE_HEIGHT(30), RELATIVE_WIDTH(600), RELATIVE_HEIGHT(3))];
    self.inputView2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.inputView2];
    
    JMAnimationButton *logBtn = [JMAnimationButton new];
    logBtn = [JMAnimationButton buttonWithFrame:ccr(self.pwdView.x + RELATIVE_WIDTH(6), GG_BOTTOM_Y(self.inputView2) + RELATIVE_HEIGHT(80), RELATIVE_WIDTH(588), RELATIVE_HEIGHT(90))];
    self.loginBtn = logBtn;
    logBtn.delegate = self;
    logBtn.backgroundColor = [UIColor whiteColor];
    [logBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [logBtn setTitleColor:XHColor(63, 177, 179) forState:UIControlStateNormal];
   // [logBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
   // self.loginBtn.layer.cornerRadius = 20.0;
    [logBtn addTarget:self action:@selector(clickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logBtn];
    
}


- (void)clickLoginBtn:(JMAnimationButton *)button{
    [button startAnimation];
    TabbarViewController *tabbarVC = [TabbarViewController new];
    [self presentViewController:tabbarVC animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark JMAnimationButtonDelegate
-(void)JMAnimationButtonDidStartAnimation:(JMAnimationButton *)JMAnimationButton{
    NSLog(@"start");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [JMAnimationButton stopAnimation];
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"userAcc"] = self.accTextFiled.text;
        params[@"userPwd"] = self.pwdTextFiled.text;
        /*
        [JWHttpTool post:HTTP_CONECT(BASE_URL, @"/login/appLogin") params:params success:^(id json) {
            NSLog(@"%@",json);
            
            LoginModel *log = [LoginModel mj_objectWithKeyValues:json];
            NSString *userName = log.currUser.userName;
            NSString *massage = log.massage;
            NSLog(@"%@",massage);
            NSLog(@"登录人%@",userName);
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:userName forKey:@"userName"];
            
            NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
            NSString *path = [doc stringByAppendingPathComponent:@"sessionId.archive"];
            LoginModel *logModel = [LoginModel sessionIdWithDict:json];
            [NSKeyedArchiver archiveRootObject:logModel toFile:path];
            if (massage != NULL) {
                //            [MBProgressHUD hideHUD];
                UIAlertController *alertCtrl =[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请输入正确的用户名或密码" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *btnAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertCtrl addAction:btnAction];
                [self presentViewController:alertCtrl animated:YES completion:nil];
            }else{
                // [MBProgressHUD hideHUD];
                 [JMAnimationButton stopAnimation];
                NSLog(@"跳转页面");
                TabbarViewController *tabbarVC = [TabbarViewController new];
                [self presentViewController:tabbarVC animated:YES completion:nil];
            }
        } failure:^(NSError *error) {
            LKBubbleInfo *iconInfo = [[LKBubbleInfo alloc] init];
            // 把图标数组里面设置只有一张图片即可单图固定图标
            iconInfo.iconArray = @[[UIImage imageNamed: @"lkbubble-warning"]];
            iconInfo.backgroundColor = [UIColor colorWithRed: 0.95 green:0.95 blue:0.95 alpha:1];
            iconInfo.titleColor = [UIColor darkGrayColor];
            iconInfo.locationStyle = BUBBLE_LOCATION_STYLE_BOTTOM;
            iconInfo.layoutStyle = BUBBLE_LAYOUT_STYLE_ICON_LEFT_TITLE_RIGHT;
            iconInfo.title = @"网络连接超时！";
            iconInfo.proportionOfDeviation = 0.05;
            iconInfo.bubbleSize = CGSizeMake(150, 30);
            [[LKBubbleView defaultBubbleView] showWithInfo: iconInfo autoCloseTime: 2];
        [JMAnimationButton stopAnimation];
            NSLog(@"登陆请求失败-%@",error);
        }];
      */
    });
}


-(void)JMAnimationButtonWillFinishAnimation:(JMAnimationButton *)JMAnimationButton{
    if (JMAnimationButton == self.loginBtn) {
    }
    
}

-(void)JMAnimationButtonDidFinishAnimation:(JMAnimationButton *)JMAnimationButton{
    NSLog(@"stop");
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击return 按钮 去掉
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_accTextFiled resignFirstResponder];
    [_pwdTextFiled resignFirstResponder];
    return YES;
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.accTextFiled resignFirstResponder];
    [self.pwdTextFiled resignFirstResponder];
}

@end
