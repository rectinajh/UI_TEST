
//  DetaiViewController.m
//  UI_TEST
//
//  Created by rimi on 15/6/24.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "DetaiViewController.h"

@interface DetaiViewController ()

- (void) initializeUserInterface;


@end

@implementation DetaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeUserInterface];
}

- (void)initializeUserInterface
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.569 green:0.000 blue:0.006 alpha:1.000];
    NSDictionary *atrributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18 weight:20],
                                NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSShadowAttributeName:[[NSShadow alloc] init]};
    self.navigationController.navigationBar.titleTextAttributes = atrributes;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 2)];
    
    [imageView setImage:self.image];
    [self.view addSubview:imageView];
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) / 2, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 2)]; //设置描述文本
    
    
    textView.font = [UIFont systemFontOfSize:10.0];
    textView.text = self.String;
    textView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    [self.view addSubview:textView];
                                      
    
    

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
