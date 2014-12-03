//
//  HomeViewController.m
//  DMInterest
//
//  Created by Today on 14-12-3.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "HomeViewController.h"
#import "HttpTools.h"
#import "POP/POP.h"

@interface HomeViewController ()
{
    UIImageView *_button;
    BOOL        _timerRunning;
}

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
    
    _button = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TimerButton"]];
    [_button setFrame:CGRectMake(240, 50, 46, 46)];
    [self.view addSubview:_button];
    
    
    
    _timerRunning = NO;
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(demoAnimate:)]];
    
    
}

#pragma mark - test Code
- (void)demoAnimate:(UITapGestureRecognizer*)tap
{
    _timerRunning = !_timerRunning;
    
    /* Timer enlarge / shrink animation
     I've spelled out the different options available in comments
     Feel free to delete them when you get it */
    
    /* Create the animation, choose from
     
     POPBasicAnimation (traditional) - defaultAnimation, linearAnimation, easeInAnimation, easeOutAnimation, easeInEaseOutAnimation
     
     POPDecayAnimation - animation, animationWithPropertyNamed:(NSString *)name;
     
     POPSpringAnimation (bouncy) - animation, animationWithPropertyNamed:(NSString *)name;
     
     POPCustomAnimation - advanced, for custom animation types */
    
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    
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
    
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerSize];
    
    // These have to be objects so use NSNumber for single values and NSValue for multiple values (CGSize for two, CGRect for four)
    // Size has x and y values so we need two values, hence CGSize...
    if (_timerRunning) {
        buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(30, 30)];
    }
    else {
        buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(80, 80)];
    }
    
    
    //Set any relevant attributes
    
    // Basic: duration (CFTimeInterval)
    // Decay: duration (CFTimeInterval), velocity (NSValue), deceleration (CGFloat)
    // Spring: velocity (NSValue), springBounciness (CGFloat), springSpeed (CGFloat), dynamicsTension (CGFloat), dynamicsFriction (CGFloat), dynamicsMass (CGFloat)
    
    // Use bounciness / speed together. Only use values from 0 to 12
    buttonAnimation.springBounciness = 25.0;
    buttonAnimation.springSpeed = 13.0;
    
    // or for more advanced control
        //buttonAnimation.dynamicsTension = 15.0;     //张力
        //buttonAnimation.dynamicsFriction = 2.0;     //摩擦力
        //buttonAnimation.dynamicsMass = .2;
    
    //Add it to the target to play the animation for a unique key
    [_button pop_addAnimation:buttonAnimation forKey:@"pop"];
    
    
    /* SlideOut animation */
//    
//    POPSpringAnimation *popOutAnimation = [POPSpringAnimation animation];
//    popOutAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
//    if (!_timerRunning) {
//        popOutAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(245, 70, 0, 10)];
//        // It is not a good idea to use absolute values like this but it makes it easier to demo
//    }
//    else {
//        popOutAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(180, 60, 75, 26)];
//    }
//    
//    popOutAnimation.velocity = [NSValue valueWithCGRect:CGRectMake(200, 0, 300, -200)];
//    popOutAnimation.springBounciness = 10.0;
//    popOutAnimation.springSpeed = 10.0;
//    
//    [_popOut pop_addAnimation:popOutAnimation forKey:@"slide"];
    
    
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
