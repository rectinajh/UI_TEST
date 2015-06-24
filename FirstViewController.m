//
//  FirstViewController.m
//  TEST_UI_6.19
//
//  Created by rimi on 15/6/19.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@interface FirstViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) NSArray           *datasource;
@property (nonatomic, strong) UIScrollView      *scrollView;
@property (nonatomic, strong) UIImageView       *imageView;

- (void)initializeDataSource;
- (void)initializeInterFace;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeInterFace];
    [self initializeDataSource];

   
}
//初始化数据
- (void)initializeDataSource
{
    _datasource = @[[UIImage imageNamed:@"首页1"],[UIImage imageNamed:@"首页2"],[UIImage imageNamed:@"首页3"]];
}

- (void)initializeInterFace
{
    
    //设置标题
    self.title = @"乐行于蜀";
    
    //设置导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.482 green:0.000 blue:0.005 alpha:1.000];
    
    // 获取当前视图宽度
    CGFloat width = CGRectGetWidth(self.view.bounds);
     // 获取当前视图高度
    CGFloat heigth = CGRectGetHeight(self.view.bounds);
    
    // 创建整个视图并设置设置内容的大小
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, heigth)];
    _scrollView.contentSize = CGSizeMake(width, 1140);
    [self.view addSubview:_scrollView];
    
    // 创建可变图片视图
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
    // 设置显示图片
    _imageView.image = _datasource[0];
    // 添加到视图
    [_scrollView addSubview:_imageView];
    // 设置时间，响应事件：根据时间切换图片
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleTimerEvent:) userInfo:nil repeats:YES];
    
    // 创建第一个文本描述
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, width, 100)];
    firstLabel.text = @"成都，简称“蓉”，四川省省会，副省级市，国家区域中心城市（西南），1993年被国务院确定为西南地区的科技、商贸、金融中心和交通及通信枢纽，综合实力西部第一。";
    // 设置行数
    firstLabel.numberOfLines = 0;
    //添加到视图
    [_scrollView addSubview:firstLabel];
    
    // 创建首页1图片视图
    UIImageView *firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, width, 200)];
    //设置显示图片
    [firstImageView setImage:[UIImage imageNamed:@"首页1"]];
    //添加到视图
    [_scrollView addSubview:firstImageView];
    
    // 创建第2个文本标签
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 500, width, 100)];
    secondLabel.text = @"成都位于中国华西地区东部，西南地区最大平原——成都平原腹地，境内地势平坦、河网纵横、物产丰富、水系发达，自古就有“天府之国”的美誉，是国家首批历史文化名城和中国最佳旅游城市。";
    // 设置行数
    secondLabel.numberOfLines = 0;
    //添加到视图
    [_scrollView addSubview:secondLabel];
    
    // 创建首页2图片视图
    UIImageView *secondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 600, width, 200)];
    //设置显示图片
    [secondImageView setImage:[UIImage imageNamed:@"首页2"]];
    //添加到视图
    [_scrollView addSubview:secondImageView];
    
    // 创建第3个文本标签
    UILabel *thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 800, width, 140)];
    thirdLabel.text = @"成都有着4500余年的文明史，2600年左右的建城史。三国蜀汉、五代前后蜀及北宋李顺、明末张献忠大西等割据政权先后在此建都，唐朝和中华民国时曾作为临时首都而存在。早在北宋年间成都人联合发行了世界最早的纸币“交子”，官府在成都设立了世界最早的管理储蓄银行“交子务”。";
     // 设置行数
    thirdLabel.numberOfLines = 0;
     //添加到视图
    [_scrollView addSubview:thirdLabel];
    
    // 创建首页3图片视图
    UIImageView *thirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 940, width, 200)];
    //设置显示图片
    [thirdImageView setImage:[UIImage imageNamed:@"首页3"]];
    //添加到视图
    [_scrollView addSubview:thirdImageView];
    
}

//Timer响应事件
- (void)handleTimerEvent:(NSTimer *)timer
{
    static int i = 1;
    _imageView.image = _datasource[i++ % _datasource.count];
}

@end
