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
{
    UIImageView *_button;
    BOOL        _timerRunning;
    NSArray     *imageArrays;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    imageArrays = @[@"coffee_h.png",@"dine_h.png",@"exercise_h.png",@"exp_person_normal",@"famou_school",@"ktv_h",@"movie_h",@"other_h",@"shopping_h",@"travel_h"];
    
    
    
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

-(void)createButtons
{
    
}


#pragma mark - 给View添加动画
-(void)addAnimateToView:(UIView *)Aview
{
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    buttonAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
    buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(2.0f, 2.0f)];
    buttonAnimation.springBounciness = 25.0;
    buttonAnimation.springSpeed = 13.0;
    [Aview pop_addAnimation:buttonAnimation forKey:@"pop"];
    /* Set the property that you want to animate, like...
     kPOPLayerBackgroundColor;
     kPOPLayerBounds;
     kPOPLayerPosition;
     kPOPLayerPositionX;
     kPOPLayerPositionY;
     kPOPLayerOpacity;
     kPOPLayerScaleX;
     kPOPLayerScaleY;
     kPOPLayerScaleXY;
     kPOPLayerTranslationX;
     kPOPLayerTranslationY;
     kPOPLayerTranslationZ;
     kPOPLayerTranslationXY;
     kPOPLayerSubscaleXY;
     kPOPLayerSubtranslationX;
     kPOPLayerSubtranslationY;
     kPOPLayerSubtranslationZ;
     kPOPLayerSubtranslationXY;
     kPOPLayerZPosition;
     kPOPLayerSize;
     kPOPLayerRotation;
     kPOPLayerRotationY;
     kPOPLayerRotationX;
     
     kPOPViewAlpha;
     kPOPViewBackgroundColor;
     kPOPViewBounds;
     kPOPViewCenter;
     kPOPViewFrame;
     kPOPViewScaleX;
     kPOPViewScaleXY;
     kPOPViewScaleY;
     kPOPViewSize; */
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
