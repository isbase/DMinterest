//
//  UIView+Annimate.m
//  DMInterest
//
//  Created by Today on 14-12-6.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "UIView+Annimate.h"
#import "POP.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIView (Annimate)




#pragma mark - 给View添加动画
-(void)addScaleAnimaton
{
    self.hidden = NO;
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerScaleXY];
    buttonAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
    buttonAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
    buttonAnimation.springBounciness = 25.0;
    buttonAnimation.springSpeed = 15.0;
   // self performSelector:@selector(pop_addAnimation:forKey:) withObject:buttonAnimation afterDelay:dely
    //[self performSelector:@selector(pop_addAnimation:forKey:) withObject:@[buttonAnimation,@"test"] afterDelay:delyTime];
    [self.layer pop_addAnimation:buttonAnimation forKey:@"pop"];
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


@end
