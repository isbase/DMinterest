//
//  MainViewController.m
//  DMInterest
//
//  Created by DEMAI on 14-11-26.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "MainViewController.h"
#import "HttpTools.h"

@implementation MainViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array = @[@"4.1",@"9",@"45E3DF03-A649-4CD5-ABF2-5EEE93DB4D75",@"iPhone",@"15701545235",@"xiaohei",@""];
    NSDictionary *dic = @{@"method":@"loginbusiness",@"params":array,@"id":@"20141126152904997"};
    
    
    [HttpTools get:@"http://service.demai.com/api/loginbusiness" params:dic success:^(id responseObj) {
        NSLog(@"%@",responseObj);
        NSDictionary *dict = [responseObj objectFromJSONString];
        NSLog(@"%@  ===   %@",dict,dict[@"error"][@"message"]);
    } failure:^(NSError *error) {
        NSLog(@"error");
    }];
}

@end
