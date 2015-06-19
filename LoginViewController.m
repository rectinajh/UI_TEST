//
//  ViewController.m
//  TEST_UI_6.19
//
//  Created by rimi on 15/6/19.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "LoginViewController.h"
#import "FirstViewController.h"
#import "RecommendViewController.h"
#import "ScenicViewController.h"
#import "MoreViewController.h"

// 引入相应的框架
@import AVFoundation;

@interface LoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate,AVAudioPlayerDelegate>

@property (strong, nonatomic) UITextField *usernameTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;
@property(strong,nonatomic)AVAudioPlayer        *player;


- (void)initializeUserInterface;
- (void)initializeDataSource;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeUserInterface];
    [self initializeDataSource];
}

- (void)initializeDataSource
{
    //1,创建URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"background" withExtension:@"mp3"];
    //2,创建player
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    //放入缓存池
    [self.player  prepareToPlay];
    //设置代理
    self.player.delegate = self;
    //设置音量(0-1)
    self.player.volume = 0.1;
    
}

- (void)initializeUserInterface
{
    //创建登录框及属性
    self.usernameTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, 280, self.view.frame.size.width-60, 40)];
    self.passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(30, 330, self.view.frame.size.width-60, 40)];
    
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.usernameTextField];
    
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    //设置样式属性
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;//圆角
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    //设置提示文字属性
    self.usernameTextField.placeholder = @"请输入用户名";
    self.passwordTextField.placeholder = @"请输入密码";
    
    //设置文字颜色属性
    self.usernameTextField.textColor = [UIColor blackColor];
    self.passwordTextField.textColor = [UIColor blackColor];
    
    //设置文字字体属性
    self.usernameTextField.font = [UIFont boldSystemFontOfSize:20.0f];
    self.passwordTextField.font = [UIFont boldSystemFontOfSize:20.0f];
    
    //设置输入键盘样式属性
    self.usernameTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.passwordTextField.keyboardType = UIKeyboardTypeDefault;
    
    //设置输入键盘样式属性
    self.usernameTextField.returnKeyType = UIReturnKeyNext;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    
    //密码内容安全输入
    self.passwordTextField.secureTextEntry = YES;
    
    //创建登录button及属性
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(30, 400, self.view.frame.size.width-60, 40);
    loginButton.backgroundColor = [UIColor colorWithRed:0.559 green:0.006 blue:0.018 alpha:1.000];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    
    [loginButton addTarget:self action:@selector(LoginButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    loginButton.layer.cornerRadius = 6;
    
    //三，创建UIImageView及属性
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(80, 80, 200, 170)];
    [image setImage:[UIImage imageNamed:@"logo3.png"]];
    
    image.layer.cornerRadius = 40;
    [self.view addSubview:image];

    
}

//限制字符串长度
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length + string.length > 10) {
        
        return NO;
    }
    return YES;
}

//点击return取消虚拟键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //失去焦点
    [textField resignFirstResponder];
    return YES;
}

//点击空白处取消虚拟键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}

- (void)LoginButtonEvent:(UIButton*)sender
{ //执行时取消虚拟键盘
    [self.view endEditing:YES];
    
    //添加活动指示器
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView setBounds:CGRectMake(0, 0, 30, 30)];
    [indicatorView setCenter:CGPointMake(190, 350)];
    [self.view addSubview:indicatorView];
    
    //设置停止的时候是否影藏（默认是YES）
    indicatorView.hidesWhenStopped = YES;
    
    //开启动画
    [indicatorView startAnimating];
    
    //进行关联
    self.indicatorView = indicatorView;
    
    //判断用户名和密码是否正确
    if ([[NSString stringWithFormat:@"admin"] isEqualToString:_usernameTextField.text] && [[NSString stringWithFormat:@"123456"] isEqualToString:_passwordTextField.text]) {
        
        //延迟调用方法
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
#pragma mark - 音效播放
            NSURL *url = [[NSBundle mainBundle] URLForResource:@"music_success" withExtension:@"caf"];
            //2.创建音乐播放ID变量
            SystemSoundID systemID = 0;
            //3. 进行函数调用创建系统音乐ID
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url),&systemID);
            //4.进行音效播放
            AudioServicesPlaySystemSound(systemID);
            
