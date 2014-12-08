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

@interface HomeViewController ()
{
    UIImageView *_button;
    BOOL        _timerRunning;
    NSArray     *imageArrays;
    NSMutableArray     *buttons;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    buttons = [NSMutableArray array];
    
    imageArrays = @[@"coffee_h.png",@"dine_h.png",@"exercise_h.png",@"exp_person_normal",@"famou_school",@"ktv_h",@"movie_h",@"other_h",@"shopping_h",@"travel_h"];

    [self createButtons];
    //[self addAnimations];
}

-(void)createButtons
{
    static CGFloat delyTime = 0.2;
    
    NSInteger cols = 4;
    CGFloat width = 62.0f;
    for (int i = 0; i < imageArrays.count; i++) {
        CGFloat x = i % cols;
        CGFloat y = i / cols;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(15 + x * (width + 15), 70 + y * (width + 15), width, width);
        [button setBackgroundImage:[UIImage imageNamed:imageArrays[i]] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button setHidden:YES];
        //[button performSelector:@selector(addScaleAnimaton) withObject:nil afterDelay:0.2 + (i/8.0f)];
        [self performSelector:@selector(creataAnnimates:) withObject:button afterDelay:delyTime];
        delyTime += 0.3;
       // [buttons addObject:button];
    }
}

-(void)addAnimations
{
    for (int i = 0; i < buttons.count; i++) {
        static CGFloat delyTime = 0.2;
        [buttons[i] performSelector:@selector(addScaleAnimaton) withObject:nil afterDelay:0.2 + (i/10.0f)];
        delyTime += 0.1;
    }
}

-(void)creataAnnimates:(UIButton *)button
{
    [button setHidden:NO];
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
    buttonAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
    buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
    buttonAnimation.springBounciness = 25.0;
   // buttonAnimation.springSpeed = 15.0;
    [button.layer pop_addAnimation:buttonAnimation forKey:@"pop"];
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
