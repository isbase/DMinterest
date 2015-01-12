//
//  BaseViewController.m
//  DMInterest
//
//  Created by DEMAI on 14-12-10.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController (){
    
    UIView *CustitleView;
}

@end

@implementation BaseViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    CustitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth,kNavigationBar_Height + Screen_OffsetY)];
    CustitleView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:CustitleView];
}

@end
