//
//  NextViewController.m
//  UI_TEST
//
//  Created by rimi on 15/6/24.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageList = [[NSMutableArray alloc]init];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = _titleString;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = _titleString;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetMaxX(self.view.bounds), CGRectGetMidY(self.view.bounds)- 100)];
    
    _scrollView.backgroundColor = [UIColor blackColor];
    
    //取消横向指示器
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    for (NSInteger i = 0; i < 3; i++) {
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * CGRectGetWidth(self.view.bounds), -64, CGRectGetWidth(_scrollView.bounds), CGRectGetHeight(_scrollView.bounds))];
        //图片缩放模式
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_imageView setImage:[UIImage imageNamed:_imageList[i]]];
        
        [_scrollView addSubview:_imageView];
        
    }
    
    //滚动视图的大小
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds) * 3, 0);
    //设置分页效果
    _scrollView.pagingEnabled = YES;
    
    [self.view addSubview:_scrollView];
    
    //滚动的文字视图
    _textView.frame = CGRectMake(0, 320, 375, 400);
    
    _textView.font = [UIFont systemFontOfSize:17];
    
    //textView不能编辑
    _textView.editable = NO;
    
    [self.view addSubview:_textView];
    
                                                                
                                                                
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
