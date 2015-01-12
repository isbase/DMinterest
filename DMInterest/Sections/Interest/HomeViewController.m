//
//  HomeViewController.m
//  DMInterest
//
//  Created by Today on 14-12-3.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "HomeViewController.h"
#import "HttpTools.h"
#import "UIView+Annimate.h"
#import "TTTAttributedLabel.h"

@interface HomeViewController ()
{
    NSMutableArray *fontsArray;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, Screen_OffsetY + kNavigationBar_Height + 10, 280, 20)];
//    lable.textAlignment = NSTextAlignmentLeft;
//    lable.textColor = [UIColor blackColor];
//    lable.text = @"此刻我正在...";
//    lable.font = DMFontYuan;
//    lable.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:lable];
    
    UILabel *lalbe = ({
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, Screen_OffsetY + kNavigationBar_Height + 10, 280, 80)];
        lable.textAlignment = NSTextAlignmentLeft;
        lable.numberOfLines = 0;
        lable.lineBreakMode = NSLineBreakByCharWrapping;
        lable.textColor = [UIColor blackColor];
        lable.text = @"今年是蒸脸器年，朋友圈销售很火，拐点出现在范冰冰蒸面微博的当天，然后不久出现一个范冰冰同款（也就是杨幂这款），其实冰冰微博根本没有出现任何机器，这到底是事先预谋好的，还是厂家抓住的商机？之后出现张馨予晒蒸脸器，被厂家拉去代言，再后面杨幂粉墨登场， 这一步步的真是，这事和我没关吧？<blue>文字颜色文字颜色<blue>";
        lable.font = DMFontYuan;
        lable.backgroundColor = [UIColor clearColor];
        lable;
    });
    
    [self.view addSubview:lalbe];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
