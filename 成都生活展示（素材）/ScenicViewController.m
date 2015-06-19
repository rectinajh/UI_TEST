//
//  ScenicViewController.m
//  TEST_UI_6.19
//
//  Created by rimi on 15/6/19.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "ScenicViewController.h"

@interface ScenicViewController ()
- (void)initializeInterFace;


@end

@implementation ScenicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeInterFace];
}


- (void)initializeInterFace
{
    self.title = @"景点";


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
