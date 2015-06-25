//
//  RecommendViewController.m
//  TEST_UI_6.19
//
//  Created by rimi on 15/6/19.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "RecommendViewController.h"
#import "DetaiViewController.h"

@interface RecommendViewController ()

@property(strong ,nonatomic) NSArray  *imageArray;
@property(assign,nonatomic) NSInteger index;
@property(strong, nonatomic)NSTimer     *timer;

- (void)initializeInterFace;


@end

@implementation RecommendViewController

- (void)viewWillAppear:(BOOL)animated {
    
    //计时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(blockAnimation) userInfo:nil repeats:YES];
}

- (void)blockAnimation {
    
    static NSInteger i = 0;
    
    UIButton *button = (UIButton *)[self.view viewWithTag:100 + i % 5];
    
    //设置button旋转动画
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:button cache:YES];
        
    } completion:^(BOOL finished) {
        
    }];
    
    i++;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    //关闭计时器
    [_timer invalidate];
    _timer = nil;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeInterFace];
}

- (void)initializeInterFace
{
//    self.title = @"推荐";
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.bounds = CGRectMake(0, 0, 100, 100);
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text =@"推荐";
    self.navigationItem.titleView = titleLabel;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:22], NSFontAttributeName, nil]];
    
    self.index = 0;
    //图片数组名
    NSArray *imageArray = @[@"theplace_coffee_logo", @"starbucks_coffee_logo", @"man_coffee_logo", @"winshare_logo", @"goodwoods_coffee_logo", @""];
    //外层循环表示行数
    for (int i = 0; i < 2; i ++) {
        for (int j = 0; j < 3; j ++) { //内层循环表示列数
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10 + 120 * j, 100 + 120 * i, 100, 100);
            [button setImage:[ UIImage imageNamed:imageArray[i * 3 + j]] forState:UIControlStateNormal];
           //设置tag
            button.tag = 100 + i * 3 + j;
            //添加点击事件
            [button addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
            
        }
    }
    //开始动画
//    [self startAnimation];
    
}


//- (void)buttonPress:(UIButton *)sender {
//    
//    DownViewController *dvc = [[DownViewController alloc] init];
//    
//    int index = (int)sender.tag - 100;
//    //根据tag值给button加图片
//    dvc.photoImageView.image = [UIImage imageNamed:_imagePushList[index]];
//    
//    //根据text文本获取文字
//    NSString * str = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:_textPush[index] ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
//    
//    dvc.textView.text = str;
//    
//    //页面推送
//    [self.navigationController pushViewController:dvc animated:YES];
//    
//}

