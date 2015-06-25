//
//  MoreViewController.m
//  
//
//  Created by rimi on 15/6/19.
//
//

#import "MoreViewController.h"
#import "UserData.h"

@interface MoreViewController ()

- (void)initializeInterFace;

@property(strong ,nonatomic)UserData *userData;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeInterFace];
}


- (void)initializeInterFace
{
//    self.title = @"更多";
    //初始化单例
    _userData = [UserData shareInstance];
    
    //导航栏文字
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.text = @"更多";
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:22], NSFontAttributeName, nil]];
    
   
    
    //三，创建UIImageView
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(80, 80, 200, 170)];
//    image.bounds = CGRectMake(0, 0, 200, 180);
//    image.center = CGPointMake(CGRectGetMidX(self.view.bounds), 200);
    [image setImage:[UIImage imageNamed:@"logo3.png"]];
    image.layer.cornerRadius = 40;
    [self.view addSubview:image];
    
    //显示Versionlabel
    UILabel * versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 280,
                                                                       150, 20)];
    [versionLabel setText:@"vision 1.0 by RIMI"];
    [versionLabel setTextAlignment:NSTextAlignmentCenter];
    [versionLabel setFont:[UIFont systemFontOfSize:15]];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.textColor = [UIColor grayColor];
    [self.view addSubview:versionLabel];
    
    //显示账号label
    UILabel * adminLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 360,
                                                                    200, 30)];
    [adminLabel setText:@"账号:"];
    [self.view addSubview:adminLabel];
    
    //用户名
    UILabel *nameLabelText = [[UILabel alloc] initWithFrame:CGRectMake(80 + 80, CGRectGetMidY(self.view.bounds) + 30, 60, 30)];
    nameLabelText.text = _userData.name;
    [self.view addSubview:nameLabelText];
    
    //显示账号label
    UILabel * passWordLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 400,
                                                                     200, 30)];
    [passWordLabel setText:@"密码:"];
    [self.view addSubview:passWordLabel];
    
    //密码
    UILabel *passwordLabelText = [[UILabel alloc] initWithFrame:CGRectMake(80 + 80, CGRectGetMidY(self.view.bounds) + 80, 60, 30)];
    passwordLabelText.text = _userData.password;
    [self.view addSubview:passwordLabelText];
    
    //音量调节label
    UILabel * VolumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 480,
                                                                        100, 30)];
    [VolumeLabel setText:@"音量调节:"];
    [self.view addSubview:VolumeLabel];
    
    //slider
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 483, 200, 20)];
    [self.view addSubview:slider];
    //slider初始化位置
    slider.value = 0.5;
    slider.minimumValue = 0;
    slider.maximumValue = 1;
    //音乐初始音量
    _userData.audioPlayer.volume = 0.5;
    
    //设置色调
    slider.maximumTrackTintColor = [UIColor grayColor];
    slider.minimumTrackTintColor = [UIColor redColor];
    
    //添加事件
    [slider addTarget:self action:@selector(handleEvent:) forControlEvents:UIControlEventValueChanged];
    

}

- (void)handleEvent:(UISlider *)slider
{
    _userData.audioPlayer.volume = slider.value;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
