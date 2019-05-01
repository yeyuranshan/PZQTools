//
//  AnimationKit.m
//  FullShareTop
//
//  Created by lqq on 17/3/28.
//  Copyright © 2017年 FSB. All rights reserved.
//

#import "AnimationKit.h"

@implementation AnimationKit

/**
 永久闪烁的动画
 
 */
+(CABasicAnimation *)opacityForeverAnimation:(float)time
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
    animation.autoreverses = YES;
    animation.duration = time;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];///没有的话是均匀的动画。
    return animation;
}
@end
