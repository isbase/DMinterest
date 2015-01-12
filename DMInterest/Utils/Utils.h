//
//  Utils.h
//  DMInterest
//
//  Created by Today on 14-12-3.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import <Foundation/Foundation.h>


#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0f ? YES : NO)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0f ? YES : NO)
#define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue]>=6.0f ? YES : NO)


#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define Screen_OffsetY ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0f ? 20.0 : 0.0)

#define IOS7NAVHEIGHT 64.0f


#define kNavigationBar_Height   ((IOS6)?44.0f:44.0f)
#define kNavigationBar_Offset   ((IOS6)?(44.0 - 38.0):0)

#define DMFontYuan     [UIFont fontWithName:@"YouYuan" size:17]

@interface Utils : NSObject

@end
