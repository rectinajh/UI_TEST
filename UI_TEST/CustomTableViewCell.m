//
//  CustomTableViewCell.m
//  UI_TEST
//
//  Created by rimi on 15/6/24.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    //设置图片阴影
    _ScenicImage.layer.shadowColor = [UIColor grayColor].CGColor;
    _ScenicImage.layer.shadowOffset = CGSizeMake(2, 2);
    _ScenicImage.layer.shadowOpacity = 2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
