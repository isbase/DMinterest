//
//  HomeViewController.m
//  DMInterest
//
//  Created by Today on 14-12-3.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "HomeViewController.h"
#import "HttpTools.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array = @[@"4.1",@"9",@"45E3DF03-A649-4CD5-ABF2-5EEE93DB4D75",@"iPhone",@"15701545235",@"xiaohei",@""];
    NSDictionary *dic = @{@"method":@"loginbusiness",@"params":array,@"id":@"20141126152904997"};
    
    
    [HttpTools get:@"baidu" params:dic success:^(id responseObj) {
        NSLog(@"%@",responseObj);
        NSDictionary *dict = [responseObj objectFromJSONString];
        NSLog(@"%@  ===   %@",dict,dict[@"error"][@"message"]);
    } failure:^(NSError *error) {
        NSLog(@"error");
    }];
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
