//
//  CustomTableViewCell.h
//  UI_TEST
//
//  Created by rimi on 15/6/24.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ScenicImage;
@property (weak, nonatomic) IBOutlet UILabel *SightSpotLabel;
@property (weak, nonatomic) IBOutlet UILabel *ContactNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *AddressLabel;

@end