#pragma mark - 视图跳转
            FirstViewController *first = [[FirstViewController alloc]init];
            RecommendViewController *recommend = [[RecommendViewController alloc]init];
            
            ScenicViewController *scenic = [[ScenicViewController alloc]init];
            MoreViewController *more = [[MoreViewController alloc]init];
            
            UINavigationController *naviFirst = [[UINavigationController alloc]initWithRootViewController:first];
            naviFirst.navigationBar.barTintColor = [UIColor colorWithRed:0.628 green:0.000 blue:0.007 alpha:1.000];
            
            UINavigationController *naviSecond =[[UINavigationController alloc]initWithRootViewController:recommend];
            naviSecond.navigationBar.barTintColor = [UIColor colorWithRed:0.628 green:0.000 blue:0.007 alpha:1.000];
            
            UINavigationController *naviThird =[[UINavigationController alloc]initWithRootViewController:scenic];
            naviThird.navigationBar.barTintColor = [UIColor colorWithRed:0.628 green:0.000 blue:0.007 alpha:1.000];
            
            UINavigationController *naviFouth =[[UINavigationController alloc]initWithRootViewController:more];
            naviFouth.navigationBar.barTintColor = [UIColor colorWithRed:0.628 green:0.000 blue:0.007 alpha:1.000];
            
            //设置子控制器集合
            UITabBarController *tabBarController = [[UITabBarController alloc]init];
            tabBarController.viewControllers =@[naviFirst,naviSecond,naviThird,naviFouth];
            
            NSDictionary *arribute =
            @{
              //设置字体属性
              NSFontAttributeName:[UIFont systemFontOfSize:25],
              // 设置颜色
              NSForegroundColorAttributeName:[UIColor whiteColor],
              };
        
            //设置文本属性字典
            naviFirst.navigationBar.titleTextAttributes =arribute;
            naviSecond.navigationBar.titleTextAttributes =arribute;
            
            naviThird.navigationBar.titleTextAttributes =arribute;
            naviFouth.navigationBar.titleTextAttributes =arribute;
            
            [self presentViewController:tabBarController animated:NO completion:nil];
           
            //添加图片
            UIImage *firstImage = [UIImage imageNamed:@"icon_menu_hp_selected"];
            UIImage *recomendImage = [UIImage imageNamed:@"icon_menu_ihave_selected"];
            UIImage *scenicImage   = [UIImage imageNamed:@"icon_menu_profile_selected"];
            UIImage *moreImage = [UIImage imageNamed:@"icon_menu_ihave_selected"];
            
            //配置文本颜色
            tabBarController.tabBar.tintColor = [UIColor whiteColor];
            
            //标签栏颜色
            tabBarController.tabBar.barTintColor = [UIColor colorWithRed:0.628 green:0.000 blue:0.007 alpha:1.000];
            
            //创建标签栏按钮
            UITabBarItem *firstItem  = [[UITabBarItem alloc] initWithTitle:@"乐行于蜀" image:firstImage tag:10];
            UITabBarItem *recommendItem  = [[UITabBarItem alloc] initWithTitle:@"推荐" image:recomendImage tag:20];
            
            UITabBarItem *scenicItem  = [[UITabBarItem alloc] initWithTitle:@"景点" image:scenicImage tag:30];
            UITabBarItem *moreItem = [[UITabBarItem alloc] initWithTitle:@"更多" image:moreImage tag:40];
            
            //对应各个控制器
            first.tabBarItem = firstItem;
            recommend.tabBarItem = recommendItem;
            scenic.tabBarItem = scenicItem;
            more.tabBarItem = moreItem;
            
            //关闭动画
            [self.indicatorView stopAnimating];
            
#pragma mark - 背景音乐播放
            if ([self.player isPlaying]) {
                [self.player pause];
            } else {
                [self.player play];
            }
            
        });
        
    } else if ([self.usernameTextField.text length] == 0 || [self.passwordTextField.text length] == 0) {
        
        //关闭动画
        [self.indicatorView stopAnimating];
        
        //警告框，需要遵守协议：<UIAlertViewDelegate>
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请输入用户名和密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        
        //展示
        [alertView show];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"music_fail" withExtension:@"mp3"];
        //2.创建音乐播放ID变量
        SystemSoundID systemID = 0;
        //3. 进行函数调用创建系统音乐ID
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url),&systemID);
        //4.进行音效播放
        AudioServicesPlaySystemSound(systemID);
        
    } else {
        
        //延迟调用方法
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            NSURL *url = [[NSBundle mainBundle] URLForResource:@"music_fail" withExtension:@"mp3"];
            //2.创建音乐播放ID变量
            SystemSoundID systemID = 0;
            //3. 进行函数调用创建系统音乐ID
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url),&systemID);
            //4.进行音效播放
            AudioServicesPlaySystemSound(systemID);
            
            //关闭动画
            [self.indicatorView stopAnimating];
            
            //警告框
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"用户名和密码错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            
            //展示
            [alertView show];
            
        });
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
