//
//  UserData.h
//  UI_TEST
//
//  Created by rimi on 15/6/24.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface UserData : NSObject
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *password;



+ (UserData *)shareInstance;
@end
