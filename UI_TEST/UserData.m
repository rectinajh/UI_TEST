//
//  UserData.m
//  UI_TEST
//
//  Created by rimi on 15/6/24.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "UserData.h"


static UserData *userData = nil;


@implementation UserData

+ (UserData *)shareInstance {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        userData = [[UserData alloc] init];
    });
    return userData;
}



@end