//图标点击事件
- (void)handleButtonEvent:(UIButton *)sender
{
    DetaiViewController *detail = [[DetaiViewController alloc]init];
    detail.title = @"详情";
    
    if (sender.tag == 100) {
        
        detail.image = [UIImage imageNamed:@"theplace_coffee_detail"];
        detail.String = @"\nthe place\n\n毕业一年多的时间里\n为着梦想一直奋斗，坚持\n初始，在星巴克工作半年\n偶然一个机会\n与合伙人决定开一间小小咖啡馆\n就这样The Place渐渐的成形了\n\n不知不觉中，The Place已经试运营三个月了\n只希望趁这个小小的机会\n感谢这一路走来朋友们的支持\n给予The Place的认可及建议\n每次看见朋友们\n将The Place分享给身边的朋友\n带着爱的眼光欣赏着The Place里的每一样东西\n懂得我们的用心\n为我们的用心而感动时\n我们更感动\n\n同时我们也发现\n朋友们比我们更能发现The Place的美\n下面分享一些朋友们的分享给大家\n\n再次感谢每一位到访过The Place的朋友\n---- 小佳 ";
    } else if (sender.tag == 101) {
    
        detail.image = [UIImage imageNamed:@"starbucks_coffee_detail"];
        detail.String = @"\n\n星巴克\n\n星巴克（Starbucks）是美国一家连锁咖啡公司的名称，1971年成立，为全球最大的咖啡连锁店，其总部坐落美国华盛顿州西雅图市。星巴克旗下零售产品包括30多款全球顶级的咖啡豆、手工制作的浓缩咖啡和多款咖啡冷热饮料、新鲜美味的各式糕点食品以及丰富多样的咖啡机、咖啡杯等商品。星巴克在全球范围内已经有近12,000间分店遍布北美、南美洲、欧洲、中东及太平洋区。2012年3月，星巴克在美国的两款甜点被曝用胭脂虫当着色剂，专家称或令哮喘者过敏。2012年4月，星巴克表示停用该着色剂。";
    } else if (sender.tag == 102) {
        
        detail.image = [UIImage imageNamed:@"man_coffee_detail"];
        detail.String = @"\n\n漫咖啡\n\nMAAN COFFEE漫咖啡一直本着为人们提供最优雅的休息环境、高品质的咖啡甜点，培养最有素养的专业服务人员来开设高档次咖啡店。自第一家MAAN COFFEE漫咖啡店营业以来漫咖啡的品质以及服务...漫咖啡取自中文词汇“浪漫”中的“漫”字意指浪漫，同时在现代的快节奏生活中漫咖啡希望以自己的特色提供人们一个放松、悠闲的“慢”空间。漫咖啡以安逸自由、崇尚自然别具一格的设计理念，在自然的元素上添加了土耳其、东南亚风格的灯饰，搭配形式各异的座椅，让顾客体验咖啡文化新理念、让所有人享受浪漫和空闲时光。";
    } else if (sender.tag == 103) {
        
        detail.image = [UIImage imageNamed:@"winshare_detail"];
        detail.String = @"\n\n良木缘\n\n良木缘自1998年创牌发展至今，在成都及北京、西安、重庆、厦门、武汉、拉萨等全国主要城市已有近70家直营店和特许加盟连锁店，成为目前最具实力的咖啡饮料连锁零售企业之一。 公司依据协业与分业的原则，以强势的品牌形象、浓郁的文化氛围、准确的市场定位、独特的运作模式全面启动咖啡连锁市场，以咖啡馆为载体，为顾客倾心营造亲切、温馨、文化、优雅的第三生活空间。";
    
    } else {
        
        detail.image = [UIImage imageNamed:@"goodwoods_coffee.detail"];
        detail.String = @"\n\n轩客会\n\n新华文轩旗下子品牌“轩客会·格调书店”，以“都市文化客厅”为打造目标。“在浓厚的生活艺术氛围中，读者不但再无老式书店一座难求的烦恼，还可以在店内书吧品尝进口红茶、西式茶点，享受“慢读生活新体验”。新华文轩计划在3年内投入1.5亿元在全省范围内建立100家类似书店。";
    }
    
    [self.navigationController pushViewController:detail animated:YES];
    
    
    
}


//- (void)startAnimation
//{
//    //高级动画
//    //    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.rotaion.y"];
//    //    basic.toValue = @(M_PI);
//    //    basic.duration = 1;
//    //    basic.repeatCount = 20;
//    //    basic.autoreverses = YES;
//    //    [self.button.layer addAnimation:basic forKey:@""];
//    
//    //动画块
////    [UIView transitionWithView:@"position" duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
////        self.transform = CGAffineTransformIdentity;
////        
////    } completion:nil];
//    //设置开始标识
//    [UIView beginAnimations:@"position" context:nil];
//    //配置动画延时
//    [UIView setAnimationDelay:0];
//    //配置动画时长
//    [UIView setAnimationDuration:1];
//    //配置动画线性规律
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//    //设置代理
//    [UIView setAnimationDelegate:self];
//    //动画执行逻辑
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self.view viewWithTag:100 + _index % 5] cache:YES];
//    //提交动画
//    [UIView commitAnimations];
//
//
//}

//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
//{
//    [self startAnimation];
//    _index ++;
//}

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
