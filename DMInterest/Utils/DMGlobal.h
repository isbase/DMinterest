//
//  DMGlobal.h
//  DMInterest
//
//  Created by DEMAI on 14-11-25.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "JSONKit.h"
#import "BaseViewController.h"
#import "Utils.h"

#define URL_SERVER_BASE         @"http://www.baidu.com/"


//单例
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}